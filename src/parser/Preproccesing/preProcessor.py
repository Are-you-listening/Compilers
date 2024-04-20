from antlr4 import *
from src.antlr_files.grammarCLexer import grammarCLexer
from src.parser.ErrorExporter import *
import os


class PreProcessor:
    def __init__(self, stream: CommonTokenStream, lexer: grammarCLexer, input_file: str):
        self.stream = stream
        self.lexer = lexer
        self.defined = {}
        self.stdio = False
        self.path = PreProcessor.__getPath(input_file)
        self.files = [input_file]
        self.ifndef = []  # Indicated if we passed an #ifndef e.g. [False,True] | We use a list, so we can pop and keep track of 'scoped' "#ifndef"

    @staticmethod
    def __getPath(input_file: str):
        """
        Retrieve the path from an input file
        """
        if '/' in input_file:
            return os.path.dirname(input_file) + '/'  # Dir of the file
        return ""

    def __isDefined(self, identifier: str):
        """
        Check if a given identifier is already defined
        :param identifier:
        :return:
        """
        if len(self.ifndef) == 0:  # If no '#ifndef' is used, we shouldn't check this
            return False
        return identifier in self.defined or identifier in self.files

    def __getValuePart(self, i: int):
        """
        Add all tokens to the value, until
        :param i: Index at which the '#define' started
        :return: j , index of the last token
        """
        i += 2
        token = self.stream.tokens[i]  # Token we're working on
        line = token.line  # Current line number
        value = []
        type = self.lexer.ruleNames[token.type - 1]  # Type of the token in string format

        while type not in ["SINGLECOMMENT", "MULTILINE"] and token.line == line:
            value.append(token)

            i += 1
            token = self.stream.tokens[i]  # Get new token
            type = self.lexer.ruleNames[token.type - 1]

        return value, i

    def preProcess(self):
        """
        Removes all '#' statements and replace them accordingly
        :return: bool: True if it contains "#include <stdio.h>"
        """
        self.stream.fill()
        i = 0  # Iterator index we are at right now in the token stream

        while i < len(self.stream.tokens) - 1:
            token = self.stream.tokens[i]
            token.HIDDEN_CHANNEL = -1  # We use indices to keep track of the file we worked in
            text = token.text
            type = self.lexer.ruleNames[token.type - 1]

            if '#' in text and (type not in ["SINGLECOMMENT", "MULTILINE"]):  # We came across a preprocessor directive
                if "define" in text:
                    identifier = self.stream.tokens[i + 1]
                    if "IDENTIFIER" != self.lexer.ruleNames[identifier.type - 1]:  # Can only use identifiers as macro names!
                        ErrorExporter.nonIdentifierDefine(identifier.line)
                    else:
                        identifier = identifier.text
                    value, j = self.__getValuePart(i)

                    if not self.__isDefined(identifier):  # Make use of any include guards
                        self.defined[identifier] = value  # Add to defined map

                    del self.stream.tokens[i:j]  # Delete the define statement from the list

                    i = j - len(value) - 3  # Adjust index so we don't go to far

                elif "include" in text:
                    identifier = self.stream.tokens[i + 1].text
                    file = self.path + identifier[
                                       1:len(identifier) - 1]  # Remove the '"' char before and after + add the path
                    k = i

                    if identifier != "<stdio.h>" and not self.__isDefined(
                            file):  # 'not self.ifndef[-1]' is important, so we make sure that we don't double define or have circular includes
                        try:
                            input_stream = FileStream(file)  # Verify the file exists
                        except:
                            ErrorExporter.fileNotFound(token.line, file)

                        lexer = grammarCLexer(input_stream)  # Create a new input stream
                        stream = CommonTokenStream(lexer)
                        stream.fill()

                        self.files.append(file)  # Add this file to the list of used files
                        i += 2

                        for tempToken in stream.tokens:  # Add a note for SemanticAnalyses another file was used
                            if tempToken.text != "<EOF>":  # The file doesn't yet end xd
                                tempToken.HIDDEN_CHANNEL = len(self.files) - 1
                                self.stream.tokens.insert(i, tempToken)  # Add the tokens to the current stream
                                i += 1  # Update the index to insert to

                        i = k

                    else:  # Stdio will be used hardcoded
                        self.stdio = True

                    del self.stream.tokens[k:k + 2]  # Remove the '#include file' from the token list
                    i -= 1  # Adjust index so we don't go to far

                elif "ifndef" in text:
                    self.ifndef.append(True)
                    del self.stream.tokens[i:i + 1]  # Remove the '#ifndef' directive
                    i -= 1  # Adjust index so we don't go to far

                elif "endif" in text:
                    if len(self.ifndef) == 0:
                        ErrorExporter.unMatchedEndIf(token.line)
                    self.ifndef.pop()
                    del self.stream.tokens[i:i + 1]  # Remove the '#endif' directive
                    i -= 1  # Adjust index so we don't go to far

            if type not in ["SINGLECOMMENT", "MULTILINE"]:
                if text in self.defined.keys():  # Replace any defines
                    replaceTokens = self.defined[text]  # Make a deepcopy
                    line = token.line

                    for tempToken in replaceTokens:  # Add a note for SemanticAnalyses another file was used
                        tempToken = tempToken.clone()  # Make a copy
                        tempToken.HIDDEN_CHANNEL = len(self.files) - 1
                        tempToken.line = line  # Correct the line number
                        self.stream.tokens.insert(i, tempToken)  # Add the tokens to the current stream
                        i += 1  # Update the index to insert to

                    del self.stream.tokens[i:i + 1]  # Remove the identifier we're replacing

            if token.HIDDEN_CHANNEL == -1:  # If no file has been assigned, the base file be set
                token.HIDDEN_CHANNEL = 0

            i += 1  # Go further

            # tokenstring = ""
            # for token in self.stream.tokens:  # For debug
            #     tokenstring += token.text+" "
            # print(tokenstring)

        return self.stdio, self.stream

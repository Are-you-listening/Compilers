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
        self.stdlib = False
        self.files = [input_file]
        self.comments = {}  # Map (linenr, filename) to a list of comments ["lolol", "apappap"]
        self.cycles = {}
        self.__curr_file = input_file
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

        """
        Get the line nr corresponding to the define line
        """
        line = self.stream.tokens[i].line  # Current line number

        i += 2
        token = self.stream.tokens[i]  # Token we're working on

        value = []
        type = self.lexer.ruleNames[token.type - 1]  # Type of the token in string format

        while type != "COMMENT" and token.line == line:
            value.append(token)

            i += 1
            token = self.stream.tokens[i]  # Get new token
            type = self.lexer.ruleNames[token.type - 1]
        return value, i

    def __being_skipped(self):
        """
        Check if an include guards makes it so the code is currently being skipped
        """
        if len(self.ifndef) == 0:
            return False

        return self.ifndef[-1] is not None

    def __add_file_cycle(self, file):
        lst = self.cycles.get(self.__curr_file, [])
        lst.append(file)
        self.cycles[self.__curr_file] = lst

        for item in self.cycles.items():
            lst = item[1]
            key = item[0]
            if self.__curr_file in lst:
                self.cycles[key].append(file)

        self.__check_cycle()
        self.__curr_file = file

    def __check_cycle(self):
        tpls = []

        for key in self.cycles.keys():
            for item in self.cycles.items():
                lst = item[1]
                if key in lst and key != item[0]:
                    tpls.append((key, item[0]))

        for tup in tpls:
            for tup2 in tpls:
                if tup[0] == tup2[1] and tup2[0] == tup[1]:
                    ErrorExporter.cyclicInclude(tup[0], tup[1], self.__curr_file)

    def preProcess(self):
        """
        Removes all '#' statements and replace them accordingly
        :return: bool: True if it contains "#include <stdio.h>"
        """
        self.stream.fill()
        i = 0  # Iterator index we are at right now in the token stream

        while i < len(self.stream.tokens) - 1:
            token = self.stream.tokens[i]
            text = token.text
            type = self.lexer.ruleNames[token.type - 1]

            if '#' in text and type != "COMMENT":  # We came across a preprocessor directive
                o = ""
                for s in self.stream.tokens:
                    o += s.text

                if "define" in text and not self.__being_skipped():
                    identifier = self.stream.tokens[i + 1]
                    if "IDENTIFIER" != self.lexer.ruleNames[
                        identifier.type - 1]:  # Can only use identifiers as macro names!
                        ErrorExporter.nonIdentifierDefine(identifier.line, self.__curr_file)
                    else:
                        identifier = identifier.text
                    value, j = self.__getValuePart(i)

                    if not self.__isDefined(identifier):  # Make use of any include guards
                        self.defined[identifier] = value  # Add to defined map

                    del self.stream.tokens[i:j]  # Delete the define statement from the list

                    i = j - len(value) - 3  # Adjust index so we don't go to far

                elif "include" in text and not self.__being_skipped():
                    file_name_token = self.stream.tokens[i + 1]

                    identifier = file_name_token.text
                    path = self.__getPath(file_name_token.source[1].fileName)
                    file = path + identifier[
                                  1:len(identifier) - 1]  # Remove the '"' char before and after + add the path
                    k = i

                    if identifier == "<stdlib.h>":
                        self.stdlib = True

                    elif identifier != "<stdio.h>" and \
                            not self.__isDefined(
                                file):  # 'not self.ifndef[-1]' is important, so we make sure that we don't double define or have circular includes
                        try:
                            input_stream = FileStream(file)  # Verify the file exists
                        except:
                            ErrorExporter.fileNotFound(token.line, file, self.__curr_file)

                        self.__add_file_cycle(file)

                        lexer = grammarCLexer(input_stream)  # Create a new input stream
                        stream = CommonTokenStream(lexer)
                        stream.fill()

                        self.files.append(file)  # Add this file to the list of used files
                        i += 2

                        for tempToken in stream.tokens:  # Add a note for SemanticAnalyses another file was used
                            if tempToken.text != "<EOF>":  # The file doesn't yet end xd
                                self.stream.tokens.insert(i, tempToken)  # Add the tokens to the current stream
                                i += 1  # Update the index to insert to

                        i = k

                    else:  # Stdio will be used hardcoded
                        self.stdio = True

                    del self.stream.tokens[k:k + 2]  # Remove the '#include file' from the token list
                    i -= 1  # Adjust index so we don't go to far

                elif "ifndef" in text:
                    definer = self.stream.tokens[i + 1].text

                    if definer in self.defined or self.__being_skipped():
                        self.ifndef.append(i)
                    else:
                        self.ifndef.append(None)
                    del self.stream.tokens[i:i + 2]  # Remove the '#ifndef' directive
                    i -= 1  # Adjust index so we don't go to far

                elif "endif" in text:
                    if len(self.ifndef) == 0:
                        ErrorExporter.unMatchedEndIf(token.line, self.__curr_file)
                    skipped_index = self.ifndef.pop()

                    if skipped_index is not None:
                        del self.stream.tokens[skipped_index:i]  # remove skipped code
                        i = skipped_index

                    del self.stream.tokens[i:i + 1]  # Remove the '#endif' directive
                    i -= 1  # Adjust index so we don't go to far

                o = ""
                for s in self.stream.tokens:
                    o += s.text

            if type != "COMMENT":
                if text in self.defined.keys():  # Replace any defines
                    replaceTokens = self.defined[text]  # Make a deepcopy
                    line = token.line

                    for tempToken in replaceTokens:  # Add a note for SemanticAnalyses another file was used
                        tempToken = tempToken.clone()  # Make a copy
                        tempToken.line = line  # Correct the line number
                        self.stream.tokens.insert(i, tempToken)  # Add the tokens to the current stream
                        i += 1  # Update the index to insert to

                    del self.stream.tokens[i:i + 1]  # Remove the identifier we're replacing
            else:
                if self.comments.get((self.__curr_file, token.line)) is None:
                    self.comments[(self.__curr_file, token.line)] = ""
                self.comments[(self.__curr_file, token.line)] += text

                del self.stream.tokens[i:i + 1]  # Remove the identifier we're replacing
                i -= 1  # Go 1 step back

            i += 1  # Go further

        if len(self.ifndef) != 0:
            ErrorExporter.unMatchedStartIf(self.__curr_file, token.line)

        return self.stdio, self.stream, self.comments

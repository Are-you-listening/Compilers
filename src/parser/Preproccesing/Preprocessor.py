class PreProcessor:
    def __init__(self, stream, lexer):
        self.stream = stream
        self.lexer = lexer

    def preprocess(self):
        self.stream.fill()

        for token in self.stream.tokens:
            print(self.lexer.ruleNames[token.type - 1], token.text)

        print("he")

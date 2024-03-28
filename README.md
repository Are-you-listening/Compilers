# Compilers - README
> Compiler from a C-subset to LLVM IR & MIPS. A group project for the course Compilers (INFORMAT 1001WETCOP)
> > By Emil Lambert, Lucas Vanden Abeele, Tibo Verreycken, Kars van Velzen.

Requirements:
- having the right pip libraries see ``requirements.txt``
- for running our testcases: ``having a linux device with sudo apt install llvm (installed for lli)``
- being able to run the gcc compiler on your device

### Functionalities: 
- [X] Auto-Build to server (Follow Setup Guide)
- [ ] Auto-Build to server (Follow Setup Guide)
- [ ] Auto-Build to server (Follow Setup Guide)


ProjectStructure:

```
.
└── src/
    ├── antlr_files/
    │   └── here are the antlr created files
    ├── llvm_target/
    │   ├── ControlFlow/
    │   │   └── here is code related to creating the control flow graph
    │   ├── MapTable/
    │   │   └── here is code so we can map an variable to the LLVM register that stores its allocation
    │   ├── AST2LLVM.py (convert our AST to an LLVM output)
    │   ├── LLVMSingleton.py (manage the LLVMLite library so it is easy to use for our visitor)
    │   └── OutputLLVMGenerator.py (this file contains the code to convert an operation,assignment,... to its equivalent LLVM code)
    ├── mips_target/
    │   └── not yet needed for project 1-3
    ├── main/
    │   └── __main__ the main function that will be called to run the program
    └── parser/
        ├── Constraints/
        │   ├── ConstraintChecker.py (checks all its constraints)
        │   └── Constraints we want to check
        ├── CTypes/
        │   ├── COperationHandler.py (simulate operations like it would behave in C)
        │   └── CFunctionExecuter makes sure that each C type has the right operation behaviour
        ├── Tables/
        │   ├── AbstractTable.py (abstract table that support the chain of tables behaviour which is needed for scoping)
        │   ├── SymbolTable.py (having a symboltable of symbolEntries)
        │   ├── SymbolType.py (An object representing our symbol table entry type)
        │   ├── SymbolTypePtr.py (Same as SymbolType, but type is a PTR and points to another type)
        │   ├── TableDotVisitor.py (visualizes the symbol table)
        │   └── TypeDefTable.py (table to handle typedef translations)
        ├── AST.py (the structure for our Abstract syntax Tree)
        ├── ASTVisitor.py (Abstract class for a visitor for our AST)
        ├── ASTCreator.py (converts ANTLR CST to our own AST)
        ├── CodeGetter.py (Links each line of code to a line number)
        ├── ASTTypedefReplacer.py (convert each type to the type they are referring to)
        ├── ASTCleaner.py (Does some cleanup of our AST)
        ├── ASTTableCreator.py (Creates the symbol tables)
        ├── ASTCleanerAfter.py (AST cleaner that occurs after the symbol tables are created)
        ├── ASTDereferencer.py (Alter the AST so it is easier to see when we want to access the value of an identifier)
        ├── ConstantFoldingVisitor.py (does constant folding)
        ├── ASTConversion.py (makes all the implicit conversions explicit, and checks type semantic errors)
        ├── ValueAdderVisitor.py (does constant propagation and uses constantfolding)
        └── DotVisitor.py (create the dot image of our AST)
```

you can run our testcases using:

```
python3 -m unittest discover -v
```


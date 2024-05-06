# Compilers - README
> Compiler from a C-subset to LLVM IR & MIPS. A group project for the course Compilers (INFORMAT 1001WETCOP)
> > By Emil Lambert, Lucas Vanden Abeele, Tibo Verreycken, Kars van Velzen.

### Requirements & Dependencies:
- Install the python packages, see ``requirements.txt``
- Working gcc compiler on your device
- For unit tests, a linux Kernel with lli package installed: 

```bash
sudo apt install llvm
```

### Mandatory Functionality:
(In short we made all the mandatory features)

- [X] Binary operations +, -,* and /
- [X] Binary operations >, <, and ==
- [X] Unary operators + and -
- [X] Parenthesis to overwrite the order of operations
- [X] Logical operators &&, ||, and !
- [X] Comparison operators >=, <=, and !=
- [X] Binary operator %
- [X] Shift operators <<, >>
- [X] Bitwise operators &, |,~ and ^
- [X] Use of Abstract Syntax Tree
- [X] Constant Folding
- [X] Visualisation of Abstract Syntax Tree (using dot)
- [X] Mandatory main() Function 
- [X] Keywords: 'const', 'char', 'int' and 'float'
- [X] Expressions
- [X] Literals of types: 'char', 'int', 'float' and pointers for these types
- [X] Variables: variable declarations, variable definitions, assignment statements, and identifiers
- [X] Pointers:(Declaration, definition)  & Unary Operations: '*' (dereference) and '&' (address)
- [X] Pointer to const Values (We also support Const ptrs btw)
- [X] Constants
- [X] Implicit Conversions (Warnings when going to poorer type)
- [X] Explicit Conversions
- [X] Pointer Arithmetic
- [X] Increment/Decrement Operations
- [X] Constant propagation
- [X] Error Analysis: Syntax Errors
- [X] Error Analysis: Semantic Errors (all Semantic error features)
- [X] SymbolTable and Visualization of the symbol table
- [X] Singleline Comments
- [X] Multiline Comments
- [X] Original Code as Comments
- [X] Outputting to the standard output using printf
- [X] Typedefs
- [X] 'if' and 'else' statements
- [X] Loops: 'while' and 'for', also support keywords 'break' & 'continue'
- [X] Scoping: if-else, for, while, anonymous
- [X] Switch statements: switch, break, case
- [X] Enumerations
- [X] Support Scopes in symbol Table
- [X] Function scopes
- [X] Local & Global variables
- [X] Functions: definitions; declarations; calling, recursive calls
- [X] Pre-processor: #define
- [X] Pre-processor: #include
- [X] Optimisations: no code after break, continue, or return
- [X] Arrays both simple & multidimensional arrays
- [X] Array initialization using initializer list
- [X] Operations on array elements
- [X] Strings encoded as zero-terminated char-arrays (both supported as char str[size] and char* str)
- [X] printf and scanf
- [X] user Defined Structs

- [X] Include Guards (mandatory because group of 4)
- [X] Unions (mandatory because group of 4)
- [X] Function Pointers (mandatory because group of 4)
- [X] Code Generation: LLVM IR


### Optional Functionality: 
- [X] Include Guards (mandatory because group of 4)
- [X] Unions (mandatory because group of 4)
- [X] Function Pointers (mandatory because group of 4)

- [X] Const Casting
- [X] ControlFlow and visualization (Extra optional)
- [X] Else If Statements
- [X] Optimisation: Do not generate code for conditions that are always false
- [X] Semantic Error: Check for all paths in a function body whether a return statement is present
- [X] Dynamic Arrays (stored on heap) (malloc, free, calloc, realloc)
- [X] Structs that contain other structs as a value
- [X] Dynamic Allocation of Structs (store structs on heap) (support by also supporting sizeof function)
- [X] File reading using fgets (uses FILE* with fopen and fclose)
- [X] File writing using fputs (uses FILE* with fopen and fclose)
- [X] Dynamically allocated strings and character buffers (can be used for printf, fgets, fputs, ...)

### Technical Functionality: 
- [X] README
- [X] Documentation
- [X] Unit Tests
- [X] Start Script
- [X] PNG Creation from .dot-files

### ProjectStructure:

```
.
└── src/
    ├── antlr_files/
    │   └── Grammar files created by ANTLR
    ├── llvm_target/
    │   ├── ControlFlow/
    │   │   └── Code related to creating the Control Flow Graph
    │   ├── MapTable/
    │   │   └── Code to map a variable to the LLVM register that stores its allocation
    │   ├── AST2LLVM.py - Convert our AST to LLVM output
    │   ├── LLVMSingleton.py - Manages the LLVMLite Library to ease the work of our visitor
    │   └── OutputLLVMGenerator.py - Contains methods to convert operations,assignments, ... to equivalent LLVM code
    ├── mips_target/
    │   └── Not yet needed for project 1-3
    ├── main/
    │   └── __main__ - Function to start execution of the program
    └── parser/
        ├── Constraints/
        │   ├── ConstraintChecker.py - Applies the constrains
        │   └── Constraints we want to check
        ├── CTypes/
        │   ├── COperationHandler.py - Simulates operations like it would behave in C
        │   └── CFunctionExecuter - Makes sure that each C type has the right operation behaviour
        ├── Tables/
        │   ├── AbstractTable.py - Abstract Base Class
        │   ├── SymbolTable.py 
        │   ├── SymbolType.py - Object representing type of an SymbolTableEntry
        │   ├── SymbolTypePtr.py - Specialisation of SymbolType
        │   ├── TableDotVisitor.py - Visualizes the SymbolTable
        │   └── TypeDefTable.py - Table to handle typedef translations
        ├── AST.py - Datastructure for our Abstract Syntax Tree
        ├── ASTVisitor.py - Abstract Base Class
        ├── ASTCreator.py - Creates our datastructure from the ANTLR CST
        ├── CodeGetter.py - Links each line of code to a line number
        ├── ASTTypedefReplacer.py - Resolves typedefs to their actual type
        ├── ASTCleaner.py - Massages our AST to a desired format
        ├── ASTTableCreator.py - Creates the SymbolTables
        ├── ASTCleanerAfter.py - Massages our AST to a desired format, after table creation
        ├── ASTDereferencer.py - Alters the AST to ease the use of adressess
        ├── ConstantFoldingVisitor.py - Applies Constant Folding
        ├── ASTConversion.py - Reforms implicit conversions to explicits, also verifies semantics
        ├── ValueAdderVisitor.py - Applies Constant Propagation; uses Constant Folding
        └── DotVisitor.py - Create an dot image of our AST
```

### Tests

You can test our example files by running: 

```bash
python3 script.py
```

This will run the provided examples from ``example_source_files``

### Unit Tests
For our project we have lots of testcases, ...
So if for some reason a situation occurs that is unexpected, please consolidate our testcases

LLVM Tests are tests that run the entire compiler and cross-reference their output  (from prints) with the gcc output
This Part of our testEnvironment is the best indicator of our compiler its capabilities.
Currently, we have around 550 tests in this directory. Some classification is made, but not every feature
has its own testSuite. A lot of testfiles also have a combination of testcase features.

Run our testcases using:
```bash
python3 -m unittest discover -v
```

You can also run the tests in parallel
Requires:
```bash
pip install unittest-parallel
```

```bash
 unittest-parallel -t . -s TestCases
```

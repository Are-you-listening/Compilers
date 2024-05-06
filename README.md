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
(In short we made all the mandatory features) (Links are provided to an example file showing this feature)

- [X] [Binary operations +, -,* and /](./example_source_files/1_binary_operations.c) 
- [X] [Binary operations >, <, and ==](./example_source_files/1_binary_operations.c) 
- [X] [Unary operators + and -](./example_source_files/2_unary_operators.c) 
- [X] [Parenthesis to overwrite the order of operations](./example_source_files/3_parenthesis.c) 
- [X] [Logical operators &&, ||, and !](./example_source_files/4_logical_operators.c) 
- [X] [Comparison operators >=, <=, and !=](./example_source_files/1_binary_operations.c) 
- [X] [Binary operator %](./example_source_files/1_binary_operations.c) 
- [X] [Shift operators <<, >>](./example_source_files/1_binary_operations.c) 
- [X] [Bitwise operators &, |,~ and ^](./example_source_files/4_logical_operators.c) 
- [X] [Use of Abstract Syntax Tree](./example_source_files/1_binary_operations.c) 
- [X] [Constant Folding](./example_source_files/5_constant_folding.c) 
- [X] [Visualisation of Abstract Syntax Tree (using dot)](./example_source_files/5_constant_folding.c) 
- [X] [Mandatory main() Function](./example_source_files/6_main.c)
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
- [X] Error Analysis: Syntax Errors /s1
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
- [X] Support Scopes in symbol Table /s2
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
src
├── antlr_files
│   ├── grammarC.interp
│   ├── grammarCLexer.interp
│   ├── grammarCLexer.py
│   ├── grammarCLexer.tokens
│   ├── grammarCListener.py
│   ├── grammarCParser.py
│   ├── grammarC.tokens
│   ├── grammarCVisitor.py
│   ├── __init__.py
├── __init__.py
├── internal_tools
│   ├── __init__.py
│   ├── IntegrityChecks.py
├── llvm_target
│   ├── AST2LLVM.py
│   ├── ControlFlow
│   │   ├── ControlFlowDotVisitor.py
│   │   ├── ControlFlowGraph.py
│   │   ├── __init__.py
│   ├── ControlFlowCreator.py
│   ├── __init__.py
│   ├── LLVMSingleton.py
│   ├── MapTable
│   │   ├── __init__.py
│   │   ├── MapTable.py
│   ├── OutputLLVMGenerator.py
│   └── VoidReturnAdder.py
├── main
│   ├── __init__.py
│   ├── __main__.py
├── parser
│   ├── ArrayCleaner.py
│   ├── ASTCleanerAfter.py
│   ├── ASTCleaner.py
│   ├── ASTConversion.py
│   ├── ASTCreator.py
│   ├── ASTDereferencer.py
│   ├── ASTIfCleaner.py
│   ├── ASTLoopCleaner.py
│   ├── AST.py
│   ├── ASTTableCreator.py
│   ├── ASTTypedefReplacer.py
│   ├── ASTVisitor.py
│   ├── BlacklistVisitor.py
│   ├── CodeGetter.py
│   ├── ConstantFoldingVisitor.py
│   ├── ConstantStatementFolding.py
│   ├── Constraints
│   │   ├── AmpersandConstraint.py
│   │   ├── CheckRvalues.py
│   │   ├── CheckUnaryOps.py
│   │   ├── CleanGlobalScopeConstraint.py
│   │   ├── ConstraintChecker.py
│   │   ├── Constraint.py
│   │   ├── FunctionReturnConstraint.py
│   │   ├── GlobalsConstrained.py
│   │   ├── __init__.py
│   │   ├── IOConstraint.py
│   │   ├── MainFoundConstraint.py
│   │   ├── RedefinitionConstrained.py
│   │   ├── UndeclaredConstrained.py
│   │   ├── UndefinedReferenceConstraint.py
│   │   └── VoidReturnConstraint.py
│   ├── CTypes
│   │   ├── CFunctionExecuterChar.py
│   │   ├── CFunctionExecuterFloat.py
│   │   ├── CFunctionExecuterInt.py
│   │   ├── CFunctionExecuterPtr.py
│   │   ├── CFunctionExecuter.py
│   │   ├── COperationHandler.py
│   │   ├── __init__.py
│   │   ├── InvalidOperatorFloatError.py
│   │   ├── InvalidOperatorPtrError.py
│   ├── DeadCodeRemover.py
│   ├── DotVisitor.py
│   ├── DynamicAllocation.py
│   ├── EnumConverter.py
│   ├── ErrorExporter.py
│   ├── FileIO.py
│   ├── FunctionPtrCleaner.py
│   ├── IdentifierReplacerVisitor.py
│   ├── __init__.py
│   ├── PointerReformater.py
│   ├── Preproccesing
│   │   ├── __init__.py
│   │   ├── preProcessor.py
│   ├── SizeOfTranslater.py
│   ├── StringToArray.py
│   ├── StructCleanerAfter.py
│   ├── StructCleaner.py
│   ├── SwitchConverter.py
│   ├── Tables
│   │   ├── AbstractTable.py
│   │   ├── FunctionSymbolType.py
│   │   ├── __init__.py
│   │   ├── StructTable.py
│   │   ├── SymbolTable.py
│   │   ├── SymbolTypeArray.py
│   │   ├── SymbolTypePtr.py
│   │   ├── SymbolType.py
│   │   ├── SymbolTypeStruct.py
│   │   ├── SymbolTypeUnion.py
│   │   ├── TableDotVisitor.py
│   │   ├── TypedefTable.py
│   │   └── TypeNodehandler.py
│   ├── TypeCleaner.py
│   ├── TypeMerger.py
│   ├── UnarySaVisitor.py
│   ├── Utils
│   │   ├── ArraySizeReader.py
│   │   ├── __init__.py
│   ├── ValueAdderVisitor.py
│   └── VirtualLineNrVisitor.py
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

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
- [X] [Support Scopes in symbol Table /s2](./example_source_files/40_suppport_scopes_in_symbol_table.c)
- [X] [Function scopes](./example_source_files/41_function_scopes.c)
- [X] [Local & Global variables](./example_source_files/42_local_and_global_variables.c)
- [X] [Functions: definitions; declarations; calling, recursive calls](./example_source_files/43_functions.c)
- [X] [Pre-processor: #define](./example_source_files/44_pre-processor_define.c)
- [X] [Pre-processor: #include](./example_source_files/45_pre-processor_include.c)
- [X] [Optimisations: no code after break, continue, or return](./example_source_files/46_optimisation.c)
- [X] [Arrays both simple & multidimensional arrays](./example_source_files/47_arrays.c)
- [X] [Array initialization using initializer list](./example_source_files/48_array_initialization.c)
- [X] [Operations on array elements](./example_source_files/49_operations_on_array_elements.c)
- [X] [Strings encoded as zero-terminated char-arrays (both supported as char str[size] and char* str)](./example_source_files/50_strings.c)
- [X] [printf and scanf](./example_source_files/51_printf_and_scanf.c)
- [X] [user Defined Structs](./example_source_files/52_user_defined_structs.c)

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

### Project Structure:

```
Compilers
├── administration - A list of the assigments
├── example_source_files - Files used in our demo
├── grammar - Directory containing grammar specifications
│   └── grammarC.g4 - ANTLR file containing our grammar specification
├── output - Default directory used to generate files in
├── README.md - This file
├── requirements.txt - Python dependencies
├── run_tests_profiler.sh - Script to run profile our test environment
├── run_tests.sh - Script to run all our testcases at once
├── script.py - Run all example_source_files
├── src - Directory containing our source doe
│   ├── antlr_files - Grammar files created by ANTLR
│   ├── internal_tools - Directory containing internal tools
│   │   └── IntegrityChecks.py - PreConditions Functions
│   ├── llvm_target - Directory containing code to translate the AST & table data towards LLVM
│   │   ├── AST2LLVM.py - Main visitor to convert to LLVM
│   │   ├── LLVMSingleton.py - Manages the LLVMLite Library to ease the work of our visitor
│   │   ├── MapTable.py - Map variables to a LLVM register
│   │   └── OutputLLVMGenerator.py - Contains methods to convert parts of the tree to LLVM code
│   ├── main - Directory containing the main function
│   │   └──__main__.py - Main file 
│   ├── mips_target
│   ├── parser - Directory containing code to parse an input file, create & massage the tree
│   │   ├── ArrayCleaner.py - Massage the tree, specificly for arrays
│   │   ├── ASTCleanerAfter.py - Clean the AST after table creation
│   │   ├── ASTCleaner.py - Clean the AST before table creation
│   │   ├── ASTConversion.py - Reform implicit conversions to explicits and verify semantics
│   │   ├── ASTCreator.py - Create the initial AST from the ANTLR tree
│   │   ├── ASTDereferencer.py - Alters the AST to ease the use of adressess
│   │   ├── ASTIfCleaner.py - Massage If Statements to our format
│   │   ├── ASTLoopCleaner.py - Convert & Clean loop statements to While loops in a desired format
│   │   ├── AST.py - Contains class definitions of our AST Objects & some methods for easy manipulation
│   │   ├── ASTTableCreator.py - Creates symbol tables
│   │   ├── ASTTypedefReplacer.py - Resolves typedefs to their actual type
│   │   ├── ASTVisitor.py - Base class visitor for our AST
│   │   ├── BlacklistVisitor.py - Remove nodes that contain black listed text
│   │   ├── CodeGetter.py - Maps all source code to their respective linenumber & file
│   │   ├── ConstantFoldingVisitor.py - Apply constant folding
│   │   ├── ConstantStatementFolding.py - Apply constant folding for conditional statements
│   │   ├── Constraints - Directory containing semantic checks
│   │   │   ├── AmpersandConstraint.py - Verifies the integrity of the & operator
│   │   │   ├── CheckRvalues.py - Check for invalid Rvalues
│   │   │   ├── CheckUnaryOps.py - Verify consistency of unary operators
│   │   │   ├── CleanGlobalScopeConstraint.py - Verify that all statements in the global scope are allowed
│   │   │   ├── ConstraintChecker.py - Actual visitor that applies all constraints
│   │   │   ├── Constraint.py - Abstract Base Class
│   │   │   ├── FunctionReturnConstraint.py - Verify that every (non-void) function has a return statement
│   │   │   ├── GlobalsConstrained.py - Verify global variable syntax
│   │   │   ├── IOConstraint.py - Check when printf or scanf is used, stdio.h is included
│   │   │   ├── MainFoundConstraint.py - Check if the code to compile, contains a main function
│   │   │   ├── RedefinitionConstrained.py - Check for redefinitions
│   │   │   ├── UndeclaredConstrained.py - Verify if all used variables are declared
│   │   │   ├── UndefinedReferenceConstraint.py - Check for function calls to undefined functions
│   │   │   └── VoidReturnConstraint.py - Check that every void function has no non-empty return statement
│   │   ├── ControlFlow - Directory containing ControlFlow Code
│   │   │   ├── ControlFlowDotVisitor.py - Visualise the CFG
│   │   │   ├── ControlFlowGraph.py - Contains CFG Classes & manipulation methods
│   │   │   └── ControlFlowCreator.py - Creates the actual CFG
│   │   ├── CTypes - 
│   │   │   ├── CFunctionExecuterChar.py - Makes sure that each C type has the right operation behaviour
│   │   │   ├── CFunctionExecuterFloat.py - Makes sure that each C type has the right operation behaviour
│   │   │   ├── CFunctionExecuterInt.py - Makes sure that each C type has the right operation behaviour
│   │   │   ├── CFunctionExecuterPtr.py - Makes sure that each C type has the right operation behaviour
│   │   │   ├── CFunctionExecuter.py - Makes sure that each C type has the right operation behaviour
│   │   │   ├── COperationHandler.py - Simulates operations like it would behave in C
│   │   │   ├── InvalidOperatorFloatError.py - Error used in COperationHandler & -Executer
│   │   │   └── InvalidOperatorPtrError.py - Error used in COperationHandler & -Executer
│   │   ├── DeadCodeRemover.py - Remove unreachable code
│   │   ├── DotVisitor.py - Export the AST to a .dot file
│   │   ├── DynamicAllocation.py - Add dynamic allocation functionality
│   │   ├── EnumConverter.py - Convert enum nodes to our format
│   │   ├── ErrorExporter.py - File containing methods to throw errors
│   │   ├── FileIO.py - - Add FileIO functionality
│   │   ├── FunctionPtrCleaner.py - Cleanup Function Pointer declaration to our declration format
│   │   ├── IdentifierReplacerVisitor.py - Replace variables with known values at compile time
│   │   ├── PointerReformater.py - Reformat the '->' pointer operator towards (* ). operators
│   │   ├── Preproccesing - Directory containing preprocessor code
│   │   │   └── preProcessor.py - Execute preprocessing; remove comments & resolve #directives
│   │   ├── SizeOfTranslater.py - Convert SizeOf expressions, to an integer indicating the size of this type
│   │   ├── StringToArray.py - Make it possible to represent strings as char arrays
│   │   ├── StructCleanerAfter.py - Clean Struct Nodes after Table creation
│   │   ├── StructCleaner.py - Cleanup struct nodes & insert info into the Struct Table
│   │   ├── SwitchConverter.py - Convert switch stamenets to if statements
│   │   ├── Tables - Directory containing tables & type objects
│   │   │   ├── AbstractTable.py - Abstract Base Class for our Tables
│   │   │   ├── FunctionSymbolType.py - Type that holds data about Functions
│   │   │   ├── StructTable.py - Table to map structs info to scopes
│   │   │   ├── SymbolTable.py - Should be clear
│   │   │   ├── SymbolTypeArray.py - Type holding array info
│   │   │   ├── SymbolTypePtr.py - Type holding ptr info
│   │   │   ├── SymbolType.py - Simple type for base types, also used as base class for others
│   │   │   ├── SymbolTypeStruct.py - Type holding struct info
│   │   │   ├── SymbolTypeUnion.py - Type holding union info
│   │   │   ├── TableDotVisitor.py - Exports the symboltable to a .dot file
│   │   │   ├── TypedefTable.py - Table containing info about typedefs
│   │   │   └── TypeNodehandler.py - Tools with regard to creating and retrieving AST TypeNode types
│   │   ├── TypeCleaner.py - Convert 'Type' subtrees to a ASTTypeNode containing the type
│   │   ├── TypeMerger.py - Formats declarations with enums, structs to our format.
│   │   ├── UnarySaVisitor.py - Semantic Analyses for Unary operations
│   │   ├── Utils - Directory containing helper functions
│   │   │   └── ArraySizeReader.py - Help reading array sizes
│   │   ├── ValueAdderVisitor.py - Constant Propagation
│   │   ├── VirtualLineNrVisitor.py - Map code to a virtual linenr (needed instead of linenr by using multiple files)
│   │   └── VoidReturnAdder.py - Add void returns to void functions
└── TestCases - Directory containing our test system
    ├── ABCTests - DIrectory containing the abstract base class test & examples
    │   ├── abcTest.py - Abstract Base Test (from unitTest)
    │   ├── AstLoader.py - Can load & export an AST to .json files
    │   ├── createTests - Directory to create a new test file
    │   │   ├── file_read_json.json - .json upon file read
    │   │   ├── file_read_json_result.json - .json after applied actions
    │   │   ├── read_file_after.dot - .dot file after applied actions
    │   │   ├── read_file_after.png - .png file after applied actions
    │   │   ├── read_file_before.dot - initial AST
    │   │   ├── read_file_before.png - initial AST in png
    │   │   ├── read_file.c - Test input file
    │   │   └── testCaseCreator.py - Action applyer
    │   ├── ReCalibrateTestCases.py - Script to automaticly remake all .json files
    │   ├── temp - Temp directory in which any output files are generated
    │   │   └── temp.txt - File to ensure the directory exists
    │   └── tests - Directory containing test files corresponding to a unittest
    │       ├── error_dict.json - Predefine expected errors for each file
    │       ├── input_dict.json - If exists, predefined input for scanf
    │       ├── test1.c - A test file
    │       ├── test1.json - Generated .json after AST test
    │       └── test1_result.json - Expected .json result
    ├── ASTTests - Directory containing AST unit tests
    └── LLVMTests - Directory containing LLVM unit tests

169 directories, 1714 files
```

### Tests

You can test our example files by running: 

```bash
python3 script.py
```

This will run the provided examples from ``example_source_files``

### Unit Tests
For our project we have lots of testcases, ...
So if for some reason a situation occurs that is unexpected, please consolidate our testcases.

LLVM Tests are tests that run the entire compiler and cross-reference their output  (from prints) with the gcc output.
This Part of our testEnvironment is the best indicator of our compiler's capabilities.
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

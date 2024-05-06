; ModuleID = "/home/tibov/Desktop/universiteit/bachlor-2/Compilers/Project/Compilers/example_source_files/45_include_guards/45_include_guards.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define void @"printAppel"()
{
.2:
  %".3" = bitcast [3 x i8]* @".str.0" to i8*
  %".4" = alloca [7 x i8]*
  store [7 x i8]* @".str.1", [7 x i8]** %".4"
  %".6" = load [7 x i8]*, [7 x i8]** %".4"
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".3", [7 x i8]* %".6")
  ;  VOID printAppel ( ) { printf ( "%s" , "Apple1" ) ;
  ret void
}

define i32 @"main"()
{
.2:
  ;                      INT main ( ) { printAppel ( ) ;
  call void @"printAppel"()
  ret i32 0
  ; return 0 ;
}

@".str.0" = internal constant [3 x i8] c"%s\00"
@".str.1" = internal constant [7 x i8] c"Apple1\00"
declare i32 @"printf"(i8* %".1", ...)

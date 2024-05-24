; ModuleID = "tests/test20.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define void @"printAppel"()
{
.2:
  %".3" = bitcast [3 x i8]* @".str.0" to i8*
  %".4" = alloca [6 x i8]*
  store [6 x i8]* @".str.1", [6 x i8]** %".4"
  %".6" = load [6 x i8]*, [6 x i8]** %".4"
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".3", [6 x i8]* %".6")
  ;  VOID printAppel ( ) { printf ( "%s" , "Appel" ) ;
  ret void
}

define i32 @"main"()
{
.2:
  ;                           INT main ( ) { printAppel ( ) ;
  call void @"printAppel"()
  ret i32 0
  ; return 0 ;
}

@".str.0" = internal constant [3 x i8] c"%s\00"
@".str.1" = internal constant [6 x i8] c"Appel\00"
declare i32 @"printf"(i8* %".1", ...)

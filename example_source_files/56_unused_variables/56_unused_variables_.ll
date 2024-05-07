; ModuleID = "./example_source_files/56_unused_variables/56_unused_variables.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ; /** use param --unused_var True* To get the expected results*/
  %".4" = alloca i32, align 4
  store i32 5, i32* %".4", align 4
  ;         INT main ( ) { INT a = 3 ; INT b = 4 ;  INT c = 5 ;
  store i32 5, i32* %".4", align 4
  ; c = 5 ;
  %".9" = load i32, i32* %".4", align 4
  ; printf ( "%d" , c ) ;
  %".11" = bitcast [3 x i8]* @".str.0" to i8*
  %".12" = alloca i32
  store i32 %".9", i32* %".12"
  %".14" = load i32, i32* %".12"
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".11", i32 %".14")
  ret i32 0
  ; return 0 ;
}

@".str.0" = internal constant [3 x i8] c"%d\00"
declare i32 @"printf"(i8* %".1", ...)

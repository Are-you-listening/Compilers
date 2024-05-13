; ModuleID = "tests/test5.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;    INT main
  %".4" = alloca i8*, align 8
  %".5" = bitcast [11 x i8]* @".str.0" to i8*
  store i8* %".5", i8** %".4", align 8
  ; CHAR * s = "string\nhe"
  %".8" = bitcast [9 x i8]* @".str.1" to i8*
  %".9" = alloca [11 x i8]*
  store [11 x i8]* @".str.0", [11 x i8]** %".9"
  %".11" = load [11 x i8]*, [11 x i8]** %".9"
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".8", [11 x i8]* %".11")
  ;  printf "%s \n Hi" s
  ret i32 0
  ; return 0
}

@".str.0" = internal constant [11 x i8] c"string\5cnhe\00"
@".str.1" = internal constant [9 x i8] c"%s \5cn Hi\00"
declare i32 @"printf"(i8* %".1", ...)

; ModuleID = "tests/test6.c"
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
  %".8" = load i8*, i8** %".4", align 8
  ;  printf "%s \n Hi %s" s s
  %".10" = bitcast [12 x i8]* @".str.1" to i8*
  %".11" = alloca i8*
  %".12" = alloca [11 x i8]*
  store i8* %".8", i8** %".11"
  store [11 x i8]* @".str.0", [11 x i8]** %".12"
  %".15" = load i8*, i8** %".11"
  %".16" = load [11 x i8]*, [11 x i8]** %".12"
  %".17" = call i32 (i8*, ...) @"printf"(i8* %".10", i8* %".15", [11 x i8]* %".16")
  ret i32 0
  ; return 0
}

@".str.0" = internal constant [11 x i8] c"string\5cnhe\00"
@".str.1" = internal constant [12 x i8] c"%s \5cn Hi %s\00"
declare i32 @"printf"(i8* %".1", ...)

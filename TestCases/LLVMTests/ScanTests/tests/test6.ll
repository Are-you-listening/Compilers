; ModuleID = "tests/test6.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;    INT main
  %".4" = alloca i8, align 1
  store i8 48, i8* %".4", align 1
  ; CHAR k = '0'
  %".7" = load i8, i8* %".4", align 1
  ; printf "%c" k
  %".9" = bitcast [3 x i8]* @".str.0" to i8*
  %".10" = alloca i8
  store i8 %".7", i8* %".10"
  %".12" = load i8, i8* %".10"
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".9", i8 %".12")
  %".14" = bitcast [3 x i8]* @".str.0" to i8*
  %".15" = alloca i8*
  store i8* %".4", i8** %".15"
  %".17" = load i8*, i8** %".15"
  %".18" = call i32 (i8*, ...) @"scanf"(i8* %".14", i8* %".17")
  ; scanf "%c" & k
  %".20" = load i8, i8* %".4", align 1
  ; printf "%c" k
  %".22" = bitcast [3 x i8]* @".str.0" to i8*
  %".23" = alloca i8
  store i8 %".20", i8* %".23"
  %".25" = load i8, i8* %".23"
  %".26" = call i32 (i8*, ...) @"printf"(i8* %".22", i8 %".25")
  ret i32 0
  ; return 0
}

@".str.0" = internal constant [3 x i8] c"%c\00"
declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

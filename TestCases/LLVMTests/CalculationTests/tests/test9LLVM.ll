; ModuleID = "tests/test9.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i8, align 1
  store i8 120, i8* %".3", align 1
  ; CHAR x = 'x'
  %".6" = bitcast [3 x i8]* @".str.c" to i8*
  %".7" = alloca i8
  store i8 120, i8* %".7"
  %".9" = load i8, i8* %".7"
  %".10" = call i32 (i8*, ...) @"printf"(i8* %".6", i8 %".9")
  ; printf "%c" x
  %".12" = alloca i8, align 1
  store i8 46, i8* %".12", align 1
  ; CHAR dot = '.'
  %".15" = bitcast [3 x i8]* @".str.c" to i8*
  %".16" = alloca i8
  store i8 46, i8* %".16"
  %".18" = load i8, i8* %".16"
  %".19" = call i32 (i8*, ...) @"printf"(i8* %".15", i8 %".18")
  ; printf "%c" dot
  %".21" = alloca i8, align 1
  store i8 10, i8* %".21", align 1
  ; CHAR nl = '\n'
  %".24" = bitcast [3 x i8]* @".str.c" to i8*
  %".25" = alloca i8
  store i8 10, i8* %".25"
  %".27" = load i8, i8* %".25"
  %".28" = call i32 (i8*, ...) @"printf"(i8* %".24", i8 %".27")
  ; printf "%c" nl
  %".30" = alloca i8, align 1
  store i8 9, i8* %".30", align 1
  ; CHAR tab = '\t'
  %".33" = bitcast [3 x i8]* @".str.c" to i8*
  %".34" = alloca i8
  store i8 9, i8* %".34"
  %".36" = load i8, i8* %".34"
  %".37" = call i32 (i8*, ...) @"printf"(i8* %".33", i8 %".36")
  ; printf "%c" tab
  %".39" = alloca i8, align 1
  store i8 0, i8* %".39", align 1
  ; CHAR character_null = '\0'
  %".42" = bitcast [3 x i8]* @".str.c" to i8*
  %".43" = alloca i8
  store i8 0, i8* %".43"
  %".45" = load i8, i8* %".43"
  %".46" = call i32 (i8*, ...) @"printf"(i8* %".42", i8 %".45")
  ; printf "%c" character_null
  ret i32 0
  ; INT main
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.c" = internal constant [3 x i8] c"%c\00"
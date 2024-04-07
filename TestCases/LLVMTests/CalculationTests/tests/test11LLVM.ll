; ModuleID = "tests/test11.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i8, align 1
  store i8 97, i8* %".3", align 1
  ; CHAR x = 'a'
  %".6" = load i8, i8* %".3", align 1
  ; printf "%d" x
  %".8" = bitcast [3 x i8]* @".str.d" to i8*
  %".9" = alloca i8
  store i8 %".6", i8* %".9"
  %".11" = load i8, i8* %".9"
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".8", i8 %".11")
  %".13" = alloca i8*, align 8
  store i8* %".3", i8** %".13", align 8
  ; CHAR * chr_ptr = & x
  %".16" = load i8*, i8** %".13", align 8
  ; * chr_ptr = 'b'
  store i8 98, i8* %".16", align 8
  %".19" = load i8*, i8** %".13", align 8
  ; CHAR another_char = * chr_ptr
  %".21" = load i8, i8* %".19", align 8
  %".22" = alloca i8, align 1
  store i8 %".21", i8* %".22", align 1
  %".24" = load i8, i8* %".22", align 1
  ; printf "%d" another_char
  %".26" = bitcast [3 x i8]* @".str.d" to i8*
  %".27" = alloca i8
  store i8 %".24", i8* %".27"
  %".29" = load i8, i8* %".27"
  %".30" = call i32 (i8*, ...) @"printf"(i8* %".26", i8 %".29")
  ret i32 0
  ; INT main
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"
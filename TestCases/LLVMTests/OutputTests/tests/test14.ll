; ModuleID = "tests/test14.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;  INT main
  %".4" = alloca i32, align 4
  store i32 -6250, i32* %".4", align 4
  ; const INT b = - 6250
  %".7" = alloca i32, align 4
  store i32 5, i32* %".7", align 4
  ; const INT x = 5
  %".10" = alloca i32*, align 8
  store i32* %".7", i32** %".10", align 8
  ;  INT * non_const_pointer = & x
  %".13" = load i32*, i32** %".10", align 8
  ;  * non_const_pointer = 36941
  store i32 36941, i32* %".13", align 8
  store i32* %".4", i32** %".10", align 8
  ;  non_const_pointer = & b
  %".18" = alloca i8, align 1
  store i8 120, i8* %".18", align 1
  ;   CHAR c = 'x'
  %".21" = alloca i8, align 1
  store i8 10, i8* %".21", align 1
  ; CHAR nl = '\n'
  %".24" = alloca i8*, align 8
  store i8* %".18", i8** %".24", align 8
  ;  CHAR * char_ptr = & c
  %".27" = load i8*, i8** %".24", align 8
  ;  * char_ptr = '\t'
  store i8 9, i8* %".27", align 8
  store i8* %".21", i8** %".24", align 8
  ; char_ptr = & nl
  ret i32 0
  ;  return 0
}

; ModuleID = "tests/test18.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;  INT main
  %".4" = alloca i8, align 1
  store i8 97, i8* %".4", align 1
  ; const CHAR c = 'a'
  %".7" = alloca i8*, align 8
  store i8* %".4", i8** %".7", align 8
  ; const CHAR * chr_ptr = & c
  %".10" = alloca i8*, align 8
  store i8* %".4", i8** %".10", align 8
  ; CHAR * non_const_ptr = chr_ptr
  %".13" = load i8*, i8** %".10", align 8
  ; * non_const_ptr = 'c'
  store i8 99, i8* %".13", align 8
  ret i32 0
  ;  return 0
}

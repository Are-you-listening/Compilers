; ModuleID = "tests/test12.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;  INT main
  %".4" = alloca i8, align 1
  store i8 97, i8* %".4", align 1
  ;  CHAR x = 'a'
  %".7" = alloca i8*, align 8
  store i8* %".4", i8** %".7", align 8
  ;  CHAR * chr_ptr = & x
  %".10" = load i8*, i8** %".7", align 8
  ;  * chr_ptr = 'b'
  store i8 98, i8* %".10", align 8
  %".13" = load i8*, i8** %".7", align 8
  ;  CHAR another_char = * chr_ptr
  %".15" = load i8, i8* %".13", align 8
  %".16" = alloca i8, align 1
  store i8 %".15", i8* %".16", align 1
  ret i32 0
  ; return 0
}

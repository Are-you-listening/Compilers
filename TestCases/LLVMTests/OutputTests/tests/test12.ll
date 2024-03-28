; ModuleID = "tests/test12.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i8, align 1
  store i8 97, i8* %".3", align 1
  ; CHAR x = 'a'
  %".6" = alloca i8*, align 8
  store i8* %".3", i8** %".6", align 8
  ; CHAR * chr_ptr = & x
  %".9" = load i8*, i8** %".6", align 8
  ; * chr_ptr = 'b'
  store i8 98, i8* %".9", align 8
  %".12" = load i8*, i8** %".6", align 8
  ; CHAR another_char = * chr_ptr
  %".14" = load i8, i8* %".12", align 8
  %".15" = alloca i8, align 1
  store i8 %".14", i8* %".15", align 1
  ret i32 0
  ; INT main
}

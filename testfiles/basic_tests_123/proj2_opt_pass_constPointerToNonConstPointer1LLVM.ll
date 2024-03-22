; ModuleID = "testfiles/basic_tests_123/proj2_opt_pass_constPointerToNonConstPointer1.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i8, align 1
  store i8 97, i8* %".3", align 1
  ; const CHAR c = 'a'
  %".6" = alloca i8*, align 8
  store i8* %".3", i8** %".6", align 8
  ; const CHAR * chr_ptr = & c
  %".9" = alloca i8*, align 8
  store i8* %".3", i8** %".9", align 8
  ; CHAR * non_const_ptr = chr_ptr
  %".12" = load i8*, i8** %".9", align 8
  store i8 99, i8* %".12", align 8
  ; * non_const_ptr = 'c'
  ret i32 0
}

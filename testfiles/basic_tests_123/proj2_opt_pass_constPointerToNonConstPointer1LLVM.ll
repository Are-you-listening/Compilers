; ModuleID = "/home/watson/OneDrive/2023-2024/Compilers/Project/Compilers/src/llvm_target/LLVMSingleton.py"
target triple = "unknown-unknown-unknown"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i8, align 1
  store i8 'a', i8* %".3", align 1
  ; const CHAR c = 'a'
  %".6" = alloca i8*, align 8
  store i8* %".3", i8** %".6", align 8
  ; const CHAR * chr_ptr = & c
  %".9" = alloca i8*, align 8
  store i8* %".3", i8** %".9", align 8
  ; CHAR * non_const_ptr = chr_ptr
  %".12" = load i8*, i8** %".9", align 8
  store i8 'c', i8* %".12", align 8
  ; * non_const_ptr = 'c'
}

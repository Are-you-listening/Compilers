; ModuleID = "/home/watson/OneDrive/2023-2024/Compilers/Project/Compilers/src/llvm_target/LLVMSingleton.py"
target triple = "unknown-unknown-unknown"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 478, i32* %".3", align 4
  ; INT x = 478
  %".6" = alloca i32, align 4
  store i32 -251454, i32* %".6", align 4
  ; INT b = - 251454
  %".9" = alloca i32*, align 8
  store i32* %".6", i32** %".9", align 8
  ; INT * b_ptr = & b
  %".12" = alloca i32**, align 8
  store i32** %".9", i32*** %".12", align 8
  ; INT * * x_ptr = & b_ptr
}

; ModuleID = "/home/watson/OneDrive/2023-2024/Compilers/Project/Compilers/src/llvm_target/LLVMSingleton.py"
target triple = "unknown-unknown-unknown"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 4, i32* %".3", align 4
  ; INT x = 4
  %".6" = alloca i32, align 4
  store i32 9632, i32* %".6", align 4
  ; INT b = 9632
  %".9" = alloca i32*, align 8
  store i32* %".6", i32** %".9", align 8
  ; const INT * x_ptr = & b
  %".12" = load i32*, i32** %".9", align 8
  store i32 4, i32* %".12", align 8
  ; * x_ptr = x
}

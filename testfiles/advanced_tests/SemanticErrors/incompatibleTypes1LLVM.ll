; ModuleID = "/home/watson/OneDrive/2023-2024/Compilers/Project/Compilers/src/llvm_target/LLVMSingleton.py"
target triple = "unknown-unknown-unknown"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  ; INT x
  %".5" = zext i8 'f' to i32
  store i32 %".5", i32* %".3", align 4
  ; x = 5 + 'a'
  %".8" = zext i8 '¤' to i32
  store i32 %".8", i32* %".3", align 4
  ; x = 5 - 'a'
  %".11" = zext i8 'å' to i32
  store i32 %".11", i32* %".3", align 4
  ; x = 5 * 'a'
  %".14" = zext i8 ' ' to i32
  store i32 %".14", i32* %".3", align 4
  ; x = 5 / 'a'
}

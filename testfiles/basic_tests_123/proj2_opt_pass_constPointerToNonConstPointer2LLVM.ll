; ModuleID = "/home/watson/OneDrive/2023-2024/Compilers/Project/Compilers/src/llvm_target/LLVMSingleton.py"
target triple = "unknown-unknown-unknown"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca float, align 4
  store float 0x3fe93f7ce0000000, float* %".3", align 4
  ; const FLOAT f = 0.789
  %".6" = alloca float*, align 8
  store float* %".3", float** %".6", align 8
  ; const FLOAT * f_ptr = & f
  %".9" = alloca float*, align 8
  store float* %".3", float** %".9", align 8
  ; FLOAT * non_const_f_ptr = f_ptr
  %".12" = load float*, float** %".9", align 8
  store float 0x4009318fc0000000, float* %".12", align 8
  ; * non_const_f_ptr = 3.1492
}

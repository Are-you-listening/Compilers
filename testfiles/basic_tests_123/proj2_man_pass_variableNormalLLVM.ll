; ModuleID = "/home/watson/OneDrive/2023-2024/Compilers/Project/Compilers/src/llvm_target/LLVMSingleton.py"
target triple = "unknown-unknown-unknown"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 5, i32* %".3", align 4
  ; INT x = 5
  %".6" = alloca i32, align 4
  store i32 8, i32* %".6", align 4
  ; INT z = x + 3
  %".9" = load i32, i32* %".6", align 4
  %".10" = mul i32 8, %".9"
  %".11" = load i32, i32* %".6", align 4
  %".12" = mul i32 %".10", %".11"
  %".13" = load i32, i32* %".3", align 4
  %".14" = load i32, i32* %".3", align 4
  %".15" = add i32 %".13", %".14"
  %".16" = mul i32 %".12", %".15"
  store i32 %".16", i32* %".3", align 4
  ; x = z * z * z * x + x
  %".19" = alloca float, align 4
  store float 0x3fef8fde20000000, float* %".19", align 4
  ; FLOAT f = 0.986312
  %".22" = alloca float, align 4
  store float 0x4041462ea0000000, float* %".22", align 4
  ; FLOAT f2 = f * 33.0 + 2.0
  %".25" = load float, float* %".19", align 4
  %".26" = fadd float 0x4041462ea0000000, %".25"
  store float %".26", float* %".22", align 4
  ; f2 = f2 + f
  %".29" = alloca i8, align 1
  store i8 'a', i8* %".29", align 1
  ; CHAR c = 'a'
  store i8 'b', i8* %".29", align 1
  ; c = 'b'
}

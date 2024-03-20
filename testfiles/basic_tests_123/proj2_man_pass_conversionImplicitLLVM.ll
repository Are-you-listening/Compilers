; ModuleID = "/home/watson/OneDrive/2023-2024/Compilers/Project/Compilers/src/llvm_target/LLVMSingleton.py"
target triple = "unknown-unknown-unknown"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 5, i32* %".3", align 4
  ; INT x = 5
  %".6" = fpext i32 5 to float
  %".7" = alloca float, align 4
  store float %".6", float* %".7", align 4
  ; FLOAT f = x
  %".10" = alloca i32, align 4
  store i32 -32682, i32* %".10", align 4
  ; INT z = - 32682
  %".13" = load i32, i32* %".3", align 4
  %".14" = add i32 -1078506, %".13"
  %".15" = fpext i32 %".14" to float
  store float %".15", float* %".7", align 4
  ; f = 33.0 * z + x
  %".18" = load float, float* %".7", align 4
  %".19" = fmul float %".18", 0x3fe6666660000000
  %".20" = fptosi float %".19" to i32
  store i32 %".20", i32* %".10", align 4
  ; z = f * 0.7
  %".23" = zext i8 'Û' to i32
  %".24" = alloca i32, align 4
  store i32 %".23", i32* %".24", align 4
  ; INT k = 'a' + 'z'
}

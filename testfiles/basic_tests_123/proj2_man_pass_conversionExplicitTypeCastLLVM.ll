; ModuleID = "/home/watson/OneDrive/2023-2024/Compilers/Project/Compilers/src/llvm_target/LLVMSingleton.py"
target triple = "unknown-unknown-unknown"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 5, i32* %".3", align 4
  ; INT x = 5
  %".6" = alloca float, align 4
  store float 0x40e098b2c0000000, float* %".6", align 4
  ; FLOAT f = 33989.586265
  %".9" = fptosi float 0x40e098b2c0000000 to i32
  %".10" = alloca i32, align 4
  store i32 %".9", i32* %".10", align 4
  ; INT z = INT f
  %".13" = fpext i32 5 to float
  %".14" = alloca float, align 4
  store float %".13", float* %".14", align 4
  ; FLOAT z2 = FLOAT x
  %".17" = load float, float* %".6", align 4
  %".18" = fpext i32 5 to float
  %".19" = fpext i32 2 to float
  %".20" = fmul float %".18", %".19"
  %".21" = fadd float %".17", %".20"
  %".22" = fptosi float %".21" to i32
  %".23" = alloca i32, align 4
  store i32 %".22", i32* %".23", align 4
  ; INT a = INT f + z2 * 2
  %".26" = load float, float* %".6", align 4
  %".27" = alloca float, align 4
  store float %".26", float* %".27", align 4
  ; FLOAT f2 = FLOAT f
  %".30" = load float, float* %".6", align 4
  %".31" = fpext i32 5 to float
  %".32" = fpext i32 2 to float
  %".33" = fmul float %".31", %".32"
  %".34" = fadd float %".30", %".33"
  %".35" = fptosi float %".34" to i32
  %".36" = load float, float* %".14", align 4
  %".37" = fpext i32 195696 to float
  %".38" = fdiv float %".36", %".37"
  %".39" = fptosi float %".38" to i32
  %".40" = add i32 %".35", %".39"
  %".41" = fpext i32 %".40" to float
  store float %".41", float* %".27", align 4
  ; f2 = FLOAT a + z2 / 3 * 65232
}

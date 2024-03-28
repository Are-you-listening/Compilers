; ModuleID = "tests/test16.c"
target triple = "x86_64-pc-linux-gnu"
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
  ; x = z * z * z * x + x
  %".11" = mul i32 8, %".9"
  %".12" = load i32, i32* %".6", align 4
  %".13" = mul i32 %".11", %".12"
  %".14" = load i32, i32* %".3", align 4
  %".15" = load i32, i32* %".3", align 4
  %".16" = add i32 %".14", %".15"
  %".17" = mul i32 %".13", %".16"
  store i32 %".17", i32* %".3", align 4
  %".19" = alloca float, align 4
  store float 0x3fef8fde20000000, float* %".19", align 4
  ; FLOAT f = 0.986312
  %".22" = alloca float, align 4
  store float 0x4041462ea0000000, float* %".22", align 4
  ; FLOAT f2 = f * 33.0 + 2.0
  %".25" = load float, float* %".22", align 4
  ; f2 = f2 + f
  %".27" = load float, float* %".19", align 4
  %".28" = fadd float %".25", %".27"
  store float %".28", float* %".22", align 4
  %".30" = alloca i8, align 1
  store i8 97, i8* %".30", align 1
  ; CHAR c = 'a'
  store i8 98, i8* %".30", align 1
  ; c = 'b'
  ret i32 0
  ; INT main
}

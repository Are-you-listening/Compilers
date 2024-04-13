; ModuleID = "tests/test16.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;  INT main
  %".4" = alloca i32, align 4
  store i32 5, i32* %".4", align 4
  ; INT x = 5
  %".7" = alloca i32, align 4
  store i32 8, i32* %".7", align 4
  ; INT z = x + 3
  %".10" = load i32, i32* %".7", align 4
  ;  x = z * z * z * x + x
  %".12" = mul i32 8, %".10"
  %".13" = load i32, i32* %".7", align 4
  %".14" = mul i32 %".12", %".13"
  %".15" = load i32, i32* %".4", align 4
  %".16" = load i32, i32* %".4", align 4
  %".17" = add i32 %".15", %".16"
  %".18" = mul i32 %".14", %".17"
  store i32 %".18", i32* %".4", align 4
  %".20" = alloca float, align 4
  store float 0x3fef8fde20000000, float* %".20", align 4
  ;  FLOAT f = 0.986312
  %".23" = alloca float, align 4
  store float 0x4041462ea0000000, float* %".23", align 4
  ; FLOAT f2 = f * 33.0 + 2.0
  %".26" = load float, float* %".23", align 4
  ;  f2 = f2 + f
  %".28" = load float, float* %".20", align 4
  %".29" = fadd float %".26", %".28"
  store float %".29", float* %".23", align 4
  %".31" = alloca i8, align 1
  store i8 97, i8* %".31", align 1
  ;  CHAR c = 'a'
  store i8 98, i8* %".31", align 1
  ; c = 'b'
  ret i32 0
  ;  return 0
}

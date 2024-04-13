; ModuleID = "tests/test17.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;  INT main
  %".4" = alloca i8, align 1
  store i8 97, i8* %".4", align 1
  ; const CHAR a = 'a'
  %".7" = alloca i32, align 4
  store i32 97, i32* %".7", align 4
  ; const INT b = a
  %".10" = alloca float, align 4
  store float 0x4058400000000000, float* %".10", align 4
  ; const FLOAT c = b
  %".13" = alloca i32, align 4
  store i32 291, i32* %".13", align 4
  ; const INT d = c + b + a
  %".16" = alloca i8, align 1
  store i8 70, i8* %".16", align 1
  ; const CHAR e = d + c + b + a
  %".19" = alloca float, align 4
  store float 0x4084600000000000, float* %".19", align 4
  ; const FLOAT f = e + d + c + b + a
  %".22" = alloca i32, align 4
  store i32 1304, i32* %".22", align 4
  ; const INT g = e + d + c + b + a + f
  %".25" = alloca i32, align 4
  store i32 8, i32* %".25", align 4
  ; const INT h = g % 12
  %".28" = alloca i32, align 4
  store i32 -1798, i32* %".28", align 4
  ; const INT i = h - g * b / e
  ret i32 0
  ; return 0
}

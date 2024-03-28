; ModuleID = "tests/test17.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i8, align 1
  store i8 97, i8* %".3", align 1
  ; const CHAR a = 'a'
  %".6" = alloca i32, align 4
  store i32 97, i32* %".6", align 4
  ; const INT b = a
  %".9" = alloca float, align 4
  store float 0x4058400000000000, float* %".9", align 4
  ; const FLOAT c = b
  %".12" = alloca i32, align 4
  store i32 291, i32* %".12", align 4
  ; const INT d = c + b + a
  %".15" = alloca i8, align 1
  store i8 70, i8* %".15", align 1
  ; const CHAR e = d + c + b + a
  %".18" = alloca float, align 4
  store float 0x4084600000000000, float* %".18", align 4
  ; const FLOAT f = e + d + c + b + a
  %".21" = alloca i32, align 4
  store i32 1304, i32* %".21", align 4
  ; const INT g = e + d + c + b + a + f
  %".24" = alloca i32, align 4
  store i32 8, i32* %".24", align 4
  ; const INT h = g % 12
  %".27" = alloca i32, align 4
  store i32 -1798, i32* %".27", align 4
  ; const INT i = h - g * b / e
  ret i32 0
  ; INT main
}

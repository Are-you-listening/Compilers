; ModuleID = "tests/test18.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 1, i32* %".3", align 4
  ; bool x = 1
  %".6" = alloca i32, align 4
  store i32 0, i32* %".6", align 4
  ; bool y = 0
  %".9" = alloca i32, align 4
  store i32 0, i32* %".9", align 4
  ; INT z = x && y
  %".12" = load i32, i32* %".6", align 4
  ; bool b = y * z * 57809
  %".14" = mul i32 %".12", 0
  %".15" = mul i32 %".14", 57809
  %".16" = alloca i32, align 4
  store i32 %".15", i32* %".16", align 4
  ret i32 0
  ; INT main
  ; typedef INT bool
}
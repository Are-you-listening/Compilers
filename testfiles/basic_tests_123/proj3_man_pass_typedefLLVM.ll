; ModuleID = "testfiles/basic_tests_123/proj3_man_pass_typedef.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 1, i32* %".3", align 4
  ; INT x = 1
  %".6" = alloca i32, align 4
  store i32 0, i32* %".6", align 4
  ; INT y = 0
  %".9" = alloca i32, align 4
  store i32 0, i32* %".9", align 4
  ; INT z = x && y
  %".12" = load i32, i32* %".6", align 4
  %".13" = mul i32 %".12", 0
  %".14" = mul i32 %".13", 57809
  %".15" = alloca i32, align 4
  store i32 %".14", i32* %".15", align 4
  ; INT b = y * z * 57809
  ret i32 0
}

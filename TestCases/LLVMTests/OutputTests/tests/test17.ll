; ModuleID = "tests/test17.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 5, i32* %".3", align 4
  ; INT integer = 5
  %".6" = alloca i32*, align 8
  store i32* %".3", i32** %".6", align 8
  ; INT * int_ptr = & integer
  %".9" = alloca i32**, align 8
  store i32** %".6", i32*** %".9", align 8
  ; INT * * ptr_ptr = & int_ptr
  %".12" = alloca i32**, align 8
  store i32** %".6", i32*** %".12", align 8
  ; INT * * another_pointer = ptr_ptr
  %".15" = load i32, i32* %".3", align 4
  ; INT z = integer + 5
  %".17" = add i32 %".15", 5
  %".18" = alloca i32, align 4
  store i32 %".17", i32* %".18", align 4
  store i32* %".18", i32** %".6", align 8
  ; int_ptr = & z
  %".22" = alloca i32*, align 8
  store i32* %".18", i32** %".22", align 8
  ; INT * pointer = & z
  %".25" = load i32, i32* %".18", align 4
  ; INT x = * pointer
  %".27" = alloca i32, align 4
  store i32 %".25", i32* %".27", align 4
  %".29" = alloca i32**, align 8
  store i32** %".6", i32*** %".29", align 8
  ; INT * * x_ptr = & int_ptr
  ret i32 0
  ; INT main
}
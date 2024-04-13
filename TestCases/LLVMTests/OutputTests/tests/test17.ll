; ModuleID = "tests/test17.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;  INT main
  %".4" = alloca i32, align 4
  store i32 5, i32* %".4", align 4
  ; INT integer = 5
  %".7" = alloca i32*, align 8
  store i32* %".4", i32** %".7", align 8
  ;  INT * int_ptr = & integer
  %".10" = alloca i32**, align 8
  store i32** %".7", i32*** %".10", align 8
  ;  INT * * ptr_ptr = & int_ptr
  %".13" = alloca i32**, align 8
  store i32** %".7", i32*** %".13", align 8
  ;   INT * * another_pointer = ptr_ptr
  %".16" = load i32, i32* %".4", align 4
  ;   INT z = integer + 5
  %".18" = add i32 %".16", 5
  %".19" = alloca i32, align 4
  store i32 %".18", i32* %".19", align 4
  store i32* %".19", i32** %".7", align 8
  ;  int_ptr = & z
  %".23" = alloca i32*, align 8
  store i32* %".19", i32** %".23", align 8
  ;  INT * pointer = & z
  %".26" = load i32, i32* %".19", align 4
  ;  INT x = * pointer
  %".28" = alloca i32, align 4
  store i32 %".26", i32* %".28", align 4
  %".30" = alloca i32**, align 8
  store i32** %".7", i32*** %".30", align 8
  ; INT * * x_ptr = & int_ptr
  ret i32 0
  ;  return 0
}

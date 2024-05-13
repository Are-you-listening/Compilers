; ModuleID = "tests/test1.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = sitofp i32 4 to float
  %".4" = alloca float, align 4
  store float %".3", float* %".4", align 4
  ; const float e = 4
  %".7" = bitcast float* %".4" to i32*
  %".8" = alloca i32*, align 8
  store i32* %".7", i32** %".8", align 8
  ; int * f = & e
  %".11" = load i32*, i32** %".8", align 8
  %".12" = load i32, i32* %".11", align 8
  %".13" = alloca i32, align 4
  store i32 %".12", i32* %".13", align 4
  ; int g = * f
}

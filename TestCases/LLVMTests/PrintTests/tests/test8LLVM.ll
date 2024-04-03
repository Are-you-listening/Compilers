; ModuleID = "tests/test8.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 0, i32* %".3", align 4
  ; INT a = 0
  %".6" = alloca float, align 4
  store float 0x4014ccccc0000000, float* %".6", align 4
  ; FLOAT b = 5.2
  %".9" = alloca i8, align 1
  store i8 97, i8* %".9", align 1
  ; CHAR c = 'a'
  %".12" = bitcast [3 x i8]* @".str.c" to i8*
  %".13" = alloca i8
  store i8 97, i8* %".13"
  %".15" = load i8, i8* %".13"
  %".16" = call i32 (i8*, ...) @"printf"(i8* %".12", i8 %".15")
  ; printf "%c" , c
  %".18" = bitcast [3 x i8]* @".str.f" to i8*
  %".19" = alloca float
  store float 0x4014ccccc0000000, float* %".19"
  %".21" = load float, float* %".19"
  %".22" = fpext float %".21" to double
  %".23" = call i32 (i8*, ...) @"printf"(i8* %".18", double %".22")
  ; printf "%f" , b
  %".25" = bitcast [3 x i8]* @".str.d" to i8*
  %".26" = alloca i32
  store i32 0, i32* %".26"
  %".28" = load i32, i32* %".26"
  %".29" = call i32 (i8*, ...) @"printf"(i8* %".25", i32 %".28")
  ; printf "%d" , a
  ret i32 0
  ; INT main
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.c" = internal constant [3 x i8] c"%c\00"
@".str.f" = internal constant [3 x i8] c"%f\00"
@".str.d" = internal constant [3 x i8] c"%d\00"
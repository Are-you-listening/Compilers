; ModuleID = "tests/test10.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 98362, i32* %".3", align 4
  ; INT x = 98362
  %".6" = load i32, i32* %".3", align 4
  ; printf " %d " , x
  %".8" = bitcast [3 x i8]* @".str.d" to i8*
  %".9" = alloca i32
  store i32 %".6", i32* %".9"
  %".11" = load i32, i32* %".9"
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".8", i32 %".11")
  %".13" = alloca i32*, align 8
  store i32* %".3", i32** %".13", align 8
  ; INT * x_ptr = & x
  %".16" = alloca i32**, align 8
  store i32** %".13", i32*** %".16", align 8
  ; INT * * p = & x_ptr
  %".19" = load i32*, i32** %".13", align 8
  ; printf " %d " , * p == x_ptr
  %".21" = load i32*, i32** %".13", align 8
  %".22" = icmp eq i32* %".19", %".21"
  %".23" = bitcast [3 x i8]* @".str.d" to i8*
  %".24" = alloca i1
  store i1 %".22", i1* %".24"
  %".26" = load i1, i1* %".24"
  %".27" = call i32 (i8*, ...) @"printf"(i8* %".23", i1 %".26")
  %".28" = alloca i32*, align 8
  store i32* %".3", i32** %".28", align 8
  ; INT * z = & x
  %".31" = load i32, i32* %".3", align 4
  ; printf " %d " , * z == x
  %".33" = load i32, i32* %".3", align 4
  %".34" = icmp eq i32 %".31", %".33"
  %".35" = bitcast [3 x i8]* @".str.d" to i8*
  %".36" = alloca i1
  store i1 %".34", i1* %".36"
  %".38" = load i1, i1* %".36"
  %".39" = call i32 (i8*, ...) @"printf"(i8* %".35", i1 %".38")
  %".40" = alloca float, align 4
  store float 0x408ac20da0000000, float* %".40", align 4
  ; FLOAT a = 856.25668
  %".43" = alloca float*, align 8
  store float* %".40", float** %".43", align 8
  ; FLOAT * a_ptr = & a
  ; printf " %d " , INT * a_ptr == a
  %".47" = load float, float* %".40", align 4
  %".48" = load float, float* %".40", align 4
  %".49" = fcmp oeq float %".47", %".48"
  %".50" = zext i1 %".49" to i32
  %".51" = bitcast [3 x i8]* @".str.d" to i8*
  %".52" = alloca i32
  store i32 %".50", i32* %".52"
  %".54" = load i32, i32* %".52"
  %".55" = call i32 (i8*, ...) @"printf"(i8* %".51", i32 %".54")
  ret i32 0
  ; INT main
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"
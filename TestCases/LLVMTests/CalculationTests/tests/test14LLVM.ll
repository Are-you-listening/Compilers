; ModuleID = "tests/test14.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;  #include <stdio.h>  INT main
  %".4" = alloca i32, align 4
  store i32 5, i32* %".4", align 4
  ; INT integer = 5
  %".7" = load i32, i32* %".4", align 4
  ; printf "%d" integer
  %".9" = bitcast [3 x i8]* @".str.d" to i8*
  %".10" = alloca i32
  store i32 %".7", i32* %".10"
  %".12" = load i32, i32* %".10"
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".9", i32 %".12")
  %".14" = alloca i32*, align 8
  store i32* %".4", i32** %".14", align 8
  ; INT * int_ptr = & integer
  %".17" = load i32*, i32** %".14", align 8
  ; printf "%d" * int_ptr
  %".19" = load i32, i32* %".17", align 8
  %".20" = bitcast [3 x i8]* @".str.d" to i8*
  %".21" = alloca i32
  store i32 %".19", i32* %".21"
  %".23" = load i32, i32* %".21"
  %".24" = call i32 (i8*, ...) @"printf"(i8* %".20", i32 %".23")
  %".25" = alloca i32**, align 8
  store i32** %".14", i32*** %".25", align 8
  ; INT * * ptr_ptr = & int_ptr
  %".28" = load i32*, i32** %".14", align 8
  ; printf "%d" * * ptr_ptr
  %".30" = load i32, i32* %".28", align 8
  %".31" = bitcast [3 x i8]* @".str.d" to i8*
  %".32" = alloca i32
  store i32 %".30", i32* %".32"
  %".34" = load i32, i32* %".32"
  %".35" = call i32 (i8*, ...) @"printf"(i8* %".31", i32 %".34")
  %".36" = load i32**, i32*** %".25", align 8
  ;  INT * * another_pointer = ptr_ptr
  %".38" = alloca i32**, align 8
  store i32** %".36", i32*** %".38", align 8
  %".40" = load i32**, i32*** %".38", align 8
  ; printf "%d" * * another_pointer
  %".42" = load i32*, i32** %".40", align 8
  %".43" = load i32, i32* %".42", align 8
  %".44" = bitcast [3 x i8]* @".str.d" to i8*
  %".45" = alloca i32
  store i32 %".43", i32* %".45"
  %".47" = load i32, i32* %".45"
  %".48" = call i32 (i8*, ...) @"printf"(i8* %".44", i32 %".47")
  %".49" = load i32, i32* %".4", align 4
  ;   INT z = integer + 5
  %".51" = add i32 %".49", 5
  %".52" = alloca i32, align 4
  store i32 %".51", i32* %".52", align 4
  %".54" = load i32, i32* %".52", align 4
  ; printf "%d" z
  %".56" = bitcast [3 x i8]* @".str.d" to i8*
  %".57" = alloca i32
  store i32 %".54", i32* %".57"
  %".59" = load i32, i32* %".57"
  %".60" = call i32 (i8*, ...) @"printf"(i8* %".56", i32 %".59")
  store i32* %".52", i32** %".14", align 8
  ;  int_ptr = & z
  %".63" = load i32*, i32** %".14", align 8
  ; printf "%d" * int_ptr
  %".65" = load i32, i32* %".63", align 8
  %".66" = bitcast [3 x i8]* @".str.d" to i8*
  %".67" = alloca i32
  store i32 %".65", i32* %".67"
  %".69" = load i32, i32* %".67"
  %".70" = call i32 (i8*, ...) @"printf"(i8* %".66", i32 %".69")
  %".71" = alloca i32*, align 8
  store i32* %".52", i32** %".71", align 8
  ; INT * pointer = & z
  %".74" = load i32, i32* %".52", align 4
  ; printf "%d" * pointer
  %".76" = bitcast [3 x i8]* @".str.d" to i8*
  %".77" = alloca i32
  store i32 %".74", i32* %".77"
  %".79" = load i32, i32* %".77"
  %".80" = call i32 (i8*, ...) @"printf"(i8* %".76", i32 %".79")
  %".81" = load i32*, i32** %".71", align 8
  ;  INT x = * pointer
  %".83" = load i32, i32* %".81", align 8
  %".84" = alloca i32, align 4
  store i32 %".83", i32* %".84", align 4
  %".86" = load i32, i32* %".84", align 4
  ; printf "%d" x
  %".88" = bitcast [3 x i8]* @".str.d" to i8*
  %".89" = alloca i32
  store i32 %".86", i32* %".89"
  %".91" = load i32, i32* %".89"
  %".92" = call i32 (i8*, ...) @"printf"(i8* %".88", i32 %".91")
  %".93" = alloca i32**, align 8
  store i32** %".14", i32*** %".93", align 8
  ; INT * * x_ptr = & int_ptr
  %".96" = load i32*, i32** %".14", align 8
  ; printf "%d" * * x_ptr
  %".98" = load i32, i32* %".96", align 8
  %".99" = bitcast [3 x i8]* @".str.d" to i8*
  %".100" = alloca i32
  store i32 %".98", i32* %".100"
  %".102" = load i32, i32* %".100"
  %".103" = call i32 (i8*, ...) @"printf"(i8* %".99", i32 %".102")
  ret i32 0
  ;  return 0
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"
; ModuleID = "tests/test15.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 5, i32* %".3", align 4
  ; INT integer = 5
  store i32 1, i32* %".3", align 4
  ; integer = integer || 6
  %".8" = load i32, i32* %".3", align 4
  ; printf "%d" integer
  %".10" = bitcast [3 x i8]* @".str.d" to i8*
  %".11" = alloca i32
  store i32 %".8", i32* %".11"
  %".13" = load i32, i32* %".11"
  %".14" = call i32 (i8*, ...) @"printf"(i8* %".10", i32 %".13")
  %".15" = alloca i32*, align 8
  store i32* %".3", i32** %".15", align 8
  ; INT * int_ptr = & integer
  %".18" = load i32*, i32** %".15", align 8
  ; printf "%d" * int_ptr
  %".20" = load i32, i32* %".18", align 8
  %".21" = bitcast [3 x i8]* @".str.d" to i8*
  %".22" = alloca i32
  store i32 %".20", i32* %".22"
  %".24" = load i32, i32* %".22"
  %".25" = call i32 (i8*, ...) @"printf"(i8* %".21", i32 %".24")
  %".26" = alloca i32**, align 8
  store i32** %".15", i32*** %".26", align 8
  ; INT * * ptr_ptr = & int_ptr
  %".29" = load i32*, i32** %".15", align 8
  ; printf "%d" * * ptr_ptr
  %".31" = load i32, i32* %".29", align 8
  %".32" = bitcast [3 x i8]* @".str.d" to i8*
  %".33" = alloca i32
  store i32 %".31", i32* %".33"
  %".35" = load i32, i32* %".33"
  %".36" = call i32 (i8*, ...) @"printf"(i8* %".32", i32 %".35")
  %".37" = load i32**, i32*** %".26", align 8
  ; INT * * another_pointer = ptr_ptr
  %".39" = alloca i32**, align 8
  store i32** %".37", i32*** %".39", align 8
  %".41" = load i32**, i32*** %".39", align 8
  ; printf "%d" * * another_pointer
  %".43" = load i32*, i32** %".41", align 8
  %".44" = load i32, i32* %".43", align 8
  %".45" = bitcast [3 x i8]* @".str.d" to i8*
  %".46" = alloca i32
  store i32 %".44", i32* %".46"
  %".48" = load i32, i32* %".46"
  %".49" = call i32 (i8*, ...) @"printf"(i8* %".45", i32 %".48")
  %".50" = load i32, i32* %".3", align 4
  ; INT z = integer + 5
  %".52" = add i32 %".50", 5
  %".53" = alloca i32, align 4
  store i32 %".52", i32* %".53", align 4
  %".55" = load i32, i32* %".53", align 4
  ; printf "%d" z
  %".57" = bitcast [3 x i8]* @".str.d" to i8*
  %".58" = alloca i32
  store i32 %".55", i32* %".58"
  %".60" = load i32, i32* %".58"
  %".61" = call i32 (i8*, ...) @"printf"(i8* %".57", i32 %".60")
  store i32* %".53", i32** %".15", align 8
  ; int_ptr = & z
  %".64" = load i32*, i32** %".15", align 8
  ; printf "%d" * int_ptr
  %".66" = load i32, i32* %".64", align 8
  %".67" = bitcast [3 x i8]* @".str.d" to i8*
  %".68" = alloca i32
  store i32 %".66", i32* %".68"
  %".70" = load i32, i32* %".68"
  %".71" = call i32 (i8*, ...) @"printf"(i8* %".67", i32 %".70")
  %".72" = alloca i32*, align 8
  store i32* %".53", i32** %".72", align 8
  ; INT * pointer = & z
  %".75" = load i32, i32* %".53", align 4
  ; printf "%d" * pointer
  %".77" = bitcast [3 x i8]* @".str.d" to i8*
  %".78" = alloca i32
  store i32 %".75", i32* %".78"
  %".80" = load i32, i32* %".78"
  %".81" = call i32 (i8*, ...) @"printf"(i8* %".77", i32 %".80")
  %".82" = load i32*, i32** %".72", align 8
  ; INT x = * pointer
  %".84" = load i32, i32* %".82", align 8
  %".85" = alloca i32, align 4
  store i32 %".84", i32* %".85", align 4
  %".87" = load i32, i32* %".85", align 4
  ; printf "%d" x
  %".89" = bitcast [3 x i8]* @".str.d" to i8*
  %".90" = alloca i32
  store i32 %".87", i32* %".90"
  %".92" = load i32, i32* %".90"
  %".93" = call i32 (i8*, ...) @"printf"(i8* %".89", i32 %".92")
  %".94" = load i32, i32* %".85", align 4
  ; x ++
  %".96" = add i32 %".94", 1
  store i32 %".96", i32* %".85", align 4
  %".98" = load i32, i32* %".85", align 4
  ; x ++
  %".100" = add i32 %".98", 1
  store i32 %".100", i32* %".85", align 4
  %".102" = alloca i32**, align 8
  store i32** %".15", i32*** %".102", align 8
  ; INT * * x_ptr = & int_ptr
  %".105" = load i32*, i32** %".15", align 8
  ; printf "%d" * * x_ptr
  %".107" = load i32, i32* %".105", align 8
  %".108" = bitcast [3 x i8]* @".str.d" to i8*
  %".109" = alloca i32
  store i32 %".107", i32* %".109"
  %".111" = load i32, i32* %".109"
  %".112" = call i32 (i8*, ...) @"printf"(i8* %".108", i32 %".111")
  ret i32 0
  ; INT main
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"
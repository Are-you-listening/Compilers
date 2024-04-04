; ModuleID = "tests/test14.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 5, i32* %".3", align 4
  ; INT integer = 5
  %".6" = load i32, i32* %".3", align 4
  ; printf "%d" , integer
  %".8" = bitcast [3 x i8]* @".str.d" to i8*
  %".9" = alloca i32
  store i32 %".6", i32* %".9"
  %".11" = load i32, i32* %".9"
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".8", i32 %".11")
  %".13" = alloca i32*, align 8
  store i32* %".3", i32** %".13", align 8
  ; INT * int_ptr = & integer
  %".16" = load i32*, i32** %".13", align 8
  ; printf "%d" , * int_ptr
  %".18" = load i32, i32* %".16", align 8
  %".19" = bitcast [3 x i8]* @".str.d" to i8*
  %".20" = alloca i32
  store i32 %".18", i32* %".20"
  %".22" = load i32, i32* %".20"
  %".23" = call i32 (i8*, ...) @"printf"(i8* %".19", i32 %".22")
  %".24" = alloca i32**, align 8
  store i32** %".13", i32*** %".24", align 8
  ; INT * * ptr_ptr = & int_ptr
  %".27" = load i32*, i32** %".13", align 8
  ; printf "%d" , * * ptr_ptr
  %".29" = load i32, i32* %".27", align 8
  %".30" = bitcast [3 x i8]* @".str.d" to i8*
  %".31" = alloca i32
  store i32 %".29", i32* %".31"
  %".33" = load i32, i32* %".31"
  %".34" = call i32 (i8*, ...) @"printf"(i8* %".30", i32 %".33")
  %".35" = load i32**, i32*** %".24", align 8
  ; INT * * another_pointer = ptr_ptr
  %".37" = alloca i32**, align 8
  store i32** %".35", i32*** %".37", align 8
  %".39" = load i32**, i32*** %".37", align 8
  ; printf "%d" , * * another_pointer
  %".41" = load i32*, i32** %".39", align 8
  %".42" = load i32, i32* %".41", align 8
  %".43" = bitcast [3 x i8]* @".str.d" to i8*
  %".44" = alloca i32
  store i32 %".42", i32* %".44"
  %".46" = load i32, i32* %".44"
  %".47" = call i32 (i8*, ...) @"printf"(i8* %".43", i32 %".46")
  %".48" = load i32, i32* %".3", align 4
  ; INT z = integer + 5
  %".50" = add i32 %".48", 5
  %".51" = alloca i32, align 4
  store i32 %".50", i32* %".51", align 4
  %".53" = load i32, i32* %".51", align 4
  ; printf "%d" , z
  %".55" = bitcast [3 x i8]* @".str.d" to i8*
  %".56" = alloca i32
  store i32 %".53", i32* %".56"
  %".58" = load i32, i32* %".56"
  %".59" = call i32 (i8*, ...) @"printf"(i8* %".55", i32 %".58")
  store i32* %".51", i32** %".13", align 8
  ; int_ptr = & z
  %".62" = load i32*, i32** %".13", align 8
  ; printf "%d" , * int_ptr
  %".64" = load i32, i32* %".62", align 8
  %".65" = bitcast [3 x i8]* @".str.d" to i8*
  %".66" = alloca i32
  store i32 %".64", i32* %".66"
  %".68" = load i32, i32* %".66"
  %".69" = call i32 (i8*, ...) @"printf"(i8* %".65", i32 %".68")
  %".70" = alloca i32*, align 8
  store i32* %".51", i32** %".70", align 8
  ; INT * pointer = & z
  %".73" = load i32, i32* %".51", align 4
  ; printf "%d" , * pointer
  %".75" = bitcast [3 x i8]* @".str.d" to i8*
  %".76" = alloca i32
  store i32 %".73", i32* %".76"
  %".78" = load i32, i32* %".76"
  %".79" = call i32 (i8*, ...) @"printf"(i8* %".75", i32 %".78")
  %".80" = load i32*, i32** %".70", align 8
  ; INT x = * pointer
  %".82" = load i32, i32* %".80", align 8
  %".83" = alloca i32, align 4
  store i32 %".82", i32* %".83", align 4
  %".85" = load i32, i32* %".83", align 4
  ; printf "%d" , x
  %".87" = bitcast [3 x i8]* @".str.d" to i8*
  %".88" = alloca i32
  store i32 %".85", i32* %".88"
  %".90" = load i32, i32* %".88"
  %".91" = call i32 (i8*, ...) @"printf"(i8* %".87", i32 %".90")
  %".92" = alloca i32**, align 8
  store i32** %".13", i32*** %".92", align 8
  ; INT * * x_ptr = & int_ptr
  %".95" = load i32*, i32** %".13", align 8
  ; printf "%d" , * * x_ptr
  %".97" = load i32, i32* %".95", align 8
  %".98" = bitcast [3 x i8]* @".str.d" to i8*
  %".99" = alloca i32
  store i32 %".97", i32* %".99"
  %".101" = load i32, i32* %".99"
  %".102" = call i32 (i8*, ...) @"printf"(i8* %".98", i32 %".101")
  ret i32 0
  ; INT main
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"
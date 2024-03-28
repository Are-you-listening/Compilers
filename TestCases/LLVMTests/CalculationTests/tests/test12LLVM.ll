; ModuleID = "tests/test12.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 -6250, i32* %".3", align 4
  ; const INT b = - 6250
  %".6" = load i32, i32* %".3", align 4
  ; printf " %d " , b
  %".8" = bitcast [3 x i8]* @".str.d" to i8*
  %".9" = alloca i32
  store i32 %".6", i32* %".9"
  %".11" = load i32, i32* %".9"
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".8", i32 %".11")
  %".13" = alloca i32, align 4
  store i32 5, i32* %".13", align 4
  ; const INT x = 5
  %".16" = load i32, i32* %".13", align 4
  ; printf " %d " , x
  %".18" = bitcast [3 x i8]* @".str.d" to i8*
  %".19" = alloca i32
  store i32 %".16", i32* %".19"
  %".21" = load i32, i32* %".19"
  %".22" = call i32 (i8*, ...) @"printf"(i8* %".18", i32 %".21")
  %".23" = alloca i32*, align 8
  store i32* %".13", i32** %".23", align 8
  ; INT * non_const_pointer = & x
  %".26" = load i32*, i32** %".23", align 8
  ; * non_const_pointer = 36941
  store i32 36941, i32* %".26", align 8
  %".29" = load i32*, i32** %".23", align 8
  ; printf " %d " , * non_const_pointer
  %".31" = load i32, i32* %".29", align 8
  %".32" = bitcast [3 x i8]* @".str.d" to i8*
  %".33" = alloca i32
  store i32 %".31", i32* %".33"
  %".35" = load i32, i32* %".33"
  %".36" = call i32 (i8*, ...) @"printf"(i8* %".32", i32 %".35")
  store i32* %".3", i32** %".23", align 8
  ; non_const_pointer = & b
  %".39" = load i32*, i32** %".23", align 8
  ; printf " %d " , * non_const_pointer
  %".41" = load i32, i32* %".39", align 8
  %".42" = bitcast [3 x i8]* @".str.d" to i8*
  %".43" = alloca i32
  store i32 %".41", i32* %".43"
  %".45" = load i32, i32* %".43"
  %".46" = call i32 (i8*, ...) @"printf"(i8* %".42", i32 %".45")
  %".47" = alloca i8, align 1
  store i8 120, i8* %".47", align 1
  ; CHAR c = 'x'
  %".50" = load i8, i8* %".47", align 1
  ; printf " %c " , c
  %".52" = bitcast [3 x i8]* @".str.c" to i8*
  %".53" = alloca i8
  store i8 %".50", i8* %".53"
  %".55" = load i8, i8* %".53"
  %".56" = call i32 (i8*, ...) @"printf"(i8* %".52", i8 %".55")
  %".57" = alloca i8, align 1
  store i8 10, i8* %".57", align 1
  ; CHAR nl = '\n'
  %".60" = load i8, i8* %".57", align 1
  ; printf " %c " , nl
  %".62" = bitcast [3 x i8]* @".str.c" to i8*
  %".63" = alloca i8
  store i8 %".60", i8* %".63"
  %".65" = load i8, i8* %".63"
  %".66" = call i32 (i8*, ...) @"printf"(i8* %".62", i8 %".65")
  %".67" = alloca i8*, align 8
  store i8* %".47", i8** %".67", align 8
  ; CHAR * char_ptr = & c
  %".70" = load i8, i8* %".47", align 1
  ; printf " %c " , * char_ptr
  %".72" = bitcast [3 x i8]* @".str.c" to i8*
  %".73" = alloca i8
  store i8 %".70", i8* %".73"
  %".75" = load i8, i8* %".73"
  %".76" = call i32 (i8*, ...) @"printf"(i8* %".72", i8 %".75")
  %".77" = load i8*, i8** %".67", align 8
  ; * char_ptr = '\t'
  store i8 9, i8* %".77", align 8
  %".80" = load i8*, i8** %".67", align 8
  ; printf " %c " , * char_ptr
  %".82" = load i8, i8* %".80", align 8
  %".83" = bitcast [3 x i8]* @".str.c" to i8*
  %".84" = alloca i8
  store i8 %".82", i8* %".84"
  %".86" = load i8, i8* %".84"
  %".87" = call i32 (i8*, ...) @"printf"(i8* %".83", i8 %".86")
  store i8* %".57", i8** %".67", align 8
  ; char_ptr = & nl
  %".90" = load i8*, i8** %".67", align 8
  ; printf " %c " , * char_ptr
  %".92" = load i8, i8* %".90", align 8
  %".93" = bitcast [3 x i8]* @".str.c" to i8*
  %".94" = alloca i8
  store i8 %".92", i8* %".94"
  %".96" = load i8, i8* %".94"
  %".97" = call i32 (i8*, ...) @"printf"(i8* %".93", i8 %".96")
  ret i32 0
  ; INT main
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"
@".str.c" = internal constant [3 x i8] c"%c\00"
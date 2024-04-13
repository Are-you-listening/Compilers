; ModuleID = "tests/test12.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;  #include <stdio.h>  INT main
  %".4" = alloca i32, align 4
  store i32 -6250, i32* %".4", align 4
  ; const INT b = - 6250
  %".7" = load i32, i32* %".4", align 4
  ; printf "%d" b
  %".9" = bitcast [3 x i8]* @".str.d" to i8*
  %".10" = alloca i32
  store i32 %".7", i32* %".10"
  %".12" = load i32, i32* %".10"
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".9", i32 %".12")
  %".14" = alloca i32, align 4
  store i32 5, i32* %".14", align 4
  ; const INT x = 5
  %".17" = load i32, i32* %".14", align 4
  ; printf "%d" x
  %".19" = bitcast [3 x i8]* @".str.d" to i8*
  %".20" = alloca i32
  store i32 %".17", i32* %".20"
  %".22" = load i32, i32* %".20"
  %".23" = call i32 (i8*, ...) @"printf"(i8* %".19", i32 %".22")
  %".24" = alloca i32*, align 8
  store i32* %".14", i32** %".24", align 8
  ;  INT * non_const_pointer = & x
  %".27" = load i32*, i32** %".24", align 8
  ;  * non_const_pointer = 36941
  store i32 36941, i32* %".27", align 8
  %".30" = load i32*, i32** %".24", align 8
  ; printf "%d" * non_const_pointer
  %".32" = load i32, i32* %".30", align 8
  %".33" = bitcast [3 x i8]* @".str.d" to i8*
  %".34" = alloca i32
  store i32 %".32", i32* %".34"
  %".36" = load i32, i32* %".34"
  %".37" = call i32 (i8*, ...) @"printf"(i8* %".33", i32 %".36")
  store i32* %".4", i32** %".24", align 8
  ;  non_const_pointer = & b
  %".40" = load i32*, i32** %".24", align 8
  ;  printf "%d" * non_const_pointer
  %".42" = load i32, i32* %".40", align 8
  %".43" = bitcast [3 x i8]* @".str.d" to i8*
  %".44" = alloca i32
  store i32 %".42", i32* %".44"
  %".46" = load i32, i32* %".44"
  %".47" = call i32 (i8*, ...) @"printf"(i8* %".43", i32 %".46")
  %".48" = alloca i8, align 1
  store i8 120, i8* %".48", align 1
  ; CHAR c = 'x'
  %".51" = load i8, i8* %".48", align 1
  ; printf "%c" c
  %".53" = bitcast [3 x i8]* @".str.c" to i8*
  %".54" = alloca i8
  store i8 %".51", i8* %".54"
  %".56" = load i8, i8* %".54"
  %".57" = call i32 (i8*, ...) @"printf"(i8* %".53", i8 %".56")
  %".58" = alloca i8, align 1
  store i8 10, i8* %".58", align 1
  ; CHAR nl = '\n'
  %".61" = load i8, i8* %".58", align 1
  ; printf "%c" nl
  %".63" = bitcast [3 x i8]* @".str.c" to i8*
  %".64" = alloca i8
  store i8 %".61", i8* %".64"
  %".66" = load i8, i8* %".64"
  %".67" = call i32 (i8*, ...) @"printf"(i8* %".63", i8 %".66")
  %".68" = alloca i8*, align 8
  store i8* %".48", i8** %".68", align 8
  ;  CHAR * char_ptr = & c
  %".71" = load i8, i8* %".48", align 1
  ; printf "%c" * char_ptr
  %".73" = bitcast [3 x i8]* @".str.c" to i8*
  %".74" = alloca i8
  store i8 %".71", i8* %".74"
  %".76" = load i8, i8* %".74"
  %".77" = call i32 (i8*, ...) @"printf"(i8* %".73", i8 %".76")
  %".78" = load i8*, i8** %".68", align 8
  ;  * char_ptr = '\t'
  store i8 9, i8* %".78", align 8
  %".81" = load i8*, i8** %".68", align 8
  ; printf "%c" * char_ptr
  %".83" = load i8, i8* %".81", align 8
  %".84" = bitcast [3 x i8]* @".str.c" to i8*
  %".85" = alloca i8
  store i8 %".83", i8* %".85"
  %".87" = load i8, i8* %".85"
  %".88" = call i32 (i8*, ...) @"printf"(i8* %".84", i8 %".87")
  store i8* %".58", i8** %".68", align 8
  ; char_ptr = & nl
  %".91" = load i8*, i8** %".68", align 8
  ; printf "%c" * char_ptr
  %".93" = load i8, i8* %".91", align 8
  %".94" = bitcast [3 x i8]* @".str.c" to i8*
  %".95" = alloca i8
  store i8 %".93", i8* %".95"
  %".97" = load i8, i8* %".95"
  %".98" = call i32 (i8*, ...) @"printf"(i8* %".94", i8 %".97")
  ret i32 0
  ;  return 0
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"
@".str.c" = internal constant [3 x i8] c"%c\00"
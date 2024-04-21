; ModuleID = "tests/test11.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;    INT main
  %".4" = alloca i8, align 1
  store i8 97, i8* %".4", align 1
  ;  CHAR x = 'a'
  %".7" = load i8, i8* %".4", align 1
  ; printf "%d" x
  %".9" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".10" = alloca i8
  store i8 %".7", i8* %".10"
  %".12" = load i8, i8* %".10"
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".9", i8 %".12")
  %".14" = alloca i8*, align 8
  store i8* %".4", i8** %".14", align 8
  ;  CHAR * chr_ptr = & x
  %".17" = load i8*, i8** %".14", align 8
  ;  * chr_ptr = 'b'
  store i8 98, i8* %".17", align 8
  %".20" = load i8*, i8** %".14", align 8
  ;  CHAR another_char = * chr_ptr
  %".22" = load i8, i8* %".20", align 8
  %".23" = alloca i8, align 1
  store i8 %".22", i8* %".23", align 1
  %".25" = load i8, i8* %".23", align 1
  ; printf "%d" another_char
  %".27" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".28" = alloca i8
  store i8 %".25", i8* %".28"
  %".30" = load i8, i8* %".28"
  %".31" = call i32 (i8*, ...) @"printf"(i8* %".27", i8 %".30")
  ret i32 0
  ; return 0
}

declare i32 @"printf"(i8* %".1", ...)

@".str.PS0" = internal constant [3 x i8] c"%d\00"
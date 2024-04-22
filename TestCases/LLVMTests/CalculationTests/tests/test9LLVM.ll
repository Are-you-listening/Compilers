; ModuleID = "tests/test9.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;     INT main
  %".4" = alloca i8, align 1
  store i8 120, i8* %".4", align 1
  ;  CHAR x = 'x'
  %".7" = bitcast [3 x i8]* @".str.0" to i8*
  %".8" = alloca i8
  store i8 120, i8* %".8"
  %".10" = load i8, i8* %".8"
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".7", i8 %".10")
  ; printf "%c" x
  %".13" = alloca i8, align 1
  store i8 46, i8* %".13", align 1
  ;   CHAR dot = '.'
  %".16" = bitcast [3 x i8]* @".str.0" to i8*
  %".17" = alloca i8
  store i8 46, i8* %".17"
  %".19" = load i8, i8* %".17"
  %".20" = call i32 (i8*, ...) @"printf"(i8* %".16", i8 %".19")
  ; printf "%c" dot
  %".22" = alloca i8, align 1
  store i8 10, i8* %".22", align 1
  ;  CHAR nl = '\n'
  %".25" = bitcast [3 x i8]* @".str.0" to i8*
  %".26" = alloca i8
  store i8 10, i8* %".26"
  %".28" = load i8, i8* %".26"
  %".29" = call i32 (i8*, ...) @"printf"(i8* %".25", i8 %".28")
  ; printf "%c" nl
  %".31" = alloca i8, align 1
  store i8 9, i8* %".31", align 1
  ; CHAR tab = '\t'
  %".34" = bitcast [3 x i8]* @".str.0" to i8*
  %".35" = alloca i8
  store i8 9, i8* %".35"
  %".37" = load i8, i8* %".35"
  %".38" = call i32 (i8*, ...) @"printf"(i8* %".34", i8 %".37")
  ; printf "%c" tab
  %".40" = alloca i8, align 1
  store i8 0, i8* %".40", align 1
  ; CHAR character_null = '\0'
  %".43" = bitcast [3 x i8]* @".str.0" to i8*
  %".44" = alloca i8
  store i8 0, i8* %".44"
  %".46" = load i8, i8* %".44"
  %".47" = call i32 (i8*, ...) @"printf"(i8* %".43", i8 %".46")
  ; printf "%c" character_null
  ret i32 0
  ;  return 0
}

@".str.0" = internal constant [3 x i8] c"%c\00"
declare i32 @"printf"(i8* %".1", ...)

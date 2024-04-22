; ModuleID = "tests/test12.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;    INT main
  %".4" = alloca [2 x i8], align 8
  ;  CHAR x 2 = 'a' 'b'
  %".6" = getelementptr inbounds [2 x i8], [2 x i8]* %".4", i64 0, i32 1
  store i8 98, i8* %".6", align 4
  %".8" = getelementptr inbounds [2 x i8], [2 x i8]* %".4", i64 0, i32 0
  store i8 97, i8* %".8", align 4
  ;  CHAR * * c = & x
  %".11" = bitcast [2 x i8]* %".4" to i8**
  %".12" = alloca i8**, align 8
  store i8** %".11", i8*** %".12", align 8
  %".14" = load i8**, i8*** %".12", align 8
  ; * * c = 'c'
  %".16" = load i8*, i8** %".14", align 8
  store i8 99, i8* %".16", align 8
  %".18" = load i8**, i8*** %".12", align 8
  ; printf "%c" * * c
  %".20" = load i8*, i8** %".18", align 8
  %".21" = load i8, i8* %".20", align 8
  %".22" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".23" = alloca i8
  store i8 %".21", i8* %".23"
  %".25" = load i8, i8* %".23"
  %".26" = call i32 (i8*, ...) @"printf"(i8* %".22", i8 %".25")
  %".27" = getelementptr inbounds [2 x i8], [2 x i8]* %".4", i64 0, i32 0
  ; printf "%c" x 0
  %".29" = load i8, i8* %".27", align 4
  %".30" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".31" = alloca i8
  store i8 %".29", i8* %".31"
  %".33" = load i8, i8* %".31"
  %".34" = call i32 (i8*, ...) @"printf"(i8* %".30", i8 %".33")
  ret i32 0
  ; return 0
}

declare i32 @"printf"(i8* %".1", ...)

@".str.PS0" = internal constant [3 x i8] c"%c\00"
; ModuleID = "tests/test3.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;    INT main
  %".4" = alloca [10 x i8], align 8
  ; CHAR s 10 = "string\nhe"
  %".6" = getelementptr inbounds [10 x i8], [10 x i8]* %".4", i64 0, i32 9
  store i8 0, i8* %".6", align 4
  %".8" = getelementptr inbounds [10 x i8], [10 x i8]* %".4", i64 0, i32 8
  store i8 101, i8* %".8", align 4
  %".10" = getelementptr inbounds [10 x i8], [10 x i8]* %".4", i64 0, i32 7
  store i8 104, i8* %".10", align 4
  %".12" = getelementptr inbounds [10 x i8], [10 x i8]* %".4", i64 0, i32 6
  store i8 10, i8* %".12", align 4
  %".14" = getelementptr inbounds [10 x i8], [10 x i8]* %".4", i64 0, i32 5
  store i8 103, i8* %".14", align 4
  %".16" = getelementptr inbounds [10 x i8], [10 x i8]* %".4", i64 0, i32 4
  store i8 110, i8* %".16", align 4
  %".18" = getelementptr inbounds [10 x i8], [10 x i8]* %".4", i64 0, i32 3
  store i8 105, i8* %".18", align 4
  %".20" = getelementptr inbounds [10 x i8], [10 x i8]* %".4", i64 0, i32 2
  store i8 114, i8* %".20", align 4
  %".22" = getelementptr inbounds [10 x i8], [10 x i8]* %".4", i64 0, i32 1
  store i8 116, i8* %".22", align 4
  %".24" = getelementptr inbounds [10 x i8], [10 x i8]* %".4", i64 0, i32 0
  store i8 115, i8* %".24", align 4
  %".26" = getelementptr inbounds [10 x i8], [10 x i8]* %".4", i64 0, i32 0
  ;  s 0 = 'a'
  store i8 97, i8* %".26", align 4
  %".29" = getelementptr inbounds [10 x i8], [10 x i8]* %".4", i64 0, i32 1
  ; s 1 = 101
  store i8 101, i8* %".29", align 4
  %".32" = alloca i8*, align 8
  ;  CHAR * v
  %".34" = load i8*, i8** %".32", align 8
  ; * v = 'y'
  store i8 121, i8* %".34", align 8
  %".37" = getelementptr inbounds [10 x i8], [10 x i8]* %".4", i32 0, i32 0
  ;  printf "%s" s
  %".39" = bitcast [3 x i8]* @".str.0" to i8*
  %".40" = alloca i8*
  store i8* %".37", i8** %".40"
  %".42" = load i8*, i8** %".40"
  %".43" = call i32 (i8*, ...) @"printf"(i8* %".39", i8* %".42")
  ret i32 0
  ; return 0
}

@".str.0" = internal constant [3 x i8] c"%s\00"
declare i32 @"printf"(i8* %".1", ...)

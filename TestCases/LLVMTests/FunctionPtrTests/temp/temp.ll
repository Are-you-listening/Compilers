; ModuleID = "tests/test14.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"m"(i32 %".1")
{
.3:
  %".4" = alloca i32
  store i32 %".1", i32* %".4"
  ret i32 5
  ;    INT m ( INT a ) { return 5 ;
}

define i32 @"main"()
{
.2:
  ; }  INT main ( ) {  INT ( * v ) ( FLOAT ) = & m ;
  %".4" = bitcast i32 (i32)* @"m" to i32 (float)*
  %".5" = alloca i32 (float)*, align 8
  store i32 (float)* %".4", i32 (float)** %".5", align 8
  %".7" = load i32 (float)*, i32 (float)** %".5", align 8
  ;  INT b = v ( 5 ) ;
  %".9" = call i32 %".7"(float 0x4014000000000000)
  %".10" = alloca i32, align 4
  store i32 %".9", i32* %".10", align 4
  %".12" = load i32, i32* %".10", align 4
  ; printf ( "%d" , b ) ;
  %".14" = bitcast [3 x i8]* @".str.0" to i8*
  %".15" = alloca i32
  store i32 %".12", i32* %".15"
  %".17" = load i32, i32* %".15"
  %".18" = call i32 (i8*, ...) @"printf"(i8* %".14", i32 %".17")
  ret i32 0
  ;  return 0 ;
}

@".str.0" = internal constant [3 x i8] c"%d\00"
declare i32 @"printf"(i8* %".1", ...)

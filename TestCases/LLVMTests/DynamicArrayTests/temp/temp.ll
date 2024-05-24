; ModuleID = "tests/test4.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;     INT main ( ) {  INT * f = ( INT * ) calloc ( 10 , 4 ) ;
  %".4" = call i8* @"calloc"(i32 10, i32 4)
  %".5" = bitcast i8* %".4" to i32*
  %".6" = alloca i32*, align 8
  store i32* %".5", i32** %".6", align 8
  %".8" = load i32*, i32** %".6", align 8
  ;  * ( f + 9 ) = 5 ;
  %".10" = getelementptr inbounds i32, i32* %".8", i32 9
  store i32 5, i32* %".10", align 4
  %".12" = load i32*, i32** %".6", align 8
  ; printf ( "%d" , * ( f + 9 ) ) ;
  %".14" = getelementptr inbounds i32, i32* %".12", i32 9
  %".15" = load i32, i32* %".14", align 4
  %".16" = bitcast [3 x i8]* @".str.0" to i8*
  %".17" = alloca i32
  store i32 %".15", i32* %".17"
  %".19" = load i32, i32* %".17"
  %".20" = call i32 (i8*, ...) @"printf"(i8* %".16", i32 %".19")
  ret i32 0
  ;   return 0 ;
}

declare i8* @"calloc"(i32 %".1", i32 %".2")

@".str.0" = internal constant [3 x i8] c"%d\00"
declare i32 @"printf"(i8* %".1", ...)

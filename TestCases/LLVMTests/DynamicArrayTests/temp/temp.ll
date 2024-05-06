; ModuleID = "tests/test8.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;     struct v { INT a ; FLOAT b ; } ;  INT main ( ) {  struct v * c = malloc ( 200 ) ;
  %".4" = call i8* @"malloc"(i32 200)
  %".5" = bitcast i8* %".4" to {i32, float}*
  %".6" = alloca {i32, float}*, align 8
  store {i32, float}* %".5", {i32, float}** %".6", align 8
  %".8" = load {i32, float}*, {i32, float}** %".6", align 8
  ; c -> a = 5 ;
  %".10" = getelementptr inbounds {i32, float}, {i32, float}* %".8", i32 0, i32 0
  store i32 5, i32* %".10", align 4
  %".12" = load {i32, float}*, {i32, float}** %".6", align 8
  ;  printf ( "%d" , c -> a ) ;
  %".14" = getelementptr inbounds {i32, float}, {i32, float}* %".12", i32 0, i32 0
  %".15" = load i32, i32* %".14", align 4
  %".16" = bitcast [3 x i8]* @".str.0" to i8*
  %".17" = alloca i32
  store i32 %".15", i32* %".17"
  %".19" = load i32, i32* %".17"
  %".20" = call i32 (i8*, ...) @"printf"(i8* %".16", i32 %".19")
  ;  free ( c ) ;
  %".22" = load {i32, float}*, {i32, float}** %".6", align 8
  %".23" = bitcast {i32, float}* %".22" to i8*
  call void @"free"(i8* %".23")
  ret i32 0
  ;   return 0 ;
}

declare i8* @"malloc"(i32 %".1")

@".str.0" = internal constant [3 x i8] c"%d\00"
declare i32 @"printf"(i8* %".1", ...)

declare void @"free"(i8* %".1")

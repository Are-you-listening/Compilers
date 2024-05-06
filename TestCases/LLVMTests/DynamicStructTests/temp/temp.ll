; ModuleID = "tests/test2.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;      union v { INT a ; FLOAT b ; INT c ; } ;  INT main ( ) {  union v * c = malloc ( sizeof ( union v ) ) ;
  %".4" = call i8* @"malloc"(i32 4)
  %".5" = bitcast i8* %".4" to {float}*
  %".6" = alloca {float}*, align 8
  store {float}* %".5", {float}** %".6", align 8
  ; c -> a = 5 ;
  %".9" = load {float}*, {float}** %".6", align 8
  %".10" = getelementptr inbounds {float}, {float}* %".9", i32 0, i32 0
  %".11" = bitcast float* %".10" to i32*
  store i32 5, i32* %".11", align 4
  ;  printf ( "%d" , c -> a ) ;
  %".14" = load {float}*, {float}** %".6", align 8
  %".15" = getelementptr inbounds {float}, {float}* %".14", i32 0, i32 0
  %".16" = bitcast float* %".15" to i32*
  %".17" = load i32, i32* %".16", align 4
  %".18" = bitcast [3 x i8]* @".str.0" to i8*
  %".19" = alloca i32
  store i32 %".17", i32* %".19"
  %".21" = load i32, i32* %".19"
  %".22" = call i32 (i8*, ...) @"printf"(i8* %".18", i32 %".21")
  ;  free ( c ) ;
  %".24" = load {float}*, {float}** %".6", align 8
  %".25" = bitcast {float}* %".24" to i8*
  call void @"free"(i8* %".25")
  ret i32 0
  ;   return 0 ;
}

declare i8* @"malloc"(i32 %".1")

@".str.0" = internal constant [3 x i8] c"%d\00"
declare i32 @"printf"(i8* %".1", ...)

declare void @"free"(i8* %".1")

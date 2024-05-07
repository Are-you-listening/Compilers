; ModuleID = "/home/tibov/Desktop/universiteit/bachlor-2/Compilers/Project/Compilers/example_source_files/37_pre-processor_include/37_pre-processor_include.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = bitcast [3 x i8]* @".str.0" to i8*
  %".4" = alloca i32
  store i32 3, i32* %".4"
  %".6" = load i32, i32* %".4"
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".3", i32 %".6")
  ;    INT peer = 8 ;  INT x = 1 ;        INT main ( ) { printf ( "%d" , y ) ;
  %".9" = bitcast [3 x i8]* @".str.0" to i8*
  %".10" = alloca i32
  store i32 8, i32* %".10"
  %".12" = load i32, i32* %".10"
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".9", i32 %".12")
  ; printf ( "%d" , peer ) ;
  %".15" = bitcast [3 x i8]* @".str.1" to i8*
  %".16" = alloca float
  store float 0x400921fa00000000, float* %".16"
  %".18" = load float, float* %".16"
  %".19" = fpext float %".18" to double
  %".20" = call i32 (i8*, ...) @"printf"(i8* %".15", double %".19")
  ; printf ( "%f" , ) ;
  ret i32 0
  ; return 0 ;
}

@".str.0" = internal constant [3 x i8] c"%d\00"
declare i32 @"printf"(i8* %".1", ...)

@".str.1" = internal constant [3 x i8] c"%f\00"
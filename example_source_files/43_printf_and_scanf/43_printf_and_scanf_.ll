; ModuleID = "/home/tibov/Desktop/universiteit/bachlor-2/Compilers/Project/Compilers/example_source_files/43_printf_and_scanf/43_printf_and_scanf.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  ;    INT main ( ) { INT x ;
  %".5" = alloca i32, align 4
  ; INT y ;
  %".7" = bitcast [19 x i8]* @".str.0" to i8*
  %".8" = call i32 (i8*, ...) @"printf"(i8* %".7")
  ; printf ( "Enter two numbers:" ) ;
  %".10" = bitcast [5 x i8]* @".str.1" to i8*
  %".11" = alloca i32*
  %".12" = alloca i32*
  store i32* %".3", i32** %".11"
  store i32* %".5", i32** %".12"
  %".15" = load i32*, i32** %".11"
  %".16" = load i32*, i32** %".12"
  %".17" = call i32 (i8*, ...) @"scanf"(i8* %".10", i32* %".15", i32* %".16")
  ; scanf ( "%d%d" , & x , & y ) ;
  %".19" = load i32, i32* %".3", align 4
  ; printf ( "%d; %d" , x , y ) ;
  %".21" = load i32, i32* %".5", align 4
  %".22" = bitcast [7 x i8]* @".str.2" to i8*
  %".23" = alloca i32
  %".24" = alloca i32
  store i32 %".19", i32* %".23"
  store i32 %".21", i32* %".24"
  %".27" = load i32, i32* %".23"
  %".28" = load i32, i32* %".24"
  %".29" = call i32 (i8*, ...) @"printf"(i8* %".22", i32 %".27", i32 %".28")
  ret i32 0
  ; return 0 ;
}

@".str.0" = internal constant [19 x i8] c"Enter two numbers:\00"
declare i32 @"printf"(i8* %".1", ...)

@".str.1" = internal constant [5 x i8] c"%d%d\00"
declare i32 @"scanf"(i8* %".1", ...)

@".str.2" = internal constant [7 x i8] c"%d; %d\00"
; ModuleID = "/home/tibov/Desktop/universiteit/bachlor-2/Compilers/Project/Compilers/example_source_files/25_printf/25_printf.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = bitcast [24 x i8]* @".str.0" to i8*
  %".4" = alloca i32
  %".5" = alloca [6 x i8]*
  %".6" = alloca i32
  %".7" = alloca float
  %".8" = alloca i8
  store i32 3, i32* %".4"
  store [6 x i8]* @".str.1", [6 x i8]** %".5"
  store i32 255, i32* %".6"
  store float 0x40091eb860000000, float* %".7"
  store i8 99, i8* %".8"
  %".14" = load i32, i32* %".4"
  %".15" = load [6 x i8]*, [6 x i8]** %".5"
  %".16" = load i32, i32* %".6"
  %".17" = load float, float* %".7"
  %".18" = fpext float %".17" to double
  %".19" = load i8, i8* %".8"
  %".20" = call i32 (i8*, ...) @"printf"(i8* %".3", i32 %".14", [6 x i8]* %".15", i32 %".16", double %".18", i8 %".19")
  ;    INT main ( ) { INT a = 3 ; CHAR * b = "hello" ; INT c = 255 ; FLOAT d = 3.14 ; CHAR e = 'c' ; printf ( " %d \n %s \n %x \n %f \n %c" , a , b , c , d , e ) ;
  ret i32 0
  ; return 0 ;
}

@".str.0" = internal constant [24 x i8] c" %d \0a %s \0a %x \0a %f \0a %c\00"
@".str.1" = internal constant [6 x i8] c"hello\00"
declare i32 @"printf"(i8* %".1", ...)

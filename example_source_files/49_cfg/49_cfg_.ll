; ModuleID = "/home/tibov/Desktop/universiteit/bachlor-2/Compilers/Project/Compilers/example_source_files/49_cfg/49_cfg.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 5, i32* %".3", align 4
  ;    INT main ( ) { INT x = 5 ;
  %".6" = load i32, i32* %".3", align 4
  ;  if ( x < 5 ) {
  %".8" = icmp slt i32 %".6", 5
  br i1 %".8", label %".9", label %".13"
.9:
  %".10" = bitcast [21 x i8]* @".str.0" to i8*
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".10")
  ; printf ( "Something went wrong" ) ;
  br label %".25"
.13:
  %".14" = load i32, i32* %".3", align 4
  ; } else if ( x == 5 ) {
  %".16" = icmp eq i32 %".14", 5
  br i1 %".16", label %".17", label %".21"
.17:
  %".18" = bitcast [14 x i8]* @".str.1" to i8*
  %".19" = call i32 (i8*, ...) @"printf"(i8* %".18")
  ; printf ( "Hello world!\n" ) ;
  br label %".25"
.21:
  %".22" = bitcast [26 x i8]* @".str.2" to i8*
  %".23" = call i32 (i8*, ...) @"printf"(i8* %".22")
  ; } else { printf ( "Something went wrong here" ) ;
  br label %".25"
.25:
  ret i32 0
  ; } return 0 ;
}

@".str.0" = internal constant [21 x i8] c"Something went wrong\00"
declare i32 @"printf"(i8* %".1", ...)

@".str.1" = internal constant [14 x i8] c"Hello world!\0a\00"
@".str.2" = internal constant [26 x i8] c"Something went wrong here\00"
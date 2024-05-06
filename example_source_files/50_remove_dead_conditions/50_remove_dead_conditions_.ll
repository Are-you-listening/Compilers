; ModuleID = "/home/tibov/Desktop/universiteit/bachlor-2/Compilers/Project/Compilers/example_source_files/50_remove_dead_conditions/50_remove_dead_conditions.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 5, i32* %".3", align 4
  ;    INT main ( ) { INT x = 5 ;
  %".6" = bitcast [14 x i8]* @".str.0" to i8*
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".6")
  ;  if ( 0 == 0 ) { printf ( "Rico, kaboom!" ) ;
  ret i32 0
  ; } else if ( 0 != 0 ) { printf ( "kowalski analysis!" ) ; } return 0 ;
}

@".str.0" = internal constant [14 x i8] c"Rico, kaboom!\00"
declare i32 @"printf"(i8* %".1", ...)

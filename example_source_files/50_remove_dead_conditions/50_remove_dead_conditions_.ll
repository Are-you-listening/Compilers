; ModuleID = "/home/tibov/Desktop/universiteit/bachlor-2/Compilers/Project/Compilers/example_source_files/50_remove_dead_conditions/50_remove_dead_conditions.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = bitcast [14 x i8]* @".str.0" to i8*
  %".4" = call i32 (i8*, ...) @"printf"(i8* %".3")
  ;    INT main ( ) { INT x = 5 ;  if ( 0 == 0 ) { printf ( "Rico, kaboom!" ) ;
  ret i32 0
  ; } else if ( 0 != 0 ) { printf ( "Kowalski analysis!" ) ; } return 0 ;
}

@".str.0" = internal constant [14 x i8] c"Rico, kaboom!\00"
declare i32 @"printf"(i8* %".1", ...)

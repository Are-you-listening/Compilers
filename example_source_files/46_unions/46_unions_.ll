; ModuleID = "/home/tibov/Desktop/universiteit/bachlor-2/Compilers/Project/Compilers/example_source_files/46_unions/46_unions.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca {[2500 x i8]}, align 4096
  ;    union NotTypeSafe { INT as_integer ; FLOAT as_float ; CHAR as_str [ 50 ] [ 50 ] ; } ;  INT main ( ) { INT k ; FLOAT s ; union NotTypeSafe safety ;
  %".5" = alloca {[2500 x i8]}*, align 8
  ; union NotTypeSafe * safety_ptr ;
  ;  safety . as_integer = 5 ;
  %".8" = getelementptr inbounds {[2500 x i8]}, {[2500 x i8]}* %".3", i32 0, i32 0
  %".9" = bitcast [2500 x i8]* %".8" to i32*
  store i32 5, i32* %".9", align 4
  ; k = safety . as_integer ;  safety_ptr -> as_float = 3.14 ;
  %".12" = load {[2500 x i8]}*, {[2500 x i8]}** %".5", align 8
  %".13" = getelementptr inbounds {[2500 x i8]}, {[2500 x i8]}* %".12", i32 0, i32 0
  %".14" = bitcast [2500 x i8]* %".13" to float*
  store float 0x40091eb860000000, float* %".14", align 4
  ;  INT q = safety_ptr -> as_integer ;  ( * safety_ptr ) . as_str [ 49 ] [ 49 ] = 'a' ;
  %".17" = load {[2500 x i8]}*, {[2500 x i8]}** %".5", align 8
  %".18" = getelementptr inbounds {[2500 x i8]}, {[2500 x i8]}* %".17", i32 0, i32 0
  %".19" = bitcast [2500 x i8]* %".18" to [50 x [50 x i8]]*
  %".20" = getelementptr inbounds [50 x [50 x i8]], [50 x [50 x i8]]* %".19", i64 0, i32 49
  %".21" = getelementptr inbounds [50 x i8], [50 x i8]* %".20", i64 0, i32 49
  store i8 97, i8* %".21", align 4
  ret i32 0
  ;  return 0 ;
}

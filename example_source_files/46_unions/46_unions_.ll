; ModuleID = "/home/tibov/Desktop/universiteit/bachlor-2/Compilers/Project/Compilers/example_source_files/46_unions/46_unions.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

%"NotTypeSafe" = type {[10000 x i8]}
define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  ;    union NotTypeSafe { INT as_integer ; FLOAT as_float ; CHAR as_str [ 50 ] [ 50 ] ; } ;  INT main ( ) { INT k ;
  %".5" = alloca float, align 4
  ; FLOAT s ;
  %".7" = alloca %"NotTypeSafe", align 16384
  ; union NotTypeSafe safety ;
  %".9" = alloca %"NotTypeSafe"*, align 8
  ; union NotTypeSafe * safety_ptr ;
  ;  safety . as_integer = 5 ;
  %".12" = getelementptr inbounds %"NotTypeSafe", %"NotTypeSafe"* %".7", i32 0, i32 0
  %".13" = bitcast [10000 x i8]* %".12" to i32*
  store i32 5, i32* %".13", align 4
  ; k = safety . as_integer ;
  %".16" = getelementptr inbounds %"NotTypeSafe", %"NotTypeSafe"* %".7", i32 0, i32 0
  %".17" = bitcast [10000 x i8]* %".16" to i32*
  %".18" = load i32, i32* %".17", align 4
  store i32 %".18", i32* %".3", align 4
  ;  safety_ptr -> as_float = 3.14 ;
  %".21" = load %"NotTypeSafe"*, %"NotTypeSafe"** %".9", align 8
  %".22" = getelementptr inbounds %"NotTypeSafe", %"NotTypeSafe"* %".21", i32 0, i32 0
  %".23" = bitcast [10000 x i8]* %".22" to float*
  store float 0x40091eb860000000, float* %".23", align 4
  ;  INT q = safety_ptr -> as_integer ;
  %".26" = load %"NotTypeSafe"*, %"NotTypeSafe"** %".9", align 8
  %".27" = getelementptr inbounds %"NotTypeSafe", %"NotTypeSafe"* %".26", i32 0, i32 0
  %".28" = bitcast [10000 x i8]* %".27" to i32*
  %".29" = load i32, i32* %".28", align 4
  %".30" = alloca i32, align 4
  store i32 %".29", i32* %".30", align 4
  ;  ( * safety_ptr ) . as_str [ 49 ] [ 49 ] = 'a' ;
  %".33" = load %"NotTypeSafe"*, %"NotTypeSafe"** %".9", align 8
  %".34" = getelementptr inbounds %"NotTypeSafe", %"NotTypeSafe"* %".33", i32 0, i32 0
  %".35" = bitcast [10000 x i8]* %".34" to [50 x [50 x i8]]*
  %".36" = getelementptr inbounds [50 x [50 x i8]], [50 x [50 x i8]]* %".35", i64 0, i32 49
  %".37" = getelementptr inbounds [50 x i8], [50 x i8]* %".36", i64 0, i32 49
  store i8 97, i8* %".37", align 4
  ret i32 0
  ;  return 0 ;
}

; ModuleID = "/home/watson/OneDrive/2023-2024/Compilers/Project/Compilers/example_source_files/46_unions/46_unions.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

%"NotTypeSafe" = type {[8 x i8]}
define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  ;    union NotTypeSafe { INT as_integer ; FLOAT as_float ; CHAR as_str [ 2 ] [ 2 ] ; } ;  INT main ( ) { INT k ;
  %".5" = alloca float, align 4
  ; FLOAT s ;
  %".7" = alloca %"NotTypeSafe", align 16
  ; union NotTypeSafe safety ;
  %".9" = alloca %"NotTypeSafe"*, align 8
  ; union NotTypeSafe * safety_ptr ;
  ;  safety . as_integer = 5 ;
  %".12" = getelementptr inbounds %"NotTypeSafe", %"NotTypeSafe"* %".7", i32 0, i32 0
  %".13" = bitcast [8 x i8]* %".12" to i32*
  store i32 5, i32* %".13", align 4
  ; k = safety . as_integer ;
  %".16" = getelementptr inbounds %"NotTypeSafe", %"NotTypeSafe"* %".7", i32 0, i32 0
  %".17" = bitcast [8 x i8]* %".16" to i32*
  %".18" = load i32, i32* %".17", align 4
  store i32 %".18", i32* %".3", align 4
  ;  safety_ptr -> as_float = 3.14 ;
  %".21" = load %"NotTypeSafe"*, %"NotTypeSafe"** %".9", align 8
  %".22" = getelementptr inbounds %"NotTypeSafe", %"NotTypeSafe"* %".21", i32 0, i32 0
  %".23" = bitcast [8 x i8]* %".22" to float*
  store float 0x40091eb860000000, float* %".23", align 4
  ;  INT q = safety_ptr -> as_integer ;
  %".26" = load %"NotTypeSafe"*, %"NotTypeSafe"** %".9", align 8
  %".27" = getelementptr inbounds %"NotTypeSafe", %"NotTypeSafe"* %".26", i32 0, i32 0
  %".28" = bitcast [8 x i8]* %".27" to i32*
  %".29" = load i32, i32* %".28", align 4
  %".30" = alloca i32, align 4
  store i32 %".29", i32* %".30", align 4
  ;  ( * safety_ptr ) . as_str [ 0 ] [ 0 ] = 'a' ;
  %".33" = load %"NotTypeSafe"*, %"NotTypeSafe"** %".9", align 8
  %".34" = getelementptr inbounds %"NotTypeSafe", %"NotTypeSafe"* %".33", i32 0, i32 0
  %".35" = bitcast [8 x i8]* %".34" to [2 x [2 x i8]]*
  %".36" = getelementptr inbounds [2 x [2 x i8]], [2 x [2 x i8]]* %".35", i64 0, i32 0
  %".37" = getelementptr inbounds [2 x i8], [2 x i8]* %".36", i64 0, i32 0
  store i8 97, i8* %".37", align 4
  ;  printf ( "%c" , ( * safety_ptr ) . as_str [ 0 ] [ 0 ] ) ;
  %".40" = load %"NotTypeSafe"*, %"NotTypeSafe"** %".9", align 8
  %".41" = getelementptr inbounds %"NotTypeSafe", %"NotTypeSafe"* %".40", i32 0, i32 0
  %".42" = bitcast [8 x i8]* %".41" to [2 x [2 x i8]]*
  %".43" = getelementptr inbounds [2 x [2 x i8]], [2 x [2 x i8]]* %".42", i64 0, i32 0
  %".44" = getelementptr inbounds [2 x i8], [2 x i8]* %".43", i64 0, i32 0
  %".45" = load i8, i8* %".44", align 4
  %".46" = bitcast [3 x i8]* @".str.0" to i8*
  %".47" = alloca i8
  store i8 %".45", i8* %".47"
  %".49" = load i8, i8* %".47"
  %".50" = call i32 (i8*, ...) @"printf"(i8* %".46", i8 %".49")
  ret i32 0
  ;  return 0 ;
}

@".str.0" = internal constant [3 x i8] c"%c\00"
declare i32 @"printf"(i8* %".1", ...)

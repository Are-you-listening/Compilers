; ModuleID = "/home/tibov/Desktop/universiteit/bachlor-2/Compilers/Project/Compilers/example_source_files/1_binary_operations/1_binary_operations.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 6, i32* %".3", align 4
  ;   INT main ( ) {  INT a = 6 ;
  store i32 6, i32* %".3", align 4
  ; a = 6 ;
  %".8" = alloca i32, align 4
  store i32 2, i32* %".8", align 4
  ; INT b = 2 ;
  store i32 2, i32* %".8", align 4
  ; b = 2 ;
  ret i32 0
  ;  INT c = a + b ; INT d = a - b ; INT e = a * b ; INT f = a / b ;  INT g = a == b ; INT h = a < b ; INT i = a > b ;  INT j = a != b ; INT k = a <= b ; INT l = a >= b ;  INT m = a % b ;  INT n = a << b ;  INT o = a >> b ;  return 0 ;
}

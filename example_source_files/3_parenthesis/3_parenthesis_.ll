; ModuleID = "/home/watson/OneDrive/2023-2024/Compilers/Project/Compilers/example_source_files/3_parenthesis/3_parenthesis.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 5, i32* %".3", align 4
  ;   INT main ( ) {  INT a = 5 ;
  store i32 5, i32* %".3", align 4
  ; a = 5 ;
  %".8" = alloca i32, align 4
  store i32 6, i32* %".8", align 4
  ;  INT b = 6 ;
  store i32 6, i32* %".8", align 4
  ; b = 6 ;
  %".13" = alloca i32, align 4
  store i32 3, i32* %".13", align 4
  ;  INT c = 3 ;
  store i32 3, i32* %".13", align 4
  ; c = 3 ;
  %".18" = load i32, i32* %".3", align 4
  ;  INT d = ( a + b ) * c ;
  %".20" = load i32, i32* %".8", align 4
  %".21" = add i32 %".18", %".20"
  %".22" = load i32, i32* %".13", align 4
  %".23" = mul i32 %".21", %".22"
  %".24" = alloca i32, align 4
  store i32 %".23", i32* %".24", align 4
  ret i32 0
  ;  return 0 ;
}
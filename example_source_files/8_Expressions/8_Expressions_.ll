; ModuleID = "/home/watson/OneDrive/2023-2024/Compilers/Project/Compilers/example_source_files/8_Expressions/8_Expressions.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 5, i32* %".3", align 4
  ;  INT main ( ) { INT a = 5 ;
  %".6" = alloca i32, align 4
  store i32 4, i32* %".6", align 4
  ; INT b = 4 ;
  %".9" = load i32, i32* %".3", align 4
  ; a + b ;
  %".11" = load i32, i32* %".6", align 4
  %".12" = add i32 %".9", %".11"
  %".13" = load i32, i32* %".3", align 4
  ; a - b ;
  %".15" = load i32, i32* %".6", align 4
  %".16" = sub i32 %".13", %".15"
  %".17" = load i32, i32* %".3", align 4
  ; a / b ;
  %".19" = load i32, i32* %".6", align 4
  %".20" = sdiv i32 %".17", %".19"
  %".21" = load i32, i32* %".3", align 4
  ; a * b ;
  %".23" = load i32, i32* %".6", align 4
  %".24" = mul i32 %".21", %".23"
  %".25" = load i32, i32* %".3", align 4
  ; a > b ;
  %".27" = load i32, i32* %".6", align 4
  %".28" = icmp sgt i32 %".25", %".27"
  %".29" = load i32, i32* %".3", align 4
  ; a < b ;
  %".31" = load i32, i32* %".6", align 4
  %".32" = icmp slt i32 %".29", %".31"
  ret i32 0
  ; a && b ; a || b ;  return 0 ;
}

; ModuleID = "/home/watson/OneDrive/2023-2024/Compilers/Project/Compilers/example_source_files/26_typedefs/26_typedefs.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 1, i32* %".3", align 4
  ;  typedef INT bool ; typedef CHAR appel ; typedef const CHAR peer ; typedef const bool Cbool ;  INT main ( ) { bool x = 1 ;
  %".6" = alloca i32, align 4
  store i32 0, i32* %".6", align 4
  ; bool y = 0 ;
  %".9" = alloca i32, align 4
  store i32 0, i32* %".9", align 4
  ; INT z = x && y ;
  %".12" = alloca i8, align 1
  store i8 5, i8* %".12", align 1
  ;  appel a = 5 ;
  %".15" = alloca i8, align 1
  store i8 4, i8* %".15", align 1
  ; peer b = 4 ;
  %".18" = alloca i32, align 4
  store i32 1, i32* %".18", align 4
  ; Cbool c = 1 ;
  %".21" = load i32, i32* %".6", align 4
  ;  bool boo = y * z * 57809 ;
  %".23" = mul i32 %".21", 0
  %".24" = mul i32 %".23", 57809
  %".25" = alloca i32, align 4
  store i32 %".24", i32* %".25", align 4
  ret i32 0
  ; return 0 ;
}
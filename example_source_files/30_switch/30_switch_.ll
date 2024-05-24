; ModuleID = "/home/watson/OneDrive/2023-2024/Compilers/Project/Compilers/example_source_files/30_switch/30_switch.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  ;    INT main ( ) { INT b ;
  %".5" = alloca i32, align 4
  store i32 1, i32* %".5", align 4
  ; INT a = 1 ;
  %".8" = load i32, i32* %".5", align 4
  ; switch ( a ) {
  %".10" = icmp eq i32 %".8", 1
  br i1 %".10", label %".11", label %".14"
.11:
  ; case 1 : b = 1 ;
  store i32 1, i32* %".3", align 4
  br label %".14"
.14:
  %".15" = load i32, i32* %".5", align 4
  %".16" = icmp ne i32 %".15", 1
  br i1 %".16", label %".17", label %".20"
.17:
  ; break ; default : b = 3 ;
  store i32 3, i32* %".3", align 4
  br label %".20"
.20:
  ret i32 0
  ; break ;  } return 0 ;
}

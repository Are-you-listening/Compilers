; ModuleID = "/home/tibov/Desktop/universiteit/bachlor-2/Compilers/Project/Compilers/example_source_files/30_switch/30_switch.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 1, i32* %".3", align 4
  ;    INT main ( ) { INT b ; INT a = 1 ;
  %".6" = load i32, i32* %".3", align 4
  ; switch ( a ) {
  %".8" = icmp eq i32 %".6", 1
  br i1 %".8", label %".9", label %".11"
.9:
  ; case 1 : b = 1 ;
  br label %".11"
.11:
  %".12" = load i32, i32* %".3", align 4
  %".13" = icmp ne i32 %".12", 1
  br i1 %".13", label %".14", label %".16"
.14:
  ; break ; default : b = 3 ;
  br label %".16"
.16:
  ret i32 0
  ; break ;  } return 0 ;
}

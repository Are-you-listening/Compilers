; ModuleID = "/home/watson/OneDrive/2023-2024/Compilers/Project/Compilers/example_source_files/29_scoping/29_scoping.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 0, i32* %".3", align 4
  ;  INT main ( ) { INT x = 0 ;
  %".6" = alloca i32, align 4
  store i32 1, i32* %".6", align 4
  ; { INT x = 1 ;
  ; if ( x ) {
  %".10" = icmp ne i32 1, 0
  br i1 %".10", label %".11", label %".15"
.11:
  %".12" = alloca i32, align 4
  store i32 2, i32* %".12", align 4
  ; INT x = 2 ;
  br label %".15"
.15:
  br label %".16"
.16:
  ; } } while ( x ) {
  %".18" = load i32, i32* %".3", align 4
  %".19" = icmp ne i32 %".18", 0
  br i1 %".19", label %".20", label %".22"
.20:
  ; continue ;
  br label %".16"
.22:
  ret i32 0
  ; } return 0 ;
}

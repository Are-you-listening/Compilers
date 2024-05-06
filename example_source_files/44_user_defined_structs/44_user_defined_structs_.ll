; ModuleID = "/home/watson/OneDrive/2023-2024/Compilers/Project/Compilers/example_source_files/44_user_defined_structs/44_user_defined_structs.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca {i32, i32}, align 8
  ;  struct kaas { INT melk ; INT fermtented ; } ;  INT main ( ) { struct kaas ementaler ;
  %".5" = getelementptr inbounds {i32, i32}, {i32, i32}* %".3", i32 0, i32 0
  ; ementaler . melk = 1 ;
  store i32 1, i32* %".5", align 4
  %".8" = getelementptr inbounds {i32, i32}, {i32, i32}* %".3", i32 0, i32 1
  ; ementaler . fermtented = 18 ;
  store i32 18, i32* %".8", align 4
  %".11" = alloca {i32, i32}, align 8
  ;  struct kaas gouda ;
  %".13" = getelementptr inbounds {i32, i32}, {i32, i32}* %".11", i32 0, i32 0
  ; gouda . melk = 7 ;
  store i32 7, i32* %".13", align 4
  %".16" = getelementptr inbounds {i32, i32}, {i32, i32}* %".11", i32 0, i32 1
  ; gouda . fermtented = 9 ;
  store i32 9, i32* %".16", align 4
  ret i32 0
  ;  return 0 ;
}

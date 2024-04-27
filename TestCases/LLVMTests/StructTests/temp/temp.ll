; ModuleID = "tests/test13.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;    struct kaas INT melk FLOAT fermtented CHAR lol CHAR * zeta   INT main
  %".4" = alloca {i32, float, i8, i8*}, align 1
  ; struct kaas ementaler
  %".6" = getelementptr inbounds {i32, float, i8, i8*}, {i32, float, i8, i8*}* %".4", i32 0, i32 0
  ;  ementaler . melk = 1
  store i32 1, i32* %".6", align 4
  %".9" = getelementptr inbounds {i32, float, i8, i8*}, {i32, float, i8, i8*}* %".4", i32 0, i32 1
  ; ementaler . fermtented = 18.9
  store float 0x4032e66660000000, float* %".9", align 4
  %".12" = getelementptr inbounds {i32, float, i8, i8*}, {i32, float, i8, i8*}* %".4", i32 0, i32 2
  ; ementaler . lol = 'l'
  store i8 108, i8* %".12", align 4
  %".15" = getelementptr inbounds {i32, float, i8, i8*}, {i32, float, i8, i8*}* %".4", i32 0, i32 3
  ; ementaler . zeta = & ementaler . lol
  %".17" = getelementptr inbounds {i32, float, i8, i8*}, {i32, float, i8, i8*}* %".4", i32 0, i32 2
  %".18" = load i8, i8* %".17", align 4
}

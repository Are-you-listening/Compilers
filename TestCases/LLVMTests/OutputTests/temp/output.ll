; ModuleID = "tests/test21.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;  INT main
  ;  line 1
  ;
  %".6" = alloca i8, align 1
  store i8 10, i8* %".6", align 1
  ; CHAR c = '\n'
  %".9" = alloca float, align 4
  store float 0x40408cccc0000000, float* %".9", align 4
  ;   FLOAT f = 33.1
  ;  another line
  ; ///// some documentation
  ;
  ; ///////////////////////////////////
  ;
  ;  abcdef 123 //////////
  ;
  %".19" = alloca float, align 4
  store float 0x4040ffdda0000000, float* %".19", align 4
  ; FLOAT final_line = 33.99895
  ret i32 0
  ;  return 0
}

; ModuleID = "tests/test20.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;  INT main
  ;  * This is a comment *
  ;
  %".6" = alloca i32, align 4
  store i32 5, i32* %".6", align 4
  ;    INT line_of_code = 5
  ; * * Another Comment  ***** /  /**  *  *  *
  ;
  %".11" = alloca float, align 4
  store float 0x4046800000000000, float* %".11", align 4
  ;        FLOAT f = 45
  ;  /// ** ** // // //
  ;
  %".16" = alloca i8, align 1
  store i8 98, i8* %".16", align 1
  ;   CHAR c = 'b'
  %".19" = alloca i32, align 4
  store i32 5, i32* %".19", align 4
  ;  INT x = 5
  ret i32 0
  ;  return 0
}

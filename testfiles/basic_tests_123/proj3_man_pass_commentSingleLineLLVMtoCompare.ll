; ModuleID = "testfiles/basic_tests_123/proj3_man_pass_commentSingleLine.c"
target triple = "unknown-unknown-unknown"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;  line 1
  %".4" = alloca i8, align 1
  store i8 '\n', i8* %".4", align 1
  ; CHAR c = '\n'
  %".7" = alloca float, align 4
  store float 0x40408cccc0000000, float* %".7", align 4
  ; FLOAT f = 33.1 // another line
  ;  another line
  ; ///// some documentation
  ; ///////////////////////////////////
  ;  abcdef 123 //////////
  %".14" = alloca float, align 4
  store float 0x4040ffdda0000000, float* %".14", align 4
  ; FLOAT final_line = 33.99895
}
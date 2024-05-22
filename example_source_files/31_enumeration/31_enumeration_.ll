; ModuleID = "/home/tibov/Desktop/universiteit/bachlor-2/Compilers/Project/Compilers/example_source_files/31_enumeration/31_enumeration.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  ;    enum week { Mon , Tue , Wed , Thur , Fri , Sat , Sun } ;  INT main ( ) { enum week day ;
  store i32 2, i32* %".3", align 4
  ; day = Wed ;
  ret i32 0
  ; return 0 ;
}

@"Sun" = global i32 6, align 4
@"Sat" = global i32 5, align 4
@"Fri" = global i32 4, align 4
@"Thur" = global i32 3, align 4
@"Wed" = global i32 2, align 4
@"Tue" = global i32 1, align 4
@"Mon" = global i32 0, align 4
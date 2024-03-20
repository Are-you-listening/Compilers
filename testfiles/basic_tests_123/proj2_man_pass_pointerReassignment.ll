; ModuleID = 'testfiles/basic_tests_123/proj2_man_pass_pointerReassignment.c'
source_filename = "testfiles/basic_tests_123/proj2_man_pass_pointerReassignment.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32*, align 8
  %4 = alloca i8, align 1
  %5 = alloca i8, align 1
  %6 = alloca i8*, align 8
  store i32 -6250, i32* %1, align 4
  store i32 5, i32* %2, align 4
  store i32* %2, i32** %3, align 8
  %7 = load i32*, i32** %3, align 8
  store i32 36941, i32* %7, align 4
  store i32* %1, i32** %3, align 8
  store i8 120, i8* %4, align 1
  store i8 10, i8* %5, align 1
  store i8* %4, i8** %6, align 8
  %8 = load i8*, i8** %6, align 8
  store i8 9, i8* %8, align 1
  store i8* %5, i8** %6, align 8
  ret i32 0
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}

; ModuleID = 'testfiles/basic_tests_123/proj2_man_pass_advancedPointerOperations.c'
source_filename = "testfiles/basic_tests_123/proj2_man_pass_advancedPointerOperations.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca float*, align 8
  %7 = alloca i32, align 4
  store i32 4, i32* %1, align 4
  store i32 5, i32* %2, align 4
  store i32* %1, i32** %3, align 8
  %8 = load i32*, i32** %3, align 8
  %9 = getelementptr inbounds i32, i32* %8, i32 1
  store i32* %9, i32** %3, align 8
  %10 = load i32*, i32** %3, align 8
  %11 = getelementptr inbounds i32, i32* %10, i32 -1
  store i32* %11, i32** %3, align 8
  %12 = load i32*, i32** %3, align 8
  %13 = icmp eq i32* %12, %1
  %14 = zext i1 %13 to i32
  store i32 %14, i32* %4, align 4
  %15 = load i32*, i32** %3, align 8
  %16 = icmp eq i32* %15, %2
  %17 = zext i1 %16 to i32
  store i32 %17, i32* %5, align 4
  %18 = load i32*, i32** %3, align 8
  %19 = icmp ne i32* %1, %18
  %20 = zext i1 %19 to i32
  store i32 %20, i32* %5, align 4
  store float* null, float** %6, align 8
  %21 = load float*, float** %6, align 8
  %22 = load i32*, i32** %3, align 8
  %23 = bitcast i32* %22 to float*
  %24 = icmp uge float* %21, %23
  %25 = zext i1 %24 to i32
  %26 = load float*, float** %6, align 8
  %27 = load i32*, i32** %3, align 8
  %28 = bitcast i32* %27 to float*
  %29 = icmp ule float* %26, %28
  %30 = zext i1 %29 to i32
  %31 = load i32*, i32** %3, align 8
  %32 = icmp ugt i32* %31, %1
  %33 = zext i1 %32 to i32
  %34 = load i32*, i32** %3, align 8
  %35 = icmp ult i32* %34, inttoptr (i64 32 to i32*)
  %36 = zext i1 %35 to i32
  store i32 4, i32* %7, align 4
  %37 = load i32*, i32** %3, align 8
  %38 = load i32, i32* %7, align 4
  %39 = mul nsw i32 4, %38
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds i32, i32* %37, i64 %40
  store i32* %41, i32** %3, align 8
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

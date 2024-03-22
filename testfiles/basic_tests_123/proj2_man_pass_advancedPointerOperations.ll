; ModuleID = 'testfiles/basic_tests_123/proj2_man_pass_advancedPointerOperations.c'
source_filename = "testfiles/basic_tests_123/proj2_man_pass_advancedPointerOperations.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca float*, align 8
  %8 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  store i32 4, i32* %2, align 4
  store i32 5, i32* %3, align 4
  store i32* %2, i32** %4, align 8
  %9 = load i32*, i32** %4, align 8
  %10 = getelementptr inbounds i32, i32* %9, i32 1
  store i32* %10, i32** %4, align 8
  %11 = load i32*, i32** %4, align 8
  %12 = getelementptr inbounds i32, i32* %11, i32 -1
  store i32* %12, i32** %4, align 8
  %13 = load i32*, i32** %4, align 8
  %14 = icmp eq i32* %13, %2
  %15 = zext i1 %14 to i32
  store i32 %15, i32* %5, align 4
  %16 = load i32*, i32** %4, align 8
  %17 = icmp eq i32* %16, %3
  %18 = zext i1 %17 to i32
  store i32 %18, i32* %6, align 4
  %19 = load i32*, i32** %4, align 8
  %20 = icmp ne i32* %2, %19
  %21 = zext i1 %20 to i32
  store i32 %21, i32* %6, align 4
  store float* null, float** %7, align 8
  %22 = load float*, float** %7, align 8
  %23 = load i32*, i32** %4, align 8
  %24 = bitcast i32* %23 to float*
  %25 = icmp uge float* %22, %24
  %26 = zext i1 %25 to i32
  %27 = load float*, float** %7, align 8
  %28 = load i32*, i32** %4, align 8
  %29 = bitcast i32* %28 to float*
  %30 = icmp ule float* %27, %29
  %31 = zext i1 %30 to i32
  %32 = load i32*, i32** %4, align 8
  %33 = icmp ugt i32* %32, %2
  %34 = zext i1 %33 to i32
  %35 = load i32*, i32** %4, align 8
  %36 = icmp ult i32* %35, inttoptr (i64 32 to i32*)
  %37 = zext i1 %36 to i32
  store i32 4, i32* %8, align 4
  %38 = load i32*, i32** %4, align 8
  %39 = load i32, i32* %8, align 4
  %40 = mul nsw i32 4, %39
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds i32, i32* %38, i64 %41
  store i32* %42, i32** %4, align 8
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

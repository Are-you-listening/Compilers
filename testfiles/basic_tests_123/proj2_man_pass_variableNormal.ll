; ModuleID = 'testfiles/basic_tests_123/proj2_man_pass_variableNormal.c'
source_filename = "testfiles/basic_tests_123/proj2_man_pass_variableNormal.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca float, align 4
  %4 = alloca float, align 4
  %5 = alloca i8, align 1
  store i32 5, i32* %1, align 4
  %6 = load i32, i32* %1, align 4
  %7 = add nsw i32 %6, 3
  store i32 %7, i32* %2, align 4
  %8 = load i32, i32* %2, align 4
  %9 = load i32, i32* %2, align 4
  %10 = mul nsw i32 %8, %9
  %11 = load i32, i32* %2, align 4
  %12 = mul nsw i32 %10, %11
  %13 = load i32, i32* %1, align 4
  %14 = load i32, i32* %1, align 4
  %15 = add nsw i32 %13, %14
  %16 = mul nsw i32 %12, %15
  store i32 %16, i32* %1, align 4
  store float 0x3FEF8FDE20000000, float* %3, align 4
  %17 = load float, float* %3, align 4
  %18 = fpext float %17 to double
  %19 = call double @llvm.fmuladd.f64(double %18, double 3.300000e+01, double 2.000000e+00)
  %20 = fptrunc double %19 to float
  store float %20, float* %4, align 4
  %21 = load float, float* %4, align 4
  %22 = load float, float* %3, align 4
  %23 = fadd float %21, %22
  store float %23, float* %4, align 4
  store i8 97, i8* %5, align 1
  store i8 98, i8* %5, align 1
  ret i32 0
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fmuladd.f64(double, double, double) #1

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}

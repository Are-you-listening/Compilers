; ModuleID = 'testfiles/basic_tests_123/proj2_man_pass_conversionImplicit.c'
source_filename = "testfiles/basic_tests_123/proj2_man_pass_conversionImplicit.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca float, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 5, i32* %1, align 4
  %5 = load i32, i32* %1, align 4
  %6 = sitofp i32 %5 to float
  store float %6, float* %2, align 4
  store i32 -32682, i32* %3, align 4
  %7 = load i32, i32* %3, align 4
  %8 = sitofp i32 %7 to double
  %9 = load i32, i32* %1, align 4
  %10 = sitofp i32 %9 to double
  %11 = call double @llvm.fmuladd.f64(double 3.300000e+01, double %8, double %10)
  %12 = fptrunc double %11 to float
  store float %12, float* %2, align 4
  %13 = load float, float* %2, align 4
  %14 = fpext float %13 to double
  %15 = fmul double %14, 0x3FE6666666666666
  %16 = fptosi double %15 to i32
  store i32 %16, i32* %3, align 4
  store i32 219, i32* %4, align 4
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

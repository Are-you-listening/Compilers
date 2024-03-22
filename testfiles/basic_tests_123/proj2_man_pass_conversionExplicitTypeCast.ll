; ModuleID = 'testfiles/basic_tests_123/proj2_man_pass_conversionExplicitTypeCast.c'
source_filename = "testfiles/basic_tests_123/proj2_man_pass_conversionExplicitTypeCast.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca float, align 4
  %4 = alloca i32, align 4
  %5 = alloca float, align 4
  %6 = alloca i32, align 4
  %7 = alloca float, align 4
  store i32 0, i32* %1, align 4
  store i32 5, i32* %2, align 4
  store float 0x40E098B2C0000000, float* %3, align 4
  %8 = load float, float* %3, align 4
  %9 = fptosi float %8 to i32
  store i32 %9, i32* %4, align 4
  %10 = load i32, i32* %2, align 4
  %11 = sitofp i32 %10 to float
  store float %11, float* %5, align 4
  %12 = load float, float* %3, align 4
  %13 = load float, float* %5, align 4
  %14 = call float @llvm.fmuladd.f32(float %13, float 2.000000e+00, float %12)
  %15 = fptosi float %14 to i32
  store i32 %15, i32* %6, align 4
  %16 = load float, float* %3, align 4
  store float %16, float* %7, align 4
  %17 = load i32, i32* %6, align 4
  %18 = sitofp i32 %17 to float
  %19 = load float, float* %5, align 4
  %20 = fdiv float %19, 1.956960e+05
  %21 = fadd float %18, %20
  store float %21, float* %7, align 4
  ret i32 0
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #1

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

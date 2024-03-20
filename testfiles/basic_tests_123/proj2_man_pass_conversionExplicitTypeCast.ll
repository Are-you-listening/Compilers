; ModuleID = 'testfiles/basic_tests_123/proj2_man_pass_conversionExplicitTypeCast.c'
source_filename = "testfiles/basic_tests_123/proj2_man_pass_conversionExplicitTypeCast.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca float, align 4
  %3 = alloca i32, align 4
  %4 = alloca float, align 4
  %5 = alloca i32, align 4
  %6 = alloca float, align 4
  store i32 5, i32* %1, align 4
  store float 0x40E098B2C0000000, float* %2, align 4
  %7 = load float, float* %2, align 4
  %8 = fptosi float %7 to i32
  store i32 %8, i32* %3, align 4
  %9 = load i32, i32* %1, align 4
  %10 = sitofp i32 %9 to float
  store float %10, float* %4, align 4
  %11 = load float, float* %2, align 4
  %12 = load float, float* %4, align 4
  %13 = call float @llvm.fmuladd.f32(float %12, float 2.000000e+00, float %11)
  %14 = fptosi float %13 to i32
  store i32 %14, i32* %5, align 4
  %15 = load float, float* %2, align 4
  store float %15, float* %6, align 4
  %16 = load i32, i32* %5, align 4
  %17 = sitofp i32 %16 to float
  %18 = load float, float* %4, align 4
  %19 = fdiv float %18, 1.956960e+05
  %20 = fadd float %17, %19
  store float %20, float* %6, align 4
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

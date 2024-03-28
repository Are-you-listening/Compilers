; ModuleID = 'tests/test10.c'
source_filename = "tests/test10.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32*, align 8
  %4 = alloca i32**, align 8
  %5 = alloca i32*, align 8
  %6 = alloca float, align 4
  %7 = alloca float*, align 8
  store i32 0, i32* %1, align 4
  store i32 98362, i32* %2, align 4
  %8 = load i32, i32* %2, align 4
  %9 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32 noundef %8)
  store i32* %2, i32** %3, align 8
  store i32** %3, i32*** %4, align 8
  %10 = load i32**, i32*** %4, align 8
  %11 = load i32*, i32** %10, align 8
  %12 = load i32*, i32** %3, align 8
  %13 = icmp eq i32* %11, %12
  %14 = zext i1 %13 to i32
  %15 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32 noundef %14)
  store i32* %2, i32** %5, align 8
  %16 = load i32*, i32** %5, align 8
  %17 = load i32, i32* %16, align 4
  %18 = load i32, i32* %2, align 4
  %19 = icmp eq i32 %17, %18
  %20 = zext i1 %19 to i32
  %21 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32 noundef %20)
  store float 0x408AC20DA0000000, float* %6, align 4
  store float* %6, float** %7, align 8
  %22 = load float*, float** %7, align 8
  %23 = load float, float* %22, align 4
  %24 = load float, float* %6, align 4
  %25 = fcmp oeq float %23, %24
  %26 = zext i1 %25 to i32
  %27 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32 noundef %26)
  ret i32 0
}

declare i32 @printf(i8* noundef, ...) #1

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}

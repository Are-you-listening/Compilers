; ModuleID = 'tests/test14.c'
source_filename = "tests/test14.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  store i32 0, i32* %2, align 4
  store i32 0, i32* %3, align 4
  store i32 6, i32* %2, align 4
  %4 = load i32, i32* %2, align 4
  switch i32 %4, label %41 [
    i32 1, label %5
    i32 6, label %17
    i32 2, label %29
  ]

5:                                                ; preds = %0
  store i32 1, i32* %3, align 4
  %6 = load i32, i32* %3, align 4
  switch i32 %6, label %13 [
    i32 1, label %7
    i32 6, label %9
    i32 2, label %11
  ]

7:                                                ; preds = %5
  %8 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32 noundef 11)
  br label %15

9:                                                ; preds = %5
  %10 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32 noundef 66)
  br label %11

11:                                               ; preds = %5, %9
  %12 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32 noundef 22)
  br label %15

13:                                               ; preds = %5
  %14 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32 noundef 33)
  br label %15

15:                                               ; preds = %13, %11, %7
  %16 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32 noundef 1)
  br label %17

17:                                               ; preds = %0, %15
  store i32 6, i32* %3, align 4
  %18 = load i32, i32* %3, align 4
  switch i32 %18, label %25 [
    i32 1, label %19
    i32 6, label %21
    i32 2, label %23
  ]

19:                                               ; preds = %17
  %20 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32 noundef 11)
  br label %27

21:                                               ; preds = %17
  %22 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32 noundef 66)
  br label %23

23:                                               ; preds = %17, %21
  %24 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32 noundef 22)
  br label %27

25:                                               ; preds = %17
  %26 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32 noundef 33)
  br label %27

27:                                               ; preds = %25, %23, %19
  %28 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32 noundef 6)
  br label %29

29:                                               ; preds = %0, %27
  store i32 2, i32* %3, align 4
  %30 = load i32, i32* %3, align 4
  switch i32 %30, label %37 [
    i32 1, label %31
    i32 6, label %33
    i32 2, label %35
  ]

31:                                               ; preds = %29
  %32 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32 noundef 11)
  br label %39

33:                                               ; preds = %29
  %34 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32 noundef 66)
  br label %35

35:                                               ; preds = %29, %33
  %36 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32 noundef 22)
  br label %39

37:                                               ; preds = %29
  %38 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32 noundef 33)
  br label %39

39:                                               ; preds = %37, %35, %31
  %40 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32 noundef 2)
  br label %53

41:                                               ; preds = %0
  store i32 3, i32* %3, align 4
  %42 = load i32, i32* %3, align 4
  switch i32 %42, label %49 [
    i32 1, label %43
    i32 6, label %45
    i32 2, label %47
  ]

43:                                               ; preds = %41
  %44 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32 noundef 11)
  br label %51

45:                                               ; preds = %41
  %46 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32 noundef 66)
  br label %47

47:                                               ; preds = %41, %45
  %48 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32 noundef 22)
  br label %51

49:                                               ; preds = %41
  %50 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32 noundef 33)
  br label %51

51:                                               ; preds = %49, %47, %43
  %52 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32 noundef 3)
  br label %53

53:                                               ; preds = %51, %39
  %54 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32 noundef 4)
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

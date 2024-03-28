; ModuleID = 'tests/test17.c'
source_filename = "tests/test17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  store i32 0, i32* %2, align 4
  store i32 0, i32* %3, align 4
  store i32 0, i32* %4, align 4
  store i32 0, i32* %5, align 4
  store i32 0, i32* %6, align 4
  store i32 0, i32* %7, align 4
  store i32 0, i32* %8, align 4
  store i32 0, i32* %9, align 4
  store i32 0, i32* %2, align 4
  store i32 0, i32* %3, align 4
  store i32 0, i32* %4, align 4
  store i32 0, i32* %5, align 4
  store i32 0, i32* %6, align 4
  %10 = load i32, i32* %2, align 4
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %23, label %12

12:                                               ; preds = %0
  %13 = load i32, i32* %6, align 4
  %14 = icmp ne i32 %13, 0
  br i1 %14, label %15, label %21

15:                                               ; preds = %12
  %16 = load i32, i32* %5, align 4
  %17 = icmp ne i32 %16, 0
  br i1 %17, label %18, label %19

18:                                               ; preds = %15
  br label %19

19:                                               ; preds = %18, %15
  %20 = phi i1 [ false, %15 ], [ true, %18 ]
  br label %21

21:                                               ; preds = %19, %12
  %22 = phi i1 [ false, %12 ], [ %20, %19 ]
  br label %23

23:                                               ; preds = %21, %0
  %24 = phi i1 [ true, %0 ], [ %22, %21 ]
  %25 = xor i1 %24, true
  %26 = zext i1 %25 to i32
  store i32 %26, i32* %7, align 4
  %27 = load i32, i32* %7, align 4
  %28 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32 noundef %27)
  %29 = load i32, i32* %2, align 4
  %30 = load i32, i32* %5, align 4
  %31 = icmp slt i32 %29, %30
  br i1 %31, label %32, label %36

32:                                               ; preds = %23
  %33 = load i32, i32* %6, align 4
  %34 = load i32, i32* %3, align 4
  %35 = icmp sge i32 %33, %34
  br label %36

36:                                               ; preds = %32, %23
  %37 = phi i1 [ false, %23 ], [ %35, %32 ]
  %38 = zext i1 %37 to i32
  store i32 %38, i32* %8, align 4
  %39 = load i32, i32* %8, align 4
  %40 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32 noundef %39)
  %41 = load i32, i32* %2, align 4
  %42 = load i32, i32* %3, align 4
  %43 = sub nsw i32 %41, %42
  %44 = load i32, i32* %5, align 4
  %45 = icmp slt i32 %43, %44
  br i1 %45, label %46, label %51

46:                                               ; preds = %36
  %47 = load i32, i32* %6, align 4
  %48 = load i32, i32* %8, align 4
  %49 = icmp sgt i32 %47, %48
  %50 = xor i1 %49, true
  br label %51

51:                                               ; preds = %46, %36
  %52 = phi i1 [ false, %36 ], [ %50, %46 ]
  %53 = zext i1 %52 to i32
  store i32 %53, i32* %9, align 4
  %54 = load i32, i32* %9, align 4
  %55 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32 noundef %54)
  store i32 0, i32* %2, align 4
  store i32 1, i32* %3, align 4
  store i32 0, i32* %4, align 4
  store i32 1, i32* %5, align 4
  store i32 0, i32* %6, align 4
  %56 = load i32, i32* %2, align 4
  %57 = icmp ne i32 %56, 0
  br i1 %57, label %69, label %58

58:                                               ; preds = %51
  %59 = load i32, i32* %6, align 4
  %60 = icmp ne i32 %59, 0
  br i1 %60, label %61, label %67

61:                                               ; preds = %58
  %62 = load i32, i32* %5, align 4
  %63 = icmp ne i32 %62, 0
  br i1 %63, label %64, label %65

64:                                               ; preds = %61
  br label %65

65:                                               ; preds = %64, %61
  %66 = phi i1 [ false, %61 ], [ true, %64 ]
  br label %67

67:                                               ; preds = %65, %58
  %68 = phi i1 [ false, %58 ], [ %66, %65 ]
  br label %69

69:                                               ; preds = %67, %51
  %70 = phi i1 [ true, %51 ], [ %68, %67 ]
  %71 = xor i1 %70, true
  %72 = zext i1 %71 to i32
  store i32 %72, i32* %7, align 4
  %73 = load i32, i32* %7, align 4
  %74 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32 noundef %73)
  %75 = load i32, i32* %2, align 4
  %76 = load i32, i32* %5, align 4
  %77 = icmp slt i32 %75, %76
  br i1 %77, label %78, label %82

78:                                               ; preds = %69
  %79 = load i32, i32* %6, align 4
  %80 = load i32, i32* %3, align 4
  %81 = icmp sge i32 %79, %80
  br label %82

82:                                               ; preds = %78, %69
  %83 = phi i1 [ false, %69 ], [ %81, %78 ]
  %84 = zext i1 %83 to i32
  store i32 %84, i32* %8, align 4
  %85 = load i32, i32* %8, align 4
  %86 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32 noundef %85)
  %87 = load i32, i32* %2, align 4
  %88 = load i32, i32* %3, align 4
  %89 = sub nsw i32 %87, %88
  %90 = load i32, i32* %5, align 4
  %91 = icmp slt i32 %89, %90
  br i1 %91, label %92, label %97

92:                                               ; preds = %82
  %93 = load i32, i32* %6, align 4
  %94 = load i32, i32* %8, align 4
  %95 = icmp sgt i32 %93, %94
  %96 = xor i1 %95, true
  br label %97

97:                                               ; preds = %92, %82
  %98 = phi i1 [ false, %82 ], [ %96, %92 ]
  %99 = zext i1 %98 to i32
  store i32 %99, i32* %9, align 4
  %100 = load i32, i32* %9, align 4
  %101 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32 noundef %100)
  store i32 1, i32* %2, align 4
  store i32 0, i32* %3, align 4
  store i32 0, i32* %4, align 4
  store i32 1, i32* %5, align 4
  store i32 1, i32* %6, align 4
  %102 = load i32, i32* %2, align 4
  %103 = icmp ne i32 %102, 0
  br i1 %103, label %115, label %104

104:                                              ; preds = %97
  %105 = load i32, i32* %6, align 4
  %106 = icmp ne i32 %105, 0
  br i1 %106, label %107, label %113

107:                                              ; preds = %104
  %108 = load i32, i32* %5, align 4
  %109 = icmp ne i32 %108, 0
  br i1 %109, label %110, label %111

110:                                              ; preds = %107
  br label %111

111:                                              ; preds = %110, %107
  %112 = phi i1 [ false, %107 ], [ true, %110 ]
  br label %113

113:                                              ; preds = %111, %104
  %114 = phi i1 [ false, %104 ], [ %112, %111 ]
  br label %115

115:                                              ; preds = %113, %97
  %116 = phi i1 [ true, %97 ], [ %114, %113 ]
  %117 = xor i1 %116, true
  %118 = zext i1 %117 to i32
  store i32 %118, i32* %7, align 4
  %119 = load i32, i32* %7, align 4
  %120 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32 noundef %119)
  %121 = load i32, i32* %2, align 4
  %122 = load i32, i32* %5, align 4
  %123 = icmp slt i32 %121, %122
  br i1 %123, label %124, label %128

124:                                              ; preds = %115
  %125 = load i32, i32* %6, align 4
  %126 = load i32, i32* %3, align 4
  %127 = icmp sge i32 %125, %126
  br label %128

128:                                              ; preds = %124, %115
  %129 = phi i1 [ false, %115 ], [ %127, %124 ]
  %130 = zext i1 %129 to i32
  store i32 %130, i32* %8, align 4
  %131 = load i32, i32* %8, align 4
  %132 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32 noundef %131)
  %133 = load i32, i32* %2, align 4
  %134 = load i32, i32* %3, align 4
  %135 = sub nsw i32 %133, %134
  %136 = load i32, i32* %5, align 4
  %137 = icmp slt i32 %135, %136
  br i1 %137, label %138, label %143

138:                                              ; preds = %128
  %139 = load i32, i32* %6, align 4
  %140 = load i32, i32* %8, align 4
  %141 = icmp sgt i32 %139, %140
  %142 = xor i1 %141, true
  br label %143

143:                                              ; preds = %138, %128
  %144 = phi i1 [ false, %128 ], [ %142, %138 ]
  %145 = zext i1 %144 to i32
  store i32 %145, i32* %9, align 4
  %146 = load i32, i32* %9, align 4
  %147 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32 noundef %146)
  store i32 1, i32* %2, align 4
  store i32 1, i32* %3, align 4
  store i32 1, i32* %4, align 4
  store i32 1, i32* %5, align 4
  store i32 1, i32* %6, align 4
  %148 = load i32, i32* %2, align 4
  %149 = icmp ne i32 %148, 0
  br i1 %149, label %161, label %150

150:                                              ; preds = %143
  %151 = load i32, i32* %6, align 4
  %152 = icmp ne i32 %151, 0
  br i1 %152, label %153, label %159

153:                                              ; preds = %150
  %154 = load i32, i32* %5, align 4
  %155 = icmp ne i32 %154, 0
  br i1 %155, label %156, label %157

156:                                              ; preds = %153
  br label %157

157:                                              ; preds = %156, %153
  %158 = phi i1 [ false, %153 ], [ true, %156 ]
  br label %159

159:                                              ; preds = %157, %150
  %160 = phi i1 [ false, %150 ], [ %158, %157 ]
  br label %161

161:                                              ; preds = %159, %143
  %162 = phi i1 [ true, %143 ], [ %160, %159 ]
  %163 = xor i1 %162, true
  %164 = zext i1 %163 to i32
  store i32 %164, i32* %7, align 4
  %165 = load i32, i32* %7, align 4
  %166 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32 noundef %165)
  %167 = load i32, i32* %2, align 4
  %168 = load i32, i32* %5, align 4
  %169 = icmp slt i32 %167, %168
  br i1 %169, label %170, label %174

170:                                              ; preds = %161
  %171 = load i32, i32* %6, align 4
  %172 = load i32, i32* %3, align 4
  %173 = icmp sge i32 %171, %172
  br label %174

174:                                              ; preds = %170, %161
  %175 = phi i1 [ false, %161 ], [ %173, %170 ]
  %176 = zext i1 %175 to i32
  store i32 %176, i32* %8, align 4
  %177 = load i32, i32* %8, align 4
  %178 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32 noundef %177)
  %179 = load i32, i32* %2, align 4
  %180 = load i32, i32* %3, align 4
  %181 = sub nsw i32 %179, %180
  %182 = load i32, i32* %5, align 4
  %183 = icmp slt i32 %181, %182
  br i1 %183, label %184, label %189

184:                                              ; preds = %174
  %185 = load i32, i32* %6, align 4
  %186 = load i32, i32* %8, align 4
  %187 = icmp sgt i32 %185, %186
  %188 = xor i1 %187, true
  br label %189

189:                                              ; preds = %184, %174
  %190 = phi i1 [ false, %174 ], [ %188, %184 ]
  %191 = zext i1 %190 to i32
  store i32 %191, i32* %9, align 4
  %192 = load i32, i32* %9, align 4
  %193 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32 noundef %192)
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

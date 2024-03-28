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
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  store i32 0, i32* %2, align 4
  store i32 0, i32* %3, align 4
  store i32 0, i32* %4, align 4
  store i32 0, i32* %5, align 4
  store i32 0, i32* %6, align 4
  store i32 0, i32* %7, align 4
  store i32 0, i32* %2, align 4
  store i32 0, i32* %3, align 4
  store i32 0, i32* %4, align 4
  store i32 0, i32* %5, align 4
  store i32 0, i32* %6, align 4
  %8 = load i32, i32* %2, align 4
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %10, label %16

10:                                               ; preds = %0
  %11 = load i32, i32* %3, align 4
  %12 = icmp ne i32 %11, 0
  br i1 %12, label %16, label %13

13:                                               ; preds = %10
  %14 = load i32, i32* %4, align 4
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %16, label %34

16:                                               ; preds = %13, %10, %0
  %17 = load i32, i32* %3, align 4
  %18 = icmp ne i32 %17, 0
  br i1 %18, label %19, label %22

19:                                               ; preds = %16
  %20 = load i32, i32* %5, align 4
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %22, label %31

22:                                               ; preds = %19, %16
  %23 = load i32, i32* %6, align 4
  %24 = icmp ne i32 %23, 0
  br i1 %24, label %25, label %29

25:                                               ; preds = %22
  %26 = load i32, i32* %2, align 4
  %27 = icmp ne i32 %26, 0
  %28 = xor i1 %27, true
  br label %29

29:                                               ; preds = %25, %22
  %30 = phi i1 [ false, %22 ], [ %28, %25 ]
  br label %31

31:                                               ; preds = %29, %19
  %32 = phi i1 [ true, %19 ], [ %30, %29 ]
  %33 = xor i1 %32, true
  br label %34

34:                                               ; preds = %31, %13
  %35 = phi i1 [ true, %13 ], [ %33, %31 ]
  %36 = zext i1 %35 to i32
  store i32 %36, i32* %7, align 4
  %37 = load i32, i32* %7, align 4
  %38 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32 noundef %37)
  store i32 1, i32* %2, align 4
  %39 = load i32, i32* %2, align 4
  %40 = icmp ne i32 %39, 0
  br i1 %40, label %41, label %50

41:                                               ; preds = %34
  %42 = load i32, i32* %3, align 4
  %43 = icmp ne i32 %42, 0
  br i1 %43, label %47, label %44

44:                                               ; preds = %41
  %45 = load i32, i32* %4, align 4
  %46 = icmp ne i32 %45, 0
  br label %47

47:                                               ; preds = %44, %41
  %48 = phi i1 [ true, %41 ], [ %46, %44 ]
  %49 = xor i1 %48, true
  br label %50

50:                                               ; preds = %47, %34
  %51 = phi i1 [ false, %34 ], [ %49, %47 ]
  %52 = zext i1 %51 to i32
  store i32 %52, i32* %7, align 4
  %53 = load i32, i32* %7, align 4
  %54 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32 noundef %53)
  %55 = load i32, i32* %2, align 4
  %56 = icmp ne i32 %55, 0
  br i1 %56, label %57, label %63

57:                                               ; preds = %50
  %58 = load i32, i32* %3, align 4
  %59 = icmp ne i32 %58, 0
  br i1 %59, label %63, label %60

60:                                               ; preds = %57
  %61 = load i32, i32* %4, align 4
  %62 = icmp ne i32 %61, 0
  br i1 %62, label %63, label %73

63:                                               ; preds = %60, %57, %50
  %64 = load i32, i32* %3, align 4
  %65 = icmp ne i32 %64, 0
  br i1 %65, label %66, label %70

66:                                               ; preds = %63
  %67 = load i32, i32* %5, align 4
  %68 = icmp ne i32 %67, 0
  %69 = xor i1 %68, true
  br label %70

70:                                               ; preds = %66, %63
  %71 = phi i1 [ false, %63 ], [ %69, %66 ]
  %72 = xor i1 %71, true
  br label %73

73:                                               ; preds = %70, %60
  %74 = phi i1 [ true, %60 ], [ %72, %70 ]
  %75 = zext i1 %74 to i32
  store i32 %75, i32* %7, align 4
  %76 = load i32, i32* %7, align 4
  %77 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32 noundef %76)
  store i32 0, i32* %2, align 4
  store i32 1, i32* %3, align 4
  %78 = load i32, i32* %2, align 4
  %79 = icmp ne i32 %78, 0
  br i1 %79, label %80, label %86

80:                                               ; preds = %73
  %81 = load i32, i32* %3, align 4
  %82 = icmp ne i32 %81, 0
  br i1 %82, label %86, label %83

83:                                               ; preds = %80
  %84 = load i32, i32* %4, align 4
  %85 = icmp ne i32 %84, 0
  br i1 %85, label %86, label %96

86:                                               ; preds = %83, %80, %73
  %87 = load i32, i32* %3, align 4
  %88 = icmp ne i32 %87, 0
  br i1 %88, label %89, label %93

89:                                               ; preds = %86
  %90 = load i32, i32* %5, align 4
  %91 = icmp ne i32 %90, 0
  %92 = xor i1 %91, true
  br label %93

93:                                               ; preds = %89, %86
  %94 = phi i1 [ false, %86 ], [ %92, %89 ]
  %95 = xor i1 %94, true
  br label %96

96:                                               ; preds = %93, %83
  %97 = phi i1 [ true, %83 ], [ %95, %93 ]
  %98 = zext i1 %97 to i32
  store i32 %98, i32* %7, align 4
  %99 = load i32, i32* %7, align 4
  %100 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32 noundef %99)
  store i32 1, i32* %2, align 4
  store i32 1, i32* %3, align 4
  %101 = load i32, i32* %2, align 4
  %102 = icmp ne i32 %101, 0
  br i1 %102, label %103, label %109

103:                                              ; preds = %96
  %104 = load i32, i32* %3, align 4
  %105 = icmp ne i32 %104, 0
  br i1 %105, label %109, label %106

106:                                              ; preds = %103
  %107 = load i32, i32* %4, align 4
  %108 = icmp ne i32 %107, 0
  br i1 %108, label %109, label %119

109:                                              ; preds = %106, %103, %96
  %110 = load i32, i32* %3, align 4
  %111 = icmp ne i32 %110, 0
  br i1 %111, label %112, label %116

112:                                              ; preds = %109
  %113 = load i32, i32* %5, align 4
  %114 = icmp ne i32 %113, 0
  %115 = xor i1 %114, true
  br label %116

116:                                              ; preds = %112, %109
  %117 = phi i1 [ false, %109 ], [ %115, %112 ]
  %118 = xor i1 %117, true
  br label %119

119:                                              ; preds = %116, %106
  %120 = phi i1 [ true, %106 ], [ %118, %116 ]
  %121 = zext i1 %120 to i32
  store i32 %121, i32* %7, align 4
  %122 = load i32, i32* %7, align 4
  %123 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32 noundef %122)
  store i32 0, i32* %2, align 4
  store i32 0, i32* %3, align 4
  store i32 1, i32* %4, align 4
  %124 = load i32, i32* %2, align 4
  %125 = icmp ne i32 %124, 0
  br i1 %125, label %126, label %132

126:                                              ; preds = %119
  %127 = load i32, i32* %3, align 4
  %128 = icmp ne i32 %127, 0
  br i1 %128, label %132, label %129

129:                                              ; preds = %126
  %130 = load i32, i32* %4, align 4
  %131 = icmp ne i32 %130, 0
  br i1 %131, label %132, label %142

132:                                              ; preds = %129, %126, %119
  %133 = load i32, i32* %3, align 4
  %134 = icmp ne i32 %133, 0
  br i1 %134, label %135, label %139

135:                                              ; preds = %132
  %136 = load i32, i32* %5, align 4
  %137 = icmp ne i32 %136, 0
  %138 = xor i1 %137, true
  br label %139

139:                                              ; preds = %135, %132
  %140 = phi i1 [ false, %132 ], [ %138, %135 ]
  %141 = xor i1 %140, true
  br label %142

142:                                              ; preds = %139, %129
  %143 = phi i1 [ true, %129 ], [ %141, %139 ]
  %144 = zext i1 %143 to i32
  store i32 %144, i32* %7, align 4
  %145 = load i32, i32* %7, align 4
  %146 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32 noundef %145)
  store i32 1, i32* %2, align 4
  store i32 0, i32* %3, align 4
  store i32 1, i32* %4, align 4
  %147 = load i32, i32* %2, align 4
  %148 = icmp ne i32 %147, 0
  br i1 %148, label %149, label %155

149:                                              ; preds = %142
  %150 = load i32, i32* %3, align 4
  %151 = icmp ne i32 %150, 0
  br i1 %151, label %155, label %152

152:                                              ; preds = %149
  %153 = load i32, i32* %4, align 4
  %154 = icmp ne i32 %153, 0
  br i1 %154, label %155, label %165

155:                                              ; preds = %152, %149, %142
  %156 = load i32, i32* %3, align 4
  %157 = icmp ne i32 %156, 0
  br i1 %157, label %158, label %162

158:                                              ; preds = %155
  %159 = load i32, i32* %5, align 4
  %160 = icmp ne i32 %159, 0
  %161 = xor i1 %160, true
  br label %162

162:                                              ; preds = %158, %155
  %163 = phi i1 [ false, %155 ], [ %161, %158 ]
  %164 = xor i1 %163, true
  br label %165

165:                                              ; preds = %162, %152
  %166 = phi i1 [ true, %152 ], [ %164, %162 ]
  %167 = zext i1 %166 to i32
  store i32 %167, i32* %7, align 4
  %168 = load i32, i32* %7, align 4
  %169 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32 noundef %168)
  store i32 0, i32* %2, align 4
  store i32 1, i32* %3, align 4
  store i32 1, i32* %4, align 4
  %170 = load i32, i32* %2, align 4
  %171 = icmp ne i32 %170, 0
  br i1 %171, label %172, label %178

172:                                              ; preds = %165
  %173 = load i32, i32* %3, align 4
  %174 = icmp ne i32 %173, 0
  br i1 %174, label %178, label %175

175:                                              ; preds = %172
  %176 = load i32, i32* %4, align 4
  %177 = icmp ne i32 %176, 0
  br i1 %177, label %178, label %188

178:                                              ; preds = %175, %172, %165
  %179 = load i32, i32* %3, align 4
  %180 = icmp ne i32 %179, 0
  br i1 %180, label %181, label %185

181:                                              ; preds = %178
  %182 = load i32, i32* %5, align 4
  %183 = icmp ne i32 %182, 0
  %184 = xor i1 %183, true
  br label %185

185:                                              ; preds = %181, %178
  %186 = phi i1 [ false, %178 ], [ %184, %181 ]
  %187 = xor i1 %186, true
  br label %188

188:                                              ; preds = %185, %175
  %189 = phi i1 [ true, %175 ], [ %187, %185 ]
  %190 = zext i1 %189 to i32
  store i32 %190, i32* %7, align 4
  %191 = load i32, i32* %7, align 4
  %192 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32 noundef %191)
  store i32 1, i32* %2, align 4
  store i32 1, i32* %3, align 4
  store i32 1, i32* %4, align 4
  %193 = load i32, i32* %2, align 4
  %194 = icmp ne i32 %193, 0
  br i1 %194, label %195, label %201

195:                                              ; preds = %188
  %196 = load i32, i32* %3, align 4
  %197 = icmp ne i32 %196, 0
  br i1 %197, label %201, label %198

198:                                              ; preds = %195
  %199 = load i32, i32* %4, align 4
  %200 = icmp ne i32 %199, 0
  br i1 %200, label %201, label %211

201:                                              ; preds = %198, %195, %188
  %202 = load i32, i32* %3, align 4
  %203 = icmp ne i32 %202, 0
  br i1 %203, label %204, label %208

204:                                              ; preds = %201
  %205 = load i32, i32* %5, align 4
  %206 = icmp ne i32 %205, 0
  %207 = xor i1 %206, true
  br label %208

208:                                              ; preds = %204, %201
  %209 = phi i1 [ false, %201 ], [ %207, %204 ]
  %210 = xor i1 %209, true
  br label %211

211:                                              ; preds = %208, %198
  %212 = phi i1 [ true, %198 ], [ %210, %208 ]
  %213 = zext i1 %212 to i32
  store i32 %213, i32* %7, align 4
  %214 = load i32, i32* %7, align 4
  %215 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32 noundef %214)
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

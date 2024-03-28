; ModuleID = 'tests/test7.c'
source_filename = "tests/test7.c"
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
  br i1 %12, label %27, label %13

13:                                               ; preds = %10
  %14 = load i32, i32* %4, align 4
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %27, label %16

16:                                               ; preds = %13, %0
  %17 = load i32, i32* %5, align 4
  %18 = icmp ne i32 %17, 0
  br i1 %18, label %19, label %25

19:                                               ; preds = %16
  %20 = load i32, i32* %4, align 4
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %22, label %25

22:                                               ; preds = %19
  %23 = load i32, i32* %6, align 4
  %24 = icmp ne i32 %23, 0
  br label %25

25:                                               ; preds = %22, %19, %16
  %26 = phi i1 [ false, %19 ], [ false, %16 ], [ %24, %22 ]
  br label %27

27:                                               ; preds = %25, %13, %10
  %28 = phi i1 [ true, %13 ], [ true, %10 ], [ %26, %25 ]
  %29 = zext i1 %28 to i32
  store i32 %29, i32* %7, align 4
  %30 = load i32, i32* %7, align 4
  %31 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32 noundef %30)
  store i32 1, i32* %2, align 4
  %32 = load i32, i32* %2, align 4
  %33 = icmp ne i32 %32, 0
  br i1 %33, label %34, label %40

34:                                               ; preds = %27
  %35 = load i32, i32* %3, align 4
  %36 = icmp ne i32 %35, 0
  br i1 %36, label %51, label %37

37:                                               ; preds = %34
  %38 = load i32, i32* %4, align 4
  %39 = icmp ne i32 %38, 0
  br i1 %39, label %51, label %40

40:                                               ; preds = %37, %27
  %41 = load i32, i32* %5, align 4
  %42 = icmp ne i32 %41, 0
  br i1 %42, label %43, label %49

43:                                               ; preds = %40
  %44 = load i32, i32* %4, align 4
  %45 = icmp ne i32 %44, 0
  br i1 %45, label %46, label %49

46:                                               ; preds = %43
  %47 = load i32, i32* %6, align 4
  %48 = icmp ne i32 %47, 0
  br label %49

49:                                               ; preds = %46, %43, %40
  %50 = phi i1 [ false, %43 ], [ false, %40 ], [ %48, %46 ]
  br label %51

51:                                               ; preds = %49, %37, %34
  %52 = phi i1 [ true, %37 ], [ true, %34 ], [ %50, %49 ]
  %53 = zext i1 %52 to i32
  store i32 %53, i32* %7, align 4
  %54 = load i32, i32* %7, align 4
  %55 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32 noundef %54)
  store i32 1, i32* %3, align 4
  %56 = load i32, i32* %2, align 4
  %57 = icmp ne i32 %56, 0
  br i1 %57, label %58, label %64

58:                                               ; preds = %51
  %59 = load i32, i32* %3, align 4
  %60 = icmp ne i32 %59, 0
  br i1 %60, label %75, label %61

61:                                               ; preds = %58
  %62 = load i32, i32* %4, align 4
  %63 = icmp ne i32 %62, 0
  br i1 %63, label %75, label %64

64:                                               ; preds = %61, %51
  %65 = load i32, i32* %5, align 4
  %66 = icmp ne i32 %65, 0
  br i1 %66, label %67, label %73

67:                                               ; preds = %64
  %68 = load i32, i32* %4, align 4
  %69 = icmp ne i32 %68, 0
  br i1 %69, label %70, label %73

70:                                               ; preds = %67
  %71 = load i32, i32* %6, align 4
  %72 = icmp ne i32 %71, 0
  br label %73

73:                                               ; preds = %70, %67, %64
  %74 = phi i1 [ false, %67 ], [ false, %64 ], [ %72, %70 ]
  br label %75

75:                                               ; preds = %73, %61, %58
  %76 = phi i1 [ true, %61 ], [ true, %58 ], [ %74, %73 ]
  %77 = zext i1 %76 to i32
  store i32 %77, i32* %7, align 4
  %78 = load i32, i32* %7, align 4
  %79 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32 noundef %78)
  store i32 1, i32* %4, align 4
  %80 = load i32, i32* %2, align 4
  %81 = icmp ne i32 %80, 0
  br i1 %81, label %82, label %88

82:                                               ; preds = %75
  %83 = load i32, i32* %3, align 4
  %84 = icmp ne i32 %83, 0
  br i1 %84, label %99, label %85

85:                                               ; preds = %82
  %86 = load i32, i32* %4, align 4
  %87 = icmp ne i32 %86, 0
  br i1 %87, label %99, label %88

88:                                               ; preds = %85, %75
  %89 = load i32, i32* %5, align 4
  %90 = icmp ne i32 %89, 0
  br i1 %90, label %91, label %97

91:                                               ; preds = %88
  %92 = load i32, i32* %4, align 4
  %93 = icmp ne i32 %92, 0
  br i1 %93, label %94, label %97

94:                                               ; preds = %91
  %95 = load i32, i32* %6, align 4
  %96 = icmp ne i32 %95, 0
  br label %97

97:                                               ; preds = %94, %91, %88
  %98 = phi i1 [ false, %91 ], [ false, %88 ], [ %96, %94 ]
  br label %99

99:                                               ; preds = %97, %85, %82
  %100 = phi i1 [ true, %85 ], [ true, %82 ], [ %98, %97 ]
  %101 = zext i1 %100 to i32
  store i32 %101, i32* %7, align 4
  %102 = load i32, i32* %7, align 4
  %103 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32 noundef %102)
  store i32 1, i32* %5, align 4
  %104 = load i32, i32* %2, align 4
  %105 = icmp ne i32 %104, 0
  br i1 %105, label %106, label %112

106:                                              ; preds = %99
  %107 = load i32, i32* %3, align 4
  %108 = icmp ne i32 %107, 0
  br i1 %108, label %123, label %109

109:                                              ; preds = %106
  %110 = load i32, i32* %4, align 4
  %111 = icmp ne i32 %110, 0
  br i1 %111, label %123, label %112

112:                                              ; preds = %109, %99
  %113 = load i32, i32* %5, align 4
  %114 = icmp ne i32 %113, 0
  br i1 %114, label %115, label %121

115:                                              ; preds = %112
  %116 = load i32, i32* %4, align 4
  %117 = icmp ne i32 %116, 0
  br i1 %117, label %118, label %121

118:                                              ; preds = %115
  %119 = load i32, i32* %6, align 4
  %120 = icmp ne i32 %119, 0
  br label %121

121:                                              ; preds = %118, %115, %112
  %122 = phi i1 [ false, %115 ], [ false, %112 ], [ %120, %118 ]
  br label %123

123:                                              ; preds = %121, %109, %106
  %124 = phi i1 [ true, %109 ], [ true, %106 ], [ %122, %121 ]
  %125 = zext i1 %124 to i32
  store i32 %125, i32* %7, align 4
  %126 = load i32, i32* %7, align 4
  %127 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32 noundef %126)
  store i32 1, i32* %6, align 4
  %128 = load i32, i32* %2, align 4
  %129 = icmp ne i32 %128, 0
  br i1 %129, label %130, label %136

130:                                              ; preds = %123
  %131 = load i32, i32* %3, align 4
  %132 = icmp ne i32 %131, 0
  br i1 %132, label %147, label %133

133:                                              ; preds = %130
  %134 = load i32, i32* %4, align 4
  %135 = icmp ne i32 %134, 0
  br i1 %135, label %147, label %136

136:                                              ; preds = %133, %123
  %137 = load i32, i32* %5, align 4
  %138 = icmp ne i32 %137, 0
  br i1 %138, label %139, label %145

139:                                              ; preds = %136
  %140 = load i32, i32* %4, align 4
  %141 = icmp ne i32 %140, 0
  br i1 %141, label %142, label %145

142:                                              ; preds = %139
  %143 = load i32, i32* %6, align 4
  %144 = icmp ne i32 %143, 0
  br label %145

145:                                              ; preds = %142, %139, %136
  %146 = phi i1 [ false, %139 ], [ false, %136 ], [ %144, %142 ]
  br label %147

147:                                              ; preds = %145, %133, %130
  %148 = phi i1 [ true, %133 ], [ true, %130 ], [ %146, %145 ]
  %149 = zext i1 %148 to i32
  store i32 %149, i32* %7, align 4
  %150 = load i32, i32* %7, align 4
  %151 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32 noundef %150)
  store i32 0, i32* %3, align 4
  %152 = load i32, i32* %2, align 4
  %153 = icmp ne i32 %152, 0
  br i1 %153, label %154, label %160

154:                                              ; preds = %147
  %155 = load i32, i32* %3, align 4
  %156 = icmp ne i32 %155, 0
  br i1 %156, label %171, label %157

157:                                              ; preds = %154
  %158 = load i32, i32* %4, align 4
  %159 = icmp ne i32 %158, 0
  br i1 %159, label %171, label %160

160:                                              ; preds = %157, %147
  %161 = load i32, i32* %5, align 4
  %162 = icmp ne i32 %161, 0
  br i1 %162, label %163, label %169

163:                                              ; preds = %160
  %164 = load i32, i32* %4, align 4
  %165 = icmp ne i32 %164, 0
  br i1 %165, label %166, label %169

166:                                              ; preds = %163
  %167 = load i32, i32* %6, align 4
  %168 = icmp ne i32 %167, 0
  br label %169

169:                                              ; preds = %166, %163, %160
  %170 = phi i1 [ false, %163 ], [ false, %160 ], [ %168, %166 ]
  br label %171

171:                                              ; preds = %169, %157, %154
  %172 = phi i1 [ true, %157 ], [ true, %154 ], [ %170, %169 ]
  %173 = zext i1 %172 to i32
  store i32 %173, i32* %7, align 4
  %174 = load i32, i32* %7, align 4
  %175 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32 noundef %174)
  store i32 0, i32* %4, align 4
  %176 = load i32, i32* %2, align 4
  %177 = icmp ne i32 %176, 0
  br i1 %177, label %178, label %184

178:                                              ; preds = %171
  %179 = load i32, i32* %3, align 4
  %180 = icmp ne i32 %179, 0
  br i1 %180, label %195, label %181

181:                                              ; preds = %178
  %182 = load i32, i32* %4, align 4
  %183 = icmp ne i32 %182, 0
  br i1 %183, label %195, label %184

184:                                              ; preds = %181, %171
  %185 = load i32, i32* %5, align 4
  %186 = icmp ne i32 %185, 0
  br i1 %186, label %187, label %193

187:                                              ; preds = %184
  %188 = load i32, i32* %4, align 4
  %189 = icmp ne i32 %188, 0
  br i1 %189, label %190, label %193

190:                                              ; preds = %187
  %191 = load i32, i32* %6, align 4
  %192 = icmp ne i32 %191, 0
  br label %193

193:                                              ; preds = %190, %187, %184
  %194 = phi i1 [ false, %187 ], [ false, %184 ], [ %192, %190 ]
  br label %195

195:                                              ; preds = %193, %181, %178
  %196 = phi i1 [ true, %181 ], [ true, %178 ], [ %194, %193 ]
  %197 = zext i1 %196 to i32
  store i32 %197, i32* %7, align 4
  %198 = load i32, i32* %7, align 4
  %199 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32 noundef %198)
  store i32 0, i32* %5, align 4
  %200 = load i32, i32* %2, align 4
  %201 = icmp ne i32 %200, 0
  br i1 %201, label %202, label %208

202:                                              ; preds = %195
  %203 = load i32, i32* %3, align 4
  %204 = icmp ne i32 %203, 0
  br i1 %204, label %219, label %205

205:                                              ; preds = %202
  %206 = load i32, i32* %4, align 4
  %207 = icmp ne i32 %206, 0
  br i1 %207, label %219, label %208

208:                                              ; preds = %205, %195
  %209 = load i32, i32* %5, align 4
  %210 = icmp ne i32 %209, 0
  br i1 %210, label %211, label %217

211:                                              ; preds = %208
  %212 = load i32, i32* %4, align 4
  %213 = icmp ne i32 %212, 0
  br i1 %213, label %214, label %217

214:                                              ; preds = %211
  %215 = load i32, i32* %6, align 4
  %216 = icmp ne i32 %215, 0
  br label %217

217:                                              ; preds = %214, %211, %208
  %218 = phi i1 [ false, %211 ], [ false, %208 ], [ %216, %214 ]
  br label %219

219:                                              ; preds = %217, %205, %202
  %220 = phi i1 [ true, %205 ], [ true, %202 ], [ %218, %217 ]
  %221 = zext i1 %220 to i32
  store i32 %221, i32* %7, align 4
  %222 = load i32, i32* %7, align 4
  %223 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32 noundef %222)
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

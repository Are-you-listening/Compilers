; ModuleID = "tests/test2.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ; INT main
  %".4" = alloca i32, align 4
  store i32 0, i32* %".4", align 4
  ; INT a = 0
  store i32 110127075, i32* %".4", align 4
  ; a = 33 + 69789 * 69421 / 51213 + 2231 - 654
  %".9" = load i32, i32* %".4", align 4
  ; printf "%d" , a
  %".11" = bitcast [3 x i8]* @".str.d" to i8*
  %".12" = alloca i32
  store i32 %".9", i32* %".12"
  %".14" = load i32, i32* %".12"
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".11", i32 %".14")
  store i32 216818703, i32* %".4", align 4
  ; a = 1326549 + 215492154
  %".18" = load i32, i32* %".4", align 4
  ; printf "%d" , a
  %".20" = bitcast [3 x i8]* @".str.d" to i8*
  %".21" = alloca i32
  store i32 %".18", i32* %".21"
  %".23" = load i32, i32* %".21"
  %".24" = call i32 (i8*, ...) @"printf"(i8* %".20", i32 %".23")
  store i32 548416, i32* %".4", align 4
  ; a = 548416
  %".27" = load i32, i32* %".4", align 4
  ; printf "%d" , a
  %".29" = bitcast [3 x i8]* @".str.d" to i8*
  %".30" = alloca i32
  store i32 %".27", i32* %".30"
  %".32" = load i32, i32* %".30"
  %".33" = call i32 (i8*, ...) @"printf"(i8* %".29", i32 %".32")
  store i32 -3, i32* %".4", align 4
  ; a = 3 - 6
  %".36" = load i32, i32* %".4", align 4
  ; printf "%d" , a
  %".38" = bitcast [3 x i8]* @".str.d" to i8*
  %".39" = alloca i32
  store i32 %".36", i32* %".39"
  %".41" = load i32, i32* %".39"
  %".42" = call i32 (i8*, ...) @"printf"(i8* %".38", i32 %".41")
  store i32 -1309628662, i32* %".4", align 4
  ; a = - 9899563254
  %".45" = load i32, i32* %".4", align 4
  ; printf "%d" , a
  %".47" = bitcast [3 x i8]* @".str.d" to i8*
  %".48" = alloca i32
  store i32 %".45", i32* %".48"
  %".50" = load i32, i32* %".48"
  %".51" = call i32 (i8*, ...) @"printf"(i8* %".47", i32 %".50")
  store i32 998315, i32* %".4", align 4
  ; a = + 998315
  %".54" = load i32, i32* %".4", align 4
  ; printf "%d" , a
  %".56" = bitcast [3 x i8]* @".str.d" to i8*
  %".57" = alloca i32
  store i32 %".54", i32* %".57"
  %".59" = load i32, i32* %".57"
  %".60" = call i32 (i8*, ...) @"printf"(i8* %".56", i32 %".59")
  ret i32 0
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"
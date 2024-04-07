; ModuleID = "tests/test2.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 0, i32* %".3", align 4
  ; INT a = 0
  store i32 110127075, i32* %".3", align 4
  ; a = 33 + 69789 * 69421 / 51213 + 2231 - 654
  %".8" = load i32, i32* %".3", align 4
  ; printf "%d" a
  %".10" = bitcast [3 x i8]* @".str.d" to i8*
  %".11" = alloca i32
  store i32 %".8", i32* %".11"
  %".13" = load i32, i32* %".11"
  %".14" = call i32 (i8*, ...) @"printf"(i8* %".10", i32 %".13")
  store i32 216818703, i32* %".3", align 4
  ; a = 1326549 + 215492154
  %".17" = load i32, i32* %".3", align 4
  ; printf "%d" a
  %".19" = bitcast [3 x i8]* @".str.d" to i8*
  %".20" = alloca i32
  store i32 %".17", i32* %".20"
  %".22" = load i32, i32* %".20"
  %".23" = call i32 (i8*, ...) @"printf"(i8* %".19", i32 %".22")
  store i32 548416, i32* %".3", align 4
  ; a = 548416
  %".26" = load i32, i32* %".3", align 4
  ; printf "%d" a
  %".28" = bitcast [3 x i8]* @".str.d" to i8*
  %".29" = alloca i32
  store i32 %".26", i32* %".29"
  %".31" = load i32, i32* %".29"
  %".32" = call i32 (i8*, ...) @"printf"(i8* %".28", i32 %".31")
  store i32 -3, i32* %".3", align 4
  ; a = 3 - 6
  %".35" = load i32, i32* %".3", align 4
  ; printf "%d" a
  %".37" = bitcast [3 x i8]* @".str.d" to i8*
  %".38" = alloca i32
  store i32 %".35", i32* %".38"
  %".40" = load i32, i32* %".38"
  %".41" = call i32 (i8*, ...) @"printf"(i8* %".37", i32 %".40")
  store i32 -1309628662, i32* %".3", align 4
  ; a = - 9899563254
  %".44" = load i32, i32* %".3", align 4
  ; printf "%d" a
  %".46" = bitcast [3 x i8]* @".str.d" to i8*
  %".47" = alloca i32
  store i32 %".44", i32* %".47"
  %".49" = load i32, i32* %".47"
  %".50" = call i32 (i8*, ...) @"printf"(i8* %".46", i32 %".49")
  store i32 998315, i32* %".3", align 4
  ; a = + 998315
  %".53" = load i32, i32* %".3", align 4
  ; printf "%d" a
  %".55" = bitcast [3 x i8]* @".str.d" to i8*
  %".56" = alloca i32
  store i32 %".53", i32* %".56"
  %".58" = load i32, i32* %".56"
  %".59" = call i32 (i8*, ...) @"printf"(i8* %".55", i32 %".58")
  ret i32 0
  ; INT main
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"
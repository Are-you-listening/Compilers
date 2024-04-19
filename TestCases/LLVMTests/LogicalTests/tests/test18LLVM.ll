; ModuleID = "tests/test18.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;     INT main
  %".4" = alloca i32, align 4
  store i32 0, i32* %".4", align 4
  ; INT a = 0
  %".7" = alloca i32, align 4
  store i32 0, i32* %".7", align 4
  ; INT b = 0
  %".10" = alloca i32, align 4
  store i32 0, i32* %".10", align 4
  ; INT c = 0
  %".13" = alloca i32, align 4
  store i32 0, i32* %".13", align 4
  ; INT d = 0
  %".16" = alloca i32, align 4
  store i32 0, i32* %".16", align 4
  ; INT e = 0
  %".19" = alloca i32, align 4
  store i32 0, i32* %".19", align 4
  ; INT f = 0
  %".22" = alloca i32, align 4
  store i32 0, i32* %".22", align 4
  ; INT g = 0
  %".25" = alloca i32, align 4
  store i32 0, i32* %".25", align 4
  ; INT h = 0
  store i32 1, i32* %".19", align 4
  ;  f = ! a || e && d && 5 < 6
  %".30" = load i32, i32* %".19", align 4
  ; printf "%d" f
  %".32" = bitcast [3 x i8]* @".str.d" to i8*
  %".33" = alloca i32
  store i32 %".30", i32* %".33"
  %".35" = load i32, i32* %".33"
  %".36" = call i32 (i8*, ...) @"printf"(i8* %".32", i32 %".35")
  %".37" = load i32, i32* %".4", align 4
  ; g = a < d && e >= b
  %".39" = load i32, i32* %".13", align 4
  %".40" = icmp slt i32 %".37", %".39"
  br i1 %".40", label %".41", label %".44"
.41:
  %".42" = load i32, i32* %".16", align 4
  %".43" = icmp sge i32 %".42", 0
  br label %".44"
.44:
  %".45" = phi  i1 [0, %".2"], [%".43", %".41"]
  %".46" = zext i1 %".45" to i32
  store i32 %".46", i32* %".22", align 4
  %".48" = load i32, i32* %".22", align 4
  ; printf "%d" g
  %".50" = bitcast [3 x i8]* @".str.d" to i8*
  %".51" = alloca i32
  store i32 %".48", i32* %".51"
  %".53" = load i32, i32* %".51"
  %".54" = call i32 (i8*, ...) @"printf"(i8* %".50", i32 %".53")
  %".55" = load i32, i32* %".4", align 4
  ; h = a - b < d && ! e > g
  %".57" = load i32, i32* %".7", align 4
  %".58" = sub i32 %".55", %".57"
  %".59" = load i32, i32* %".13", align 4
  %".60" = icmp slt i32 %".58", %".59"
  br i1 %".60", label %".61", label %".67"
.61:
  %".62" = load i32, i32* %".16", align 4
  %".63" = load i32, i32* %".22", align 4
  %".64" = icmp sgt i32 %".62", %".63"
  %".65" = icmp ne i1 %".64", 0
  %".66" = xor i1 %".65", 1
  br label %".67"
.67:
  %".68" = phi  i1 [0, %".44"], [%".66", %".61"]
  %".69" = zext i1 %".68" to i32
  store i32 %".69", i32* %".25", align 4
  %".71" = load i32, i32* %".25", align 4
  ; printf "%d" h
  %".73" = bitcast [3 x i8]* @".str.d" to i8*
  %".74" = alloca i32
  store i32 %".71", i32* %".74"
  %".76" = load i32, i32* %".74"
  %".77" = call i32 (i8*, ...) @"printf"(i8* %".73", i32 %".76")
  ret i32 0
  ;   return 0
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"
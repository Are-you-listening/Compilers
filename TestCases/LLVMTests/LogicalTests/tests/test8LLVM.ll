; ModuleID = "tests/test8.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;    INT main
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
  store i32 0, i32* %".4", align 4
  ;  a = 0
  store i32 0, i32* %".7", align 4
  ; b = 0
  store i32 0, i32* %".10", align 4
  ; c = 0
  store i32 0, i32* %".13", align 4
  ; d = 0
  store i32 0, i32* %".16", align 4
  ; e = 0
  ;   f = a && ! b || c
  %".33" = load i32, i32* %".4", align 4
  %".34" = icmp ne i32 %".33", 0
  br i1 %".34", label %".35", label %".42"
.35:
  %".36" = load i32, i32* %".7", align 4
  %".37" = icmp ne i32 %".36", 0
  br i1 %".37", label %".42", label %".38"
.38:
  %".39" = load i32, i32* %".10", align 4
  %".40" = icmp ne i32 %".39", 0
  %".41" = xor i1 %".40", 1
  br label %".42"
.42:
  %".43" = phi  i1 [0, %".2"], [0, %".35"], [%".41", %".38"]
  %".44" = zext i1 %".43" to i32
  store i32 %".44", i32* %".19", align 4
  %".46" = load i32, i32* %".19", align 4
  ; printf "%d" f
  %".48" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".49" = alloca i32
  store i32 %".46", i32* %".49"
  %".51" = load i32, i32* %".49"
  %".52" = call i32 (i8*, ...) @"printf"(i8* %".48", i32 %".51")
  store i32 1, i32* %".7", align 4
  ;  b = 1
  ; f = a && ! b || c
  %".56" = load i32, i32* %".4", align 4
  %".57" = icmp ne i32 %".56", 0
  br i1 %".57", label %".58", label %".65"
.58:
  %".59" = load i32, i32* %".7", align 4
  %".60" = icmp ne i32 %".59", 0
  br i1 %".60", label %".65", label %".61"
.61:
  %".62" = load i32, i32* %".10", align 4
  %".63" = icmp ne i32 %".62", 0
  %".64" = xor i1 %".63", 1
  br label %".65"
.65:
  %".66" = phi  i1 [0, %".42"], [0, %".58"], [%".64", %".61"]
  %".67" = zext i1 %".66" to i32
  store i32 %".67", i32* %".19", align 4
  %".69" = load i32, i32* %".19", align 4
  ; printf "%d" f
  %".71" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".72" = alloca i32
  store i32 %".69", i32* %".72"
  %".74" = load i32, i32* %".72"
  %".75" = call i32 (i8*, ...) @"printf"(i8* %".71", i32 %".74")
  store i32 1, i32* %".4", align 4
  ;  a = 1
  ; f = a && ! b || c
  %".79" = load i32, i32* %".4", align 4
  %".80" = icmp ne i32 %".79", 0
  br i1 %".80", label %".81", label %".88"
.81:
  %".82" = load i32, i32* %".7", align 4
  %".83" = icmp ne i32 %".82", 0
  br i1 %".83", label %".88", label %".84"
.84:
  %".85" = load i32, i32* %".10", align 4
  %".86" = icmp ne i32 %".85", 0
  %".87" = xor i1 %".86", 1
  br label %".88"
.88:
  %".89" = phi  i1 [0, %".65"], [0, %".81"], [%".87", %".84"]
  %".90" = zext i1 %".89" to i32
  store i32 %".90", i32* %".19", align 4
  %".92" = load i32, i32* %".19", align 4
  ; printf "%d" f
  %".94" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".95" = alloca i32
  store i32 %".92", i32* %".95"
  %".97" = load i32, i32* %".95"
  %".98" = call i32 (i8*, ...) @"printf"(i8* %".94", i32 %".97")
  store i32 0, i32* %".7", align 4
  ;  b = 0
  ; f = a && ! b || c
  %".102" = load i32, i32* %".4", align 4
  %".103" = icmp ne i32 %".102", 0
  br i1 %".103", label %".104", label %".111"
.104:
  %".105" = load i32, i32* %".7", align 4
  %".106" = icmp ne i32 %".105", 0
  br i1 %".106", label %".111", label %".107"
.107:
  %".108" = load i32, i32* %".10", align 4
  %".109" = icmp ne i32 %".108", 0
  %".110" = xor i1 %".109", 1
  br label %".111"
.111:
  %".112" = phi  i1 [0, %".104"], [%".110", %".107"], [0, %".88"]
  %".113" = zext i1 %".112" to i32
  store i32 %".113", i32* %".19", align 4
  %".115" = load i32, i32* %".19", align 4
  ; printf "%d" f
  %".117" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".118" = alloca i32
  store i32 %".115", i32* %".118"
  %".120" = load i32, i32* %".118"
  %".121" = call i32 (i8*, ...) @"printf"(i8* %".117", i32 %".120")
  ret i32 0
  ;  return 0
}

declare i32 @"printf"(i8* %".1", ...)

@".str.PS0" = internal constant [3 x i8] c"%d\00"
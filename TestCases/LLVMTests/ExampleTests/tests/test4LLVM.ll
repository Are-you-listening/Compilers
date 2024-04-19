; ModuleID = "tests/test4.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;    INT main
  %".4" = alloca i32, align 4
  store i32 50, i32* %".4", align 4
  ;  INT x = 50
  %".7" = alloca i32, align 4
  store i32 -22, i32* %".7", align 4
  ; INT y = - 22
  %".10" = alloca i32, align 4
  store i32 6, i32* %".10", align 4
  ; INT z = 6
  ;  INT a = x && y || z && ! x
  %".14" = load i32, i32* %".4", align 4
  %".15" = icmp ne i32 %".14", 0
  %".16" = xor i1 %".15", 1
  %".17" = icmp ne i1 %".16", 0
  %".18" = zext i1 %".17" to i32
  %".19" = alloca i32, align 4
  store i32 %".18", i32* %".19", align 4
  %".21" = alloca i32, align 4
  store i32 6, i32* %".21", align 4
  ;  INT b = 6
  %".24" = alloca i32, align 4
  store i32 4, i32* %".24", align 4
  ; INT c = 4
  %".27" = alloca i32, align 4
  store i32 3, i32* %".27", align 4
  ; INT d = 3
  %".30" = load i32, i32* %".27", align 4
  ; INT e = d & c | d
  %".32" = or i32 0, %".30"
  %".33" = alloca i32, align 4
  store i32 %".32", i32* %".33", align 4
  %".35" = load i32, i32* %".33", align 4
  ;  printf "%d" e
  %".37" = bitcast [3 x i8]* @".str.d" to i8*
  %".38" = alloca i32
  store i32 %".35", i32* %".38"
  %".40" = load i32, i32* %".38"
  %".41" = call i32 (i8*, ...) @"printf"(i8* %".37", i32 %".40")
  %".42" = load i32, i32* %".33", align 4
  ; printf "%d" e ^ d
  %".44" = load i32, i32* %".27", align 4
  %".45" = xor i32 %".42", %".44"
  %".46" = bitcast [3 x i8]* @".str.d" to i8*
  %".47" = alloca i32
  store i32 %".45", i32* %".47"
  %".49" = load i32, i32* %".47"
  %".50" = call i32 (i8*, ...) @"printf"(i8* %".46", i32 %".49")
  %".51" = load i32, i32* %".33", align 4
  ; printf "%d" ~ e
  %".53" = xor i32 %".51", -1
  %".54" = bitcast [3 x i8]* @".str.d" to i8*
  %".55" = alloca i32
  store i32 %".53", i32* %".55"
  %".57" = load i32, i32* %".55"
  %".58" = call i32 (i8*, ...) @"printf"(i8* %".54", i32 %".57")
  %".59" = load i32, i32* %".4", align 4
  ;  printf "%d" x
  %".61" = bitcast [3 x i8]* @".str.d" to i8*
  %".62" = alloca i32
  store i32 %".59", i32* %".62"
  %".64" = load i32, i32* %".62"
  %".65" = call i32 (i8*, ...) @"printf"(i8* %".61", i32 %".64")
  %".66" = load i32, i32* %".7", align 4
  ; printf "%d" y
  %".68" = bitcast [3 x i8]* @".str.d" to i8*
  %".69" = alloca i32
  store i32 %".66", i32* %".69"
  %".71" = load i32, i32* %".69"
  %".72" = call i32 (i8*, ...) @"printf"(i8* %".68", i32 %".71")
  %".73" = load i32, i32* %".10", align 4
  ; printf "%d" z
  %".75" = bitcast [3 x i8]* @".str.d" to i8*
  %".76" = alloca i32
  store i32 %".73", i32* %".76"
  %".78" = load i32, i32* %".76"
  %".79" = call i32 (i8*, ...) @"printf"(i8* %".75", i32 %".78")
  %".80" = load i32, i32* %".4", align 4
  %".81" = icmp ne i32 %".80", 0
  %".82" = xor i1 %".81", 1
  %".83" = icmp ne i1 %".82", 0
  %".84" = zext i1 %".83" to i32
  %".85" = bitcast [3 x i8]* @".str.d" to i8*
  %".86" = alloca i32
  store i32 %".84", i32* %".86"
  %".88" = load i32, i32* %".86"
  %".89" = call i32 (i8*, ...) @"printf"(i8* %".85", i32 %".88")
  ; printf "%d" a
  %".91" = bitcast [3 x i8]* @".str.d" to i8*
  %".92" = alloca i32
  store i32 6, i32* %".92"
  %".94" = load i32, i32* %".92"
  %".95" = call i32 (i8*, ...) @"printf"(i8* %".91", i32 %".94")
  ; printf "%d" b
  %".97" = load i32, i32* %".24", align 4
  ; printf "%d" c
  %".99" = bitcast [3 x i8]* @".str.d" to i8*
  %".100" = alloca i32
  store i32 %".97", i32* %".100"
  %".102" = load i32, i32* %".100"
  %".103" = call i32 (i8*, ...) @"printf"(i8* %".99", i32 %".102")
  %".104" = load i32, i32* %".27", align 4
  ; printf "%d" d
  %".106" = bitcast [3 x i8]* @".str.d" to i8*
  %".107" = alloca i32
  store i32 %".104", i32* %".107"
  %".109" = load i32, i32* %".107"
  %".110" = call i32 (i8*, ...) @"printf"(i8* %".106", i32 %".109")
  %".111" = load i32, i32* %".33", align 4
  ; printf "%d" e
  %".113" = bitcast [3 x i8]* @".str.d" to i8*
  %".114" = alloca i32
  store i32 %".111", i32* %".114"
  %".116" = load i32, i32* %".114"
  %".117" = call i32 (i8*, ...) @"printf"(i8* %".113", i32 %".116")
  ret i32 0
  ;  return 0
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"
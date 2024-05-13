; ModuleID = "tests/test20.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;    INT main
  %".4" = alloca i8, align 1
  store i8 0, i8* %".4", align 1
  ; CHAR a = 0
  %".7" = alloca i8, align 1
  store i8 1, i8* %".7", align 1
  ; CHAR b = 1
  %".10" = bitcast [3 x i8]* @".str.0" to i8*
  %".11" = alloca i1
  store i1 0, i1* %".11"
  %".13" = load i1, i1* %".11"
  %".14" = call i32 (i8*, ...) @"printf"(i8* %".10", i1 %".13")
  ; printf "%d" a && b
  ; printf "%d" a || b
  %".17" = load i8, i8* %".4", align 1
  %".18" = icmp ne i8 %".17", 0
  br i1 %".18", label %".22", label %".19"
.19:
  %".20" = load i8, i8* %".7", align 1
  %".21" = icmp ne i8 %".20", 0
  br label %".22"
.22:
  %".23" = phi  i1 [%".21", %".19"], [1, %".2"]
  %".24" = bitcast [3 x i8]* @".str.0" to i8*
  %".25" = alloca i1
  store i1 %".23", i1* %".25"
  %".27" = load i1, i1* %".25"
  %".28" = call i32 (i8*, ...) @"printf"(i8* %".24", i1 %".27")
  ; printf "%d" ! a || b
  %".30" = load i8, i8* %".4", align 1
  %".31" = icmp ne i8 %".30", 0
  br i1 %".31", label %".35", label %".32"
.32:
  %".33" = load i8, i8* %".7", align 1
  %".34" = icmp ne i8 %".33", 0
  br label %".35"
.35:
  %".36" = phi  i1 [1, %".22"], [%".34", %".32"]
  %".37" = icmp ne i1 %".36", 0
  %".38" = xor i1 %".37", 1
  %".39" = bitcast [3 x i8]* @".str.0" to i8*
  %".40" = alloca i1
  store i1 %".38", i1* %".40"
  %".42" = load i1, i1* %".40"
  %".43" = call i32 (i8*, ...) @"printf"(i8* %".39", i1 %".42")
  %".44" = alloca i8, align 1
  store i8 0, i8* %".44", align 1
  ;  CHAR c = 0
  %".47" = alloca i8, align 1
  store i8 0, i8* %".47", align 1
  ; CHAR d = 0
  %".50" = bitcast [3 x i8]* @".str.0" to i8*
  %".51" = alloca i1
  store i1 0, i1* %".51"
  %".53" = load i1, i1* %".51"
  %".54" = call i32 (i8*, ...) @"printf"(i8* %".50", i1 %".53")
  ; printf "%d" c && d
  ; printf "%d" c || d
  %".57" = load i8, i8* %".44", align 1
  %".58" = icmp ne i8 %".57", 0
  br i1 %".58", label %".62", label %".59"
.59:
  %".60" = load i8, i8* %".47", align 1
  %".61" = icmp ne i8 %".60", 0
  br label %".62"
.62:
  %".63" = phi  i1 [1, %".35"], [%".61", %".59"]
  %".64" = bitcast [3 x i8]* @".str.0" to i8*
  %".65" = alloca i1
  store i1 %".63", i1* %".65"
  %".67" = load i1, i1* %".65"
  %".68" = call i32 (i8*, ...) @"printf"(i8* %".64", i1 %".67")
  ret i32 0
  ;   return 0
}

@".str.0" = internal constant [3 x i8] c"%d\00"
declare i32 @"printf"(i8* %".1", ...)

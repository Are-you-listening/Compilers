; ModuleID = "tests/test17.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;    INT main
  %".4" = alloca i32, align 4
  store i32 0, i32* %".4", align 4
  ;  INT a = 0
  %".7" = alloca i32, align 4
  store i32 0, i32* %".7", align 4
  ; INT b = 0
  store i32 6, i32* %".4", align 4
  ; a = 6
  %".12" = load i32, i32* %".4", align 4
  ; switch a
  %".14" = icmp eq i32 %".12", 1
  br i1 %".14", label %".18", label %".15"
.15:
  %".16" = load i32, i32* %".4", align 4
  %".17" = icmp eq i32 %".16", 6
  br label %".18"
.18:
  ; case 1 b = 1
  %".20" = phi  i1 [%".17", %".15"], [1, %".2"]
  br i1 %".20", label %".21", label %".39"
.21:
  %".22" = load i32, i32* %".4", align 4
  %".23" = icmp eq i32 %".22", 1
  br i1 %".23", label %".24", label %".32"
.24:
  store i32 1, i32* %".7", align 4
  %".26" = bitcast [3 x i8]* @".str.0" to i8*
  %".27" = alloca i32
  store i32 1, i32* %".27"
  %".29" = load i32, i32* %".27"
  %".30" = call i32 (i8*, ...) @"printf"(i8* %".26", i32 %".29")
  ; printf "%d" 1
  br label %".32"
.32:
  %".33" = bitcast [3 x i8]* @".str.0" to i8*
  %".34" = alloca i32
  store i32 6, i32* %".34"
  %".36" = load i32, i32* %".34"
  %".37" = call i32 (i8*, ...) @"printf"(i8* %".33", i32 %".36")
  ; case 6 printf "%d" 6
  br label %".39"
.39:
  %".40" = load i32, i32* %".4", align 4
  %".41" = icmp ne i32 %".40", 1
  br i1 %".41", label %".42", label %".45"
.42:
  %".43" = load i32, i32* %".4", align 4
  %".44" = icmp ne i32 %".43", 6
  br label %".45"
.45:
  ; break default b = 3
  %".47" = phi  i1 [0, %".39"], [%".44", %".42"]
  br i1 %".47", label %".48", label %".56"
.48:
  store i32 3, i32* %".7", align 4
  %".50" = bitcast [3 x i8]* @".str.0" to i8*
  %".51" = alloca i32
  store i32 3, i32* %".51"
  %".53" = load i32, i32* %".51"
  %".54" = call i32 (i8*, ...) @"printf"(i8* %".50", i32 %".53")
  ; printf "%d" 3
  br label %".56"
.56:
  %".57" = bitcast [3 x i8]* @".str.0" to i8*
  %".58" = alloca i32
  store i32 4, i32* %".58"
  %".60" = load i32, i32* %".58"
  %".61" = call i32 (i8*, ...) @"printf"(i8* %".57", i32 %".60")
  ;    printf "%d" 4
  ret i32 0
  ;  return 0
}

@".str.0" = internal constant [3 x i8] c"%d\00"
declare i32 @"printf"(i8* %".1", ...)

; ModuleID = "tests/test3.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;  #include <stdio.h>  INT main
  %".4" = alloca i32, align 4
  store i32 0, i32* %".4", align 4
  ;  INT a = 0
  %".7" = alloca i32, align 4
  store i32 0, i32* %".7", align 4
  ; INT b = 0
  store i32 3, i32* %".4", align 4
  ; a = 3
  %".12" = load i32, i32* %".4", align 4
  ; switch a
  %".14" = icmp eq i32 %".12", 1
  br i1 %".14", label %".21", label %".15"
.15:
  %".16" = load i32, i32* %".4", align 4
  %".17" = icmp eq i32 %".16", 6
  br i1 %".17", label %".21", label %".18"
.18:
  %".19" = load i32, i32* %".4", align 4
  %".20" = icmp eq i32 %".19", 2
  br label %".21"
.21:
  ; case 1 b = 1
  %".23" = phi  i1 [1, %".15"], [%".20", %".18"], [1, %".2"]
  br i1 %".23", label %".24", label %".61"
.24:
  %".25" = load i32, i32* %".4", align 4
  %".26" = icmp eq i32 %".25", 1
  br i1 %".26", label %".30", label %".27"
.27:
  %".28" = load i32, i32* %".4", align 4
  %".29" = icmp eq i32 %".28", 6
  br label %".30"
.30:
  %".31" = phi  i1 [1, %".24"], [%".29", %".27"]
  br i1 %".31", label %".32", label %".52"
.32:
  %".33" = load i32, i32* %".4", align 4
  %".34" = icmp eq i32 %".33", 1
  br i1 %".34", label %".35", label %".43"
.35:
  store i32 1, i32* %".7", align 4
  %".37" = bitcast [3 x i8]* @".str.d" to i8*
  %".38" = alloca i32
  store i32 1, i32* %".38"
  %".40" = load i32, i32* %".38"
  %".41" = call i32 (i8*, ...) @"printf"(i8* %".37", i32 %".40")
  ; printf "%d" 1
  br label %".43"
.43:
  store i32 6, i32* %".7", align 4
  ; case 6 b = 6
  %".46" = bitcast [3 x i8]* @".str.d" to i8*
  %".47" = alloca i32
  store i32 6, i32* %".47"
  %".49" = load i32, i32* %".47"
  %".50" = call i32 (i8*, ...) @"printf"(i8* %".46", i32 %".49")
  ; printf "%d" 6
  br label %".52"
.52:
  store i32 2, i32* %".7", align 4
  ; case 2 b = 2
  %".55" = bitcast [3 x i8]* @".str.d" to i8*
  %".56" = alloca i32
  store i32 2, i32* %".56"
  %".58" = load i32, i32* %".56"
  %".59" = call i32 (i8*, ...) @"printf"(i8* %".55", i32 %".58")
  ; printf "%d" 2
  br label %".61"
.61:
  %".62" = load i32, i32* %".4", align 4
  %".63" = icmp ne i32 %".62", 1
  br i1 %".63", label %".64", label %".70"
.64:
  %".65" = load i32, i32* %".4", align 4
  %".66" = icmp ne i32 %".65", 6
  br i1 %".66", label %".67", label %".70"
.67:
  %".68" = load i32, i32* %".4", align 4
  %".69" = icmp ne i32 %".68", 2
  br label %".70"
.70:
  ; break default b = 3
  %".72" = phi  i1 [0, %".61"], [0, %".64"], [%".69", %".67"]
  br i1 %".72", label %".73", label %".81"
.73:
  store i32 3, i32* %".7", align 4
  %".75" = bitcast [3 x i8]* @".str.d" to i8*
  %".76" = alloca i32
  store i32 3, i32* %".76"
  %".78" = load i32, i32* %".76"
  %".79" = call i32 (i8*, ...) @"printf"(i8* %".75", i32 %".78")
  ; printf "%d" 3
  br label %".81"
.81:
  %".82" = bitcast [3 x i8]* @".str.d" to i8*
  %".83" = alloca i32
  store i32 4, i32* %".83"
  %".85" = load i32, i32* %".83"
  %".86" = call i32 (i8*, ...) @"printf"(i8* %".82", i32 %".85")
  ; break    printf "%d" 4
  ret i32 0
  ;  return 0
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"
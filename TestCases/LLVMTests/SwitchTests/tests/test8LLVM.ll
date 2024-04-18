; ModuleID = "tests/test8.c"
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
  store i32 200, i32* %".4", align 4
  ; a = 200
  %".12" = load i32, i32* %".4", align 4
  ; switch a
  %".14" = icmp ne i32 %".12", 1
  br i1 %".14", label %".15", label %".21"
.15:
  %".16" = load i32, i32* %".4", align 4
  %".17" = icmp ne i32 %".16", 6
  br i1 %".17", label %".18", label %".21"
.18:
  %".19" = load i32, i32* %".4", align 4
  %".20" = icmp ne i32 %".19", 2
  br i1 %".20", label %".30", label %".21"
.21:
  %".22" = load i32, i32* %".4", align 4
  %".23" = icmp eq i32 %".22", 1
  br i1 %".23", label %".30", label %".24"
.24:
  %".25" = load i32, i32* %".4", align 4
  %".26" = icmp eq i32 %".25", 6
  br i1 %".26", label %".30", label %".27"
.27:
  %".28" = load i32, i32* %".4", align 4
  %".29" = icmp eq i32 %".28", 2
  br label %".30"
.30:
  ; default b = 3
  %".32" = phi  i1 [1, %".18"], [1, %".21"], [1, %".24"], [%".29", %".27"]
  br i1 %".32", label %".33", label %".121"
.33:
  %".34" = load i32, i32* %".4", align 4
  %".35" = icmp ne i32 %".34", 1
  br i1 %".35", label %".36", label %".42"
.36:
  %".37" = load i32, i32* %".4", align 4
  %".38" = icmp ne i32 %".37", 6
  br i1 %".38", label %".39", label %".42"
.39:
  %".40" = load i32, i32* %".4", align 4
  %".41" = icmp ne i32 %".40", 2
  br i1 %".41", label %".48", label %".42"
.42:
  %".43" = load i32, i32* %".4", align 4
  %".44" = icmp eq i32 %".43", 1
  br i1 %".44", label %".48", label %".45"
.45:
  %".46" = load i32, i32* %".4", align 4
  %".47" = icmp eq i32 %".46", 6
  br label %".48"
.48:
  %".49" = phi  i1 [1, %".39"], [1, %".42"], [%".47", %".45"]
  br i1 %".49", label %".50", label %".112"
.50:
  %".51" = load i32, i32* %".4", align 4
  %".52" = icmp ne i32 %".51", 1
  br i1 %".52", label %".53", label %".59"
.53:
  %".54" = load i32, i32* %".4", align 4
  %".55" = icmp ne i32 %".54", 6
  br i1 %".55", label %".56", label %".59"
.56:
  %".57" = load i32, i32* %".4", align 4
  %".58" = icmp ne i32 %".57", 2
  br i1 %".58", label %".62", label %".59"
.59:
  %".60" = load i32, i32* %".4", align 4
  %".61" = icmp eq i32 %".60", 1
  br label %".62"
.62:
  %".63" = phi  i1 [1, %".56"], [%".61", %".59"]
  br i1 %".63", label %".64", label %".103"
.64:
  %".65" = load i32, i32* %".4", align 4
  %".66" = icmp ne i32 %".65", 1
  br i1 %".66", label %".67", label %".73"
.67:
  %".68" = load i32, i32* %".4", align 4
  %".69" = icmp ne i32 %".68", 6
  br i1 %".69", label %".70", label %".73"
.70:
  %".71" = load i32, i32* %".4", align 4
  %".72" = icmp ne i32 %".71", 2
  br label %".73"
.73:
  %".74" = phi  i1 [0, %".64"], [0, %".67"], [%".72", %".70"]
  br i1 %".74", label %".75", label %".83"
.75:
  store i32 3, i32* %".7", align 4
  %".77" = bitcast [3 x i8]* @".str.d" to i8*
  %".78" = alloca i32
  store i32 3, i32* %".78"
  %".80" = load i32, i32* %".78"
  %".81" = call i32 (i8*, ...) @"printf"(i8* %".77", i32 %".80")
  ; printf "%d" 3
  br label %".83"
.83:
  store i32 1, i32* %".7", align 4
  ;  case 1 b = 1
  %".86" = bitcast [3 x i8]* @".str.d" to i8*
  %".87" = alloca i32
  store i32 1, i32* %".87"
  %".89" = load i32, i32* %".87"
  %".90" = call i32 (i8*, ...) @"printf"(i8* %".86", i32 %".89")
  ; printf "%d" 1
  %".92" = load i32, i32* %".4", align 4
  ;  if a < 3
  %".94" = icmp slt i32 %".92", 3
  br i1 %".94", label %".95", label %".102"
.95:
  %".96" = bitcast [3 x i8]* @".str.d" to i8*
  %".97" = alloca i32
  store i32 7, i32* %".97"
  %".99" = load i32, i32* %".97"
  %".100" = call i32 (i8*, ...) @"printf"(i8* %".96", i32 %".99")
  ; printf "%d" 7
  br label %".102"
.102:
  br label %".103"
.103:
  store i32 6, i32* %".7", align 4
  ;  case 6 b = 6
  %".106" = bitcast [3 x i8]* @".str.d" to i8*
  %".107" = alloca i32
  store i32 6, i32* %".107"
  %".109" = load i32, i32* %".107"
  %".110" = call i32 (i8*, ...) @"printf"(i8* %".106", i32 %".109")
  ; printf "%d" 6
  br label %".112"
.112:
  store i32 2, i32* %".7", align 4
  ;   case 2 b = 2
  %".115" = bitcast [3 x i8]* @".str.d" to i8*
  %".116" = alloca i32
  store i32 2, i32* %".116"
  %".118" = load i32, i32* %".116"
  %".119" = call i32 (i8*, ...) @"printf"(i8* %".115", i32 %".118")
  ; printf "%d" 2
  br label %".121"
.121:
  %".122" = bitcast [3 x i8]* @".str.d" to i8*
  %".123" = alloca i32
  store i32 4, i32* %".123"
  %".125" = load i32, i32* %".123"
  %".126" = call i32 (i8*, ...) @"printf"(i8* %".122", i32 %".125")
  ;     printf "%d" 4
  ret i32 0
  ;  return 0
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"
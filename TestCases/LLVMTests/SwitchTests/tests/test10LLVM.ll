; ModuleID = "tests/test10.c"
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
  store i32 0, i32* %".4", align 4
  ; a = 0
  %".12" = load i32, i32* %".4", align 4
  ; switch a
  %".14" = icmp eq i32 %".12", 0
  br i1 %".14", label %".18", label %".15"
.15:
  %".16" = load i32, i32* %".4", align 4
  %".17" = icmp eq i32 %".16", 1
  br label %".18"
.18:
  ;  case 0 case 1
  %".20" = phi  i1 [%".17", %".15"], [1, %".2"]
  br i1 %".20", label %".21", label %".34"
.21:
  %".22" = load i32, i32* %".4", align 4
  %".23" = icmp eq i32 %".22", 0
  br i1 %".23", label %".24", label %".25"
.24:
  br label %".25"
.25:
  store i32 1, i32* %".7", align 4
  ; b = 1
  %".28" = bitcast [3 x i8]* @".str.0" to i8*
  %".29" = alloca i32
  store i32 1, i32* %".29"
  %".31" = load i32, i32* %".29"
  %".32" = call i32 (i8*, ...) @"printf"(i8* %".28", i32 %".31")
  ; printf "%d" 1
  br label %".34"
.34:
  %".35" = load i32, i32* %".4", align 4
  %".36" = icmp eq i32 %".35", 6
  br i1 %".36", label %".37", label %".46"
.37:
  ; break case 6 b = 6
  store i32 6, i32* %".7", align 4
  %".40" = bitcast [3 x i8]* @".str.0" to i8*
  %".41" = alloca i32
  store i32 6, i32* %".41"
  %".43" = load i32, i32* %".41"
  %".44" = call i32 (i8*, ...) @"printf"(i8* %".40", i32 %".43")
  ; printf "%d" 6
  br label %".46"
.46:
  %".47" = load i32, i32* %".4", align 4
  %".48" = icmp eq i32 %".47", 2
  br i1 %".48", label %".49", label %".58"
.49:
  ; break case 2 b = 2
  store i32 2, i32* %".7", align 4
  %".52" = bitcast [3 x i8]* @".str.0" to i8*
  %".53" = alloca i32
  store i32 2, i32* %".53"
  %".55" = load i32, i32* %".53"
  %".56" = call i32 (i8*, ...) @"printf"(i8* %".52", i32 %".55")
  ; printf "%d" 2
  br label %".58"
.58:
  %".59" = load i32, i32* %".4", align 4
  %".60" = icmp ne i32 %".59", 0
  br i1 %".60", label %".61", label %".70"
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
  %".72" = phi  i1 [0, %".58"], [0, %".61"], [0, %".64"], [%".69", %".67"]
  br i1 %".72", label %".73", label %".81"
.73:
  store i32 3, i32* %".7", align 4
  %".75" = bitcast [3 x i8]* @".str.0" to i8*
  %".76" = alloca i32
  store i32 3, i32* %".76"
  %".78" = load i32, i32* %".76"
  %".79" = call i32 (i8*, ...) @"printf"(i8* %".75", i32 %".78")
  ; printf "%d" 3
  br label %".81"
.81:
  %".82" = bitcast [3 x i8]* @".str.0" to i8*
  %".83" = alloca i32
  store i32 4, i32* %".83"
  %".85" = load i32, i32* %".83"
  %".86" = call i32 (i8*, ...) @"printf"(i8* %".82", i32 %".85")
  ; break    printf "%d" 4
  ret i32 0
  ;  return 0
}

@".str.0" = internal constant [3 x i8] c"%d\00"
declare i32 @"printf"(i8* %".1", ...)

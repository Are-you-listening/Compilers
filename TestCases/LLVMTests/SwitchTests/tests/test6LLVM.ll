; ModuleID = "tests/test6.c"
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
  store i32 1, i32* %".4", align 4
  ; a = 1
  %".12" = load i32, i32* %".4", align 4
  ; switch a
  %".14" = icmp eq i32 %".12", 1
  br i1 %".14", label %".30", label %".15"
.15:
  %".16" = load i32, i32* %".4", align 4
  %".17" = icmp eq i32 %".16", 6
  br i1 %".17", label %".30", label %".18"
.18:
  %".19" = load i32, i32* %".4", align 4
  %".20" = icmp ne i32 %".19", 1
  br i1 %".20", label %".21", label %".27"
.21:
  %".22" = load i32, i32* %".4", align 4
  %".23" = icmp ne i32 %".22", 6
  br i1 %".23", label %".24", label %".27"
.24:
  %".25" = load i32, i32* %".4", align 4
  %".26" = icmp ne i32 %".25", 2
  br i1 %".26", label %".30", label %".27"
.27:
  %".28" = load i32, i32* %".4", align 4
  %".29" = icmp eq i32 %".28", 2
  br label %".30"
.30:
  ; case 1 b = 1
  %".32" = phi  i1 [1, %".15"], [1, %".2"], [1, %".24"], [%".29", %".27"]
  br i1 %".32", label %".33", label %".107"
.33:
  %".34" = load i32, i32* %".4", align 4
  %".35" = icmp eq i32 %".34", 1
  br i1 %".35", label %".48", label %".36"
.36:
  %".37" = load i32, i32* %".4", align 4
  %".38" = icmp eq i32 %".37", 6
  br i1 %".38", label %".48", label %".39"
.39:
  %".40" = load i32, i32* %".4", align 4
  %".41" = icmp ne i32 %".40", 1
  br i1 %".41", label %".42", label %".48"
.42:
  %".43" = load i32, i32* %".4", align 4
  %".44" = icmp ne i32 %".43", 6
  br i1 %".44", label %".45", label %".48"
.45:
  %".46" = load i32, i32* %".4", align 4
  %".47" = icmp ne i32 %".46", 2
  br label %".48"
.48:
  %".49" = phi  i1 [1, %".33"], [1, %".36"], [0, %".39"], [0, %".42"], [%".47", %".45"]
  br i1 %".49", label %".50", label %".98"
.50:
  %".51" = load i32, i32* %".4", align 4
  %".52" = icmp eq i32 %".51", 1
  br i1 %".52", label %".56", label %".53"
.53:
  %".54" = load i32, i32* %".4", align 4
  %".55" = icmp eq i32 %".54", 6
  br label %".56"
.56:
  %".57" = phi  i1 [1, %".50"], [%".55", %".53"]
  br i1 %".57", label %".58", label %".89"
.58:
  %".59" = load i32, i32* %".4", align 4
  %".60" = icmp eq i32 %".59", 1
  br i1 %".60", label %".61", label %".80"
.61:
  store i32 1, i32* %".7", align 4
  %".63" = bitcast [3 x i8]* @".str.d" to i8*
  %".64" = alloca i32
  store i32 1, i32* %".64"
  %".66" = load i32, i32* %".64"
  %".67" = call i32 (i8*, ...) @"printf"(i8* %".63", i32 %".66")
  ; printf "%d" 1
  %".69" = load i32, i32* %".4", align 4
  ;  if a < 3
  %".71" = icmp slt i32 %".69", 3
  br i1 %".71", label %".72", label %".79"
.72:
  %".73" = bitcast [3 x i8]* @".str.d" to i8*
  %".74" = alloca i32
  store i32 7, i32* %".74"
  %".76" = load i32, i32* %".74"
  %".77" = call i32 (i8*, ...) @"printf"(i8* %".73", i32 %".76")
  ; printf "%d" 7
  br label %".79"
.79:
  br label %".80"
.80:
  store i32 6, i32* %".7", align 4
  ;  case 6 b = 6
  %".83" = bitcast [3 x i8]* @".str.d" to i8*
  %".84" = alloca i32
  store i32 6, i32* %".84"
  %".86" = load i32, i32* %".84"
  %".87" = call i32 (i8*, ...) @"printf"(i8* %".83", i32 %".86")
  ; printf "%d" 6
  br label %".89"
.89:
  store i32 3, i32* %".7", align 4
  ;  default b = 3
  %".92" = bitcast [3 x i8]* @".str.d" to i8*
  %".93" = alloca i32
  store i32 3, i32* %".93"
  %".95" = load i32, i32* %".93"
  %".96" = call i32 (i8*, ...) @"printf"(i8* %".92", i32 %".95")
  ; printf "%d" 3
  br label %".98"
.98:
  store i32 2, i32* %".7", align 4
  ;  case 2 b = 2
  %".101" = bitcast [3 x i8]* @".str.d" to i8*
  %".102" = alloca i32
  store i32 2, i32* %".102"
  %".104" = load i32, i32* %".102"
  %".105" = call i32 (i8*, ...) @"printf"(i8* %".101", i32 %".104")
  ; printf "%d" 2
  br label %".107"
.107:
  %".108" = bitcast [3 x i8]* @".str.d" to i8*
  %".109" = alloca i32
  store i32 4, i32* %".109"
  %".111" = load i32, i32* %".109"
  %".112" = call i32 (i8*, ...) @"printf"(i8* %".108", i32 %".111")
  ; break     printf "%d" 4
  ret i32 0
  ;  return 0
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"
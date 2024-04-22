; ModuleID = "tests/test16.c"
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
  br i1 %".14", label %".24", label %".15"
.15:
  %".16" = load i32, i32* %".4", align 4
  %".17" = icmp eq i32 %".16", 6
  br i1 %".17", label %".24", label %".18"
.18:
  %".19" = load i32, i32* %".4", align 4
  %".20" = icmp ne i32 %".19", 1
  br i1 %".20", label %".21", label %".24"
.21:
  %".22" = load i32, i32* %".4", align 4
  %".23" = icmp ne i32 %".22", 6
  br label %".24"
.24:
  ; case 1 b = 1
  %".26" = phi  i1 [1, %".15"], [0, %".18"], [1, %".2"], [%".23", %".21"]
  br i1 %".26", label %".27", label %".62"
.27:
  %".28" = load i32, i32* %".4", align 4
  %".29" = icmp eq i32 %".28", 1
  br i1 %".29", label %".33", label %".30"
.30:
  %".31" = load i32, i32* %".4", align 4
  %".32" = icmp eq i32 %".31", 6
  br label %".33"
.33:
  %".34" = phi  i1 [1, %".27"], [%".32", %".30"]
  br i1 %".34", label %".35", label %".53"
.35:
  %".36" = load i32, i32* %".4", align 4
  %".37" = icmp eq i32 %".36", 1
  br i1 %".37", label %".38", label %".46"
.38:
  store i32 1, i32* %".7", align 4
  %".40" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".41" = alloca i32
  store i32 1, i32* %".41"
  %".43" = load i32, i32* %".41"
  %".44" = call i32 (i8*, ...) @"printf"(i8* %".40", i32 %".43")
  ; printf "%d" 1
  br label %".46"
.46:
  %".47" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".48" = alloca i32
  store i32 6, i32* %".48"
  %".50" = load i32, i32* %".48"
  %".51" = call i32 (i8*, ...) @"printf"(i8* %".47", i32 %".50")
  ; case 6 printf "%d" 6
  br label %".53"
.53:
  store i32 3, i32* %".7", align 4
  ; default b = 3
  %".56" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".57" = alloca i32
  store i32 3, i32* %".57"
  %".59" = load i32, i32* %".57"
  %".60" = call i32 (i8*, ...) @"printf"(i8* %".56", i32 %".59")
  ; printf "%d" 3
  br label %".62"
.62:
  %".63" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".64" = alloca i32
  store i32 4, i32* %".64"
  %".66" = load i32, i32* %".64"
  %".67" = call i32 (i8*, ...) @"printf"(i8* %".63", i32 %".66")
  ;    printf "%d" 4
  ret i32 0
  ;  return 0
}

declare i32 @"printf"(i8* %".1", ...)

@".str.PS0" = internal constant [3 x i8] c"%d\00"
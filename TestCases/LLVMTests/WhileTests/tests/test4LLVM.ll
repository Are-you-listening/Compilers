; ModuleID = "tests/test4.c"
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
  br label %".10"
.10:
  ;  while a < 30
  %".12" = load i32, i32* %".4", align 4
  %".13" = icmp slt i32 %".12", 30
  br i1 %".13", label %".14", label %".55"
.14:
  %".15" = load i32, i32* %".4", align 4
  ; if a % 2 == 0
  %".17" = srem i32 %".15", 2
  %".18" = icmp eq i32 %".17", 0
  br i1 %".18", label %".19", label %".26"
.19:
  %".20" = bitcast [3 x i8]* @".str.0" to i8*
  %".21" = alloca i32
  store i32 1, i32* %".21"
  %".23" = load i32, i32* %".21"
  %".24" = call i32 (i8*, ...) @"printf"(i8* %".20", i32 %".23")
  ; printf "%d" 1
  br label %".50"
.26:
  %".27" = bitcast [3 x i8]* @".str.0" to i8*
  %".28" = alloca i32
  store i32 2, i32* %".28"
  %".30" = load i32, i32* %".28"
  %".31" = call i32 (i8*, ...) @"printf"(i8* %".27", i32 %".30")
  ; else printf "%d" 2
  br label %".33"
.33:
  ; while b < 5
  %".35" = load i32, i32* %".7", align 4
  %".36" = icmp slt i32 %".35", 5
  br i1 %".36", label %".37", label %".49"
.37:
  %".38" = load i32, i32* %".7", align 4
  ; printf "%d" b
  %".40" = bitcast [3 x i8]* @".str.0" to i8*
  %".41" = alloca i32
  store i32 %".38", i32* %".41"
  %".43" = load i32, i32* %".41"
  %".44" = call i32 (i8*, ...) @"printf"(i8* %".40", i32 %".43")
  %".45" = load i32, i32* %".7", align 4
  ; b ++
  %".47" = add i32 %".45", 1
  store i32 %".47", i32* %".7", align 4
  br label %".33"
.49:
  br label %".50"
.50:
  %".51" = load i32, i32* %".4", align 4
  ;    a ++
  %".53" = add i32 %".51", 1
  store i32 %".53", i32* %".4", align 4
  br label %".10"
.55:
  ret i32 0
  ;   return 0
}

@".str.0" = internal constant [3 x i8] c"%d\00"
declare i32 @"printf"(i8* %".1", ...)

; ModuleID = "tests/test5.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;    INT main
  %".4" = alloca [2 x [2 x i32]], align 8
  ;  INT x [2][2] = 1 2 3 4
  %".6" = getelementptr inbounds [2 x [2 x i32]], [2 x [2 x i32]]* %".4", i64 0, i32 1
  %".7" = getelementptr inbounds [2 x i32], [2 x i32]* %".6", i64 0, i32 1
  store i32 4, i32* %".7", align 4
  %".9" = getelementptr inbounds [2 x [2 x i32]], [2 x [2 x i32]]* %".4", i64 0, i32 1
  %".10" = getelementptr inbounds [2 x i32], [2 x i32]* %".9", i64 0, i32 0
  store i32 3, i32* %".10", align 4
  %".12" = getelementptr inbounds [2 x [2 x i32]], [2 x [2 x i32]]* %".4", i64 0, i32 0
  %".13" = getelementptr inbounds [2 x i32], [2 x i32]* %".12", i64 0, i32 1
  store i32 2, i32* %".13", align 4
  %".15" = getelementptr inbounds [2 x [2 x i32]], [2 x [2 x i32]]* %".4", i64 0, i32 0
  %".16" = getelementptr inbounds [2 x i32], [2 x i32]* %".15", i64 0, i32 0
  store i32 1, i32* %".16", align 4
  %".18" = getelementptr inbounds [2 x [2 x i32]], [2 x [2 x i32]]* %".4", i64 0, i32 0
  ;  printf "%d" x [0][0]
  %".20" = getelementptr inbounds [2 x i32], [2 x i32]* %".18", i64 0, i32 0
  %".21" = load i32, i32* %".20", align 4
  %".22" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".23" = alloca i32
  store i32 %".21", i32* %".23"
  %".25" = load i32, i32* %".23"
  %".26" = call i32 (i8*, ...) @"printf"(i8* %".22", i32 %".25")
  %".27" = getelementptr inbounds [2 x [2 x i32]], [2 x [2 x i32]]* %".4", i64 0, i32 0
  ; printf "%d" x [0][1]
  %".29" = getelementptr inbounds [2 x i32], [2 x i32]* %".27", i64 0, i32 1
  %".30" = load i32, i32* %".29", align 4
  %".31" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".32" = alloca i32
  store i32 %".30", i32* %".32"
  %".34" = load i32, i32* %".32"
  %".35" = call i32 (i8*, ...) @"printf"(i8* %".31", i32 %".34")
  %".36" = getelementptr inbounds [2 x [2 x i32]], [2 x [2 x i32]]* %".4", i64 0, i32 1
  ; printf "%d" x [1][0]
  %".38" = getelementptr inbounds [2 x i32], [2 x i32]* %".36", i64 0, i32 0
  %".39" = load i32, i32* %".38", align 4
  %".40" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".41" = alloca i32
  store i32 %".39", i32* %".41"
  %".43" = load i32, i32* %".41"
  %".44" = call i32 (i8*, ...) @"printf"(i8* %".40", i32 %".43")
  %".45" = getelementptr inbounds [2 x [2 x i32]], [2 x [2 x i32]]* %".4", i64 0, i32 1
  ; printf "%d" x [1][1]
  %".47" = getelementptr inbounds [2 x i32], [2 x i32]* %".45", i64 0, i32 1
  %".48" = load i32, i32* %".47", align 4
  %".49" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".50" = alloca i32
  store i32 %".48", i32* %".50"
  %".52" = load i32, i32* %".50"
  %".53" = call i32 (i8*, ...) @"printf"(i8* %".49", i32 %".52")
  ret i32 0
  ;  return 0
}

declare i32 @"printf"(i8* %".1", ...)

@".str.PS0" = internal constant [3 x i8] c"%d\00"
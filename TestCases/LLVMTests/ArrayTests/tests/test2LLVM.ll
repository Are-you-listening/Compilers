; ModuleID = "tests/test2.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;    INT main
  %".4" = alloca [2 x [3 x i32]], align 8
  ; INT x [2][3]
  %".6" = getelementptr inbounds [2 x [3 x i32]], [2 x [3 x i32]]* %".4", i64 0, i32 0
  ;  x [0][0] = 0
  %".8" = getelementptr inbounds [3 x i32], [3 x i32]* %".6", i64 0, i32 0
  store i32 0, i32* %".8", align 4
  %".10" = getelementptr inbounds [2 x [3 x i32]], [2 x [3 x i32]]* %".4", i64 0, i32 0
  ; x [0][1] = 1
  %".12" = getelementptr inbounds [3 x i32], [3 x i32]* %".10", i64 0, i32 1
  store i32 1, i32* %".12", align 4
  %".14" = getelementptr inbounds [2 x [3 x i32]], [2 x [3 x i32]]* %".4", i64 0, i32 0
  ; x [0][2] = 2
  %".16" = getelementptr inbounds [3 x i32], [3 x i32]* %".14", i64 0, i32 2
  store i32 2, i32* %".16", align 4
  %".18" = getelementptr inbounds [2 x [3 x i32]], [2 x [3 x i32]]* %".4", i64 0, i32 1
  ; x [1][0] = 3
  %".20" = getelementptr inbounds [3 x i32], [3 x i32]* %".18", i64 0, i32 0
  store i32 3, i32* %".20", align 4
  %".22" = getelementptr inbounds [2 x [3 x i32]], [2 x [3 x i32]]* %".4", i64 0, i32 1
  ; x [1][1] = 4
  %".24" = getelementptr inbounds [3 x i32], [3 x i32]* %".22", i64 0, i32 1
  store i32 4, i32* %".24", align 4
  %".26" = getelementptr inbounds [2 x [3 x i32]], [2 x [3 x i32]]* %".4", i64 0, i32 1
  ; x [1][2] = 5
  %".28" = getelementptr inbounds [3 x i32], [3 x i32]* %".26", i64 0, i32 2
  store i32 5, i32* %".28", align 4
  %".30" = getelementptr inbounds [2 x [3 x i32]], [2 x [3 x i32]]* %".4", i64 0, i32 0
  ; printf "%d" x [0][0]
  %".32" = getelementptr inbounds [3 x i32], [3 x i32]* %".30", i64 0, i32 0
  %".33" = load i32, i32* %".32", align 4
  %".34" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".35" = alloca i32
  store i32 %".33", i32* %".35"
  %".37" = load i32, i32* %".35"
  %".38" = call i32 (i8*, ...) @"printf"(i8* %".34", i32 %".37")
  %".39" = getelementptr inbounds [2 x [3 x i32]], [2 x [3 x i32]]* %".4", i64 0, i32 0
  ; printf "%d" x [0][1]
  %".41" = getelementptr inbounds [3 x i32], [3 x i32]* %".39", i64 0, i32 1
  %".42" = load i32, i32* %".41", align 4
  %".43" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".44" = alloca i32
  store i32 %".42", i32* %".44"
  %".46" = load i32, i32* %".44"
  %".47" = call i32 (i8*, ...) @"printf"(i8* %".43", i32 %".46")
  %".48" = getelementptr inbounds [2 x [3 x i32]], [2 x [3 x i32]]* %".4", i64 0, i32 0
  ; printf "%d" x [0][2]
  %".50" = getelementptr inbounds [3 x i32], [3 x i32]* %".48", i64 0, i32 2
  %".51" = load i32, i32* %".50", align 4
  %".52" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".53" = alloca i32
  store i32 %".51", i32* %".53"
  %".55" = load i32, i32* %".53"
  %".56" = call i32 (i8*, ...) @"printf"(i8* %".52", i32 %".55")
  %".57" = getelementptr inbounds [2 x [3 x i32]], [2 x [3 x i32]]* %".4", i64 0, i32 1
  ; printf "%d" x [1][0]
  %".59" = getelementptr inbounds [3 x i32], [3 x i32]* %".57", i64 0, i32 0
  %".60" = load i32, i32* %".59", align 4
  %".61" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".62" = alloca i32
  store i32 %".60", i32* %".62"
  %".64" = load i32, i32* %".62"
  %".65" = call i32 (i8*, ...) @"printf"(i8* %".61", i32 %".64")
  %".66" = getelementptr inbounds [2 x [3 x i32]], [2 x [3 x i32]]* %".4", i64 0, i32 1
  ; printf "%d" x [1][1]
  %".68" = getelementptr inbounds [3 x i32], [3 x i32]* %".66", i64 0, i32 1
  %".69" = load i32, i32* %".68", align 4
  %".70" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".71" = alloca i32
  store i32 %".69", i32* %".71"
  %".73" = load i32, i32* %".71"
  %".74" = call i32 (i8*, ...) @"printf"(i8* %".70", i32 %".73")
  %".75" = getelementptr inbounds [2 x [3 x i32]], [2 x [3 x i32]]* %".4", i64 0, i32 1
  ; printf "%d" x [1][2]
  %".77" = getelementptr inbounds [3 x i32], [3 x i32]* %".75", i64 0, i32 2
  %".78" = load i32, i32* %".77", align 4
  %".79" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".80" = alloca i32
  store i32 %".78", i32* %".80"
  %".82" = load i32, i32* %".80"
  %".83" = call i32 (i8*, ...) @"printf"(i8* %".79", i32 %".82")
  %".84" = getelementptr inbounds [2 x [3 x i32]], [2 x [3 x i32]]* %".4", i64 0, i32 0
  ;  x [0][2] = x [1][2] + x [1][0]
  %".86" = getelementptr inbounds [3 x i32], [3 x i32]* %".84", i64 0, i32 2
  %".87" = getelementptr inbounds [2 x [3 x i32]], [2 x [3 x i32]]* %".4", i64 0, i32 1
  %".88" = getelementptr inbounds [3 x i32], [3 x i32]* %".87", i64 0, i32 2
  %".89" = load i32, i32* %".88", align 4
  %".90" = getelementptr inbounds [2 x [3 x i32]], [2 x [3 x i32]]* %".4", i64 0, i32 1
  %".91" = getelementptr inbounds [3 x i32], [3 x i32]* %".90", i64 0, i32 0
  %".92" = load i32, i32* %".91", align 4
  %".93" = add i32 %".89", %".92"
  store i32 %".93", i32* %".86", align 4
  %".95" = getelementptr inbounds [2 x [3 x i32]], [2 x [3 x i32]]* %".4", i64 0, i32 0
  ;  printf "%d" x [0][2]
  %".97" = getelementptr inbounds [3 x i32], [3 x i32]* %".95", i64 0, i32 2
  %".98" = load i32, i32* %".97", align 4
  %".99" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".100" = alloca i32
  store i32 %".98", i32* %".100"
  %".102" = load i32, i32* %".100"
  %".103" = call i32 (i8*, ...) @"printf"(i8* %".99", i32 %".102")
  %".104" = getelementptr inbounds [2 x [3 x i32]], [2 x [3 x i32]]* %".4", i64 0, i32 1
  ; printf "%d" x [1][2]
  %".106" = getelementptr inbounds [3 x i32], [3 x i32]* %".104", i64 0, i32 2
  %".107" = load i32, i32* %".106", align 4
  %".108" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".109" = alloca i32
  store i32 %".107", i32* %".109"
  %".111" = load i32, i32* %".109"
  %".112" = call i32 (i8*, ...) @"printf"(i8* %".108", i32 %".111")
  %".113" = getelementptr inbounds [2 x [3 x i32]], [2 x [3 x i32]]* %".4", i64 0, i32 1
  ; printf "%d" x [1][0]
  %".115" = getelementptr inbounds [3 x i32], [3 x i32]* %".113", i64 0, i32 0
  %".116" = load i32, i32* %".115", align 4
  %".117" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".118" = alloca i32
  store i32 %".116", i32* %".118"
  %".120" = load i32, i32* %".118"
  %".121" = call i32 (i8*, ...) @"printf"(i8* %".117", i32 %".120")
  ret i32 0
  ; return 0
}

declare i32 @"printf"(i8* %".1", ...)

@".str.PS0" = internal constant [3 x i8] c"%d\00"
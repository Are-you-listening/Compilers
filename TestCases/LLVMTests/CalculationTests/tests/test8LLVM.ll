; ModuleID = "tests/test8.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ; INT main
  %".4" = alloca i32, align 4
  store i32 -55, i32* %".4", align 4
  ; INT number = - 55
  %".7" = alloca i32, align 4
  store i32 1, i32* %".7", align 4
  ; INT a = 1
  %".10" = load i32, i32* %".4", align 4
  ; a = number ++
  %".12" = add i32 %".10", 1
  store i32 %".12", i32* %".4", align 4
  store i32 %".10", i32* %".7", align 4
  %".15" = load i32, i32* %".7", align 4
  ; printf "%d" , a
  %".17" = bitcast [3 x i8]* @".str.d" to i8*
  %".18" = alloca i32
  store i32 %".15", i32* %".18"
  %".20" = load i32, i32* %".18"
  %".21" = call i32 (i8*, ...) @"printf"(i8* %".17", i32 %".20")
  %".22" = load i32, i32* %".4", align 4
  ; printf "%d" , number
  %".24" = bitcast [3 x i8]* @".str.d" to i8*
  %".25" = alloca i32
  store i32 %".22", i32* %".25"
  %".27" = load i32, i32* %".25"
  %".28" = call i32 (i8*, ...) @"printf"(i8* %".24", i32 %".27")
  %".29" = load i32, i32* %".4", align 4
  ; number = number ++
  %".31" = add i32 %".29", 1
  store i32 %".31", i32* %".4", align 4
  store i32 %".29", i32* %".4", align 4
  %".34" = load i32, i32* %".4", align 4
  ; printf "%d" , number
  %".36" = bitcast [3 x i8]* @".str.d" to i8*
  %".37" = alloca i32
  store i32 %".34", i32* %".37"
  %".39" = load i32, i32* %".37"
  %".40" = call i32 (i8*, ...) @"printf"(i8* %".36", i32 %".39")
  %".41" = load i32, i32* %".4", align 4
  ; INT n = number ++
  %".43" = add i32 %".41", 1
  store i32 %".43", i32* %".4", align 4
  %".45" = alloca i32, align 4
  store i32 %".41", i32* %".45", align 4
  %".47" = load i32, i32* %".4", align 4
  ; printf "%d" , number
  %".49" = bitcast [3 x i8]* @".str.d" to i8*
  %".50" = alloca i32
  store i32 %".47", i32* %".50"
  %".52" = load i32, i32* %".50"
  %".53" = call i32 (i8*, ...) @"printf"(i8* %".49", i32 %".52")
  %".54" = load i32, i32* %".45", align 4
  ; printf "%d" , n
  %".56" = bitcast [3 x i8]* @".str.d" to i8*
  %".57" = alloca i32
  store i32 %".54", i32* %".57"
  %".59" = load i32, i32* %".57"
  %".60" = call i32 (i8*, ...) @"printf"(i8* %".56", i32 %".59")
  %".61" = load i32, i32* %".45", align 4
  ; a = ++ n
  %".63" = add i32 %".61", 1
  store i32 %".63", i32* %".45", align 4
  store i32 %".63", i32* %".7", align 4
  %".66" = load i32, i32* %".7", align 4
  ; printf "%d" , a
  %".68" = bitcast [3 x i8]* @".str.d" to i8*
  %".69" = alloca i32
  store i32 %".66", i32* %".69"
  %".71" = load i32, i32* %".69"
  %".72" = call i32 (i8*, ...) @"printf"(i8* %".68", i32 %".71")
  %".73" = load i32, i32* %".45", align 4
  ; printf "%d" , n
  %".75" = bitcast [3 x i8]* @".str.d" to i8*
  %".76" = alloca i32
  store i32 %".73", i32* %".76"
  %".78" = load i32, i32* %".76"
  %".79" = call i32 (i8*, ...) @"printf"(i8* %".75", i32 %".78")
  ret i32 0
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"
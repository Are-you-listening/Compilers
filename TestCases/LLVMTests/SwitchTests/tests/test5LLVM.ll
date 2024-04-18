; ModuleID = "tests/test5.c"
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
  store i32 2, i32* %".4", align 4
  ; a = 2
  %".12" = load i32, i32* %".4", align 4
  ; switch a
  %".14" = icmp eq i32 %".12", 1
  br i1 %".14", label %".15", label %".24"
.15:
  ; case 1 b = 1
  store i32 1, i32* %".7", align 4
  %".18" = bitcast [3 x i8]* @".str.d" to i8*
  %".19" = alloca i32
  store i32 1, i32* %".19"
  %".21" = load i32, i32* %".19"
  %".22" = call i32 (i8*, ...) @"printf"(i8* %".18", i32 %".21")
  ; printf "%d" 1
  br label %".24"
.24:
  %".25" = load i32, i32* %".4", align 4
  %".26" = icmp eq i32 %".25", 6
  br i1 %".26", label %".27", label %".36"
.27:
  ; break case 6 b = 6
  store i32 6, i32* %".7", align 4
  %".30" = bitcast [3 x i8]* @".str.d" to i8*
  %".31" = alloca i32
  store i32 6, i32* %".31"
  %".33" = load i32, i32* %".31"
  %".34" = call i32 (i8*, ...) @"printf"(i8* %".30", i32 %".33")
  ; printf "%d" 6
  br label %".36"
.36:
  %".37" = load i32, i32* %".4", align 4
  %".38" = icmp eq i32 %".37", 2
  br i1 %".38", label %".39", label %".48"
.39:
  ; break case 2 b = 2
  store i32 2, i32* %".7", align 4
  %".42" = bitcast [3 x i8]* @".str.d" to i8*
  %".43" = alloca i32
  store i32 2, i32* %".43"
  %".45" = load i32, i32* %".43"
  %".46" = call i32 (i8*, ...) @"printf"(i8* %".42", i32 %".45")
  ; printf "%d" 2
  br label %".48"
.48:
  %".49" = load i32, i32* %".4", align 4
  %".50" = icmp ne i32 %".49", 1
  br i1 %".50", label %".51", label %".57"
.51:
  %".52" = load i32, i32* %".4", align 4
  %".53" = icmp ne i32 %".52", 6
  br i1 %".53", label %".54", label %".57"
.54:
  %".55" = load i32, i32* %".4", align 4
  %".56" = icmp ne i32 %".55", 2
  br label %".57"
.57:
  ; break default b = 3
  %".59" = phi  i1 [0, %".48"], [0, %".51"], [%".56", %".54"]
  br i1 %".59", label %".60", label %".68"
.60:
  store i32 3, i32* %".7", align 4
  %".62" = bitcast [3 x i8]* @".str.d" to i8*
  %".63" = alloca i32
  store i32 3, i32* %".63"
  %".65" = load i32, i32* %".63"
  %".66" = call i32 (i8*, ...) @"printf"(i8* %".62", i32 %".65")
  ; printf "%d" 3
  br label %".68"
.68:
  %".69" = bitcast [3 x i8]* @".str.d" to i8*
  %".70" = alloca i32
  store i32 4, i32* %".70"
  %".72" = load i32, i32* %".70"
  %".73" = call i32 (i8*, ...) @"printf"(i8* %".69", i32 %".72")
  ; break    printf "%d" 4
  ret i32 0
  ;  return 0
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"
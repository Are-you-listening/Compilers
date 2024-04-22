; ModuleID = "tests/test7.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;    INT main
  %".4" = alloca i32, align 4
  store i32 5, i32* %".4", align 4
  ; INT b = CHAR 5
  %".7" = alloca float, align 4
  store float 0x4014000000000000, float* %".7", align 4
  ; FLOAT a = b
  %".10" = alloca i32, align 4
  store i32 5, i32* %".10", align 4
  ; INT c = 5.5
  %".13" = alloca i8, align 1
  store i8 5, i8* %".13", align 1
  ; const CHAR d = const CHAR c
  ; CHAR e = b + 3.5
  %".17" = load i32, i32* %".4", align 4
  %".18" = sitofp i32 %".17" to float
  %".19" = fadd float %".18", 0x400c000000000000
  %".20" = fptosi float %".19" to i8
  %".21" = alloca i8, align 1
  store i8 %".20", i8* %".21", align 1
  ; CHAR f = INT e + 'a'
  %".24" = load i32, i32* %".4", align 4
  %".25" = sitofp i32 %".24" to float
  %".26" = fadd float %".25", 0x400c000000000000
  %".27" = fptosi float %".26" to i8
  %".28" = zext i8 %".27" to i32
  %".29" = add i32 %".28", 97
  %".30" = trunc i32 %".29" to i8
  %".31" = alloca i8, align 1
  store i8 %".30", i8* %".31", align 1
  %".33" = load i32, i32* %".4", align 4
  ;  printf "%d" b
  %".35" = bitcast [3 x i8]* @".str.0" to i8*
  %".36" = alloca i32
  store i32 %".33", i32* %".36"
  %".38" = load i32, i32* %".36"
  %".39" = call i32 (i8*, ...) @"printf"(i8* %".35", i32 %".38")
  %".40" = bitcast [3 x i8]* @".str.1" to i8*
  %".41" = alloca float
  store float 0x4014000000000000, float* %".41"
  %".43" = load float, float* %".41"
  %".44" = fpext float %".43" to double
  %".45" = call i32 (i8*, ...) @"printf"(i8* %".40", double %".44")
  ; printf "%f" a
  %".47" = load i32, i32* %".10", align 4
  ; printf "%d" c
  %".49" = bitcast [3 x i8]* @".str.0" to i8*
  %".50" = alloca i32
  store i32 %".47", i32* %".50"
  %".52" = load i32, i32* %".50"
  %".53" = call i32 (i8*, ...) @"printf"(i8* %".49", i32 %".52")
  %".54" = bitcast [3 x i8]* @".str.2" to i8*
  %".55" = alloca i8
  store i8 5, i8* %".55"
  %".57" = load i8, i8* %".55"
  %".58" = call i32 (i8*, ...) @"printf"(i8* %".54", i8 %".57")
  ; printf "%c" d
  %".60" = load i8, i8* %".21", align 1
  ; printf "%c" e
  %".62" = bitcast [3 x i8]* @".str.2" to i8*
  %".63" = alloca i8
  store i8 %".60", i8* %".63"
  %".65" = load i8, i8* %".63"
  %".66" = call i32 (i8*, ...) @"printf"(i8* %".62", i8 %".65")
  %".67" = load i32, i32* %".4", align 4
  %".68" = sitofp i32 %".67" to float
  %".69" = fadd float %".68", 0x400c000000000000
  %".70" = fptosi float %".69" to i8
  %".71" = zext i8 %".70" to i32
  %".72" = add i32 %".71", 97
  %".73" = trunc i32 %".72" to i8
  %".74" = bitcast [3 x i8]* @".str.2" to i8*
  %".75" = alloca i8
  store i8 %".73", i8* %".75"
  %".77" = load i8, i8* %".75"
  %".78" = call i32 (i8*, ...) @"printf"(i8* %".74", i8 %".77")
  ; printf "%c" f
  ret i32 0
  ;  return 0
}

@".str.0" = internal constant [3 x i8] c"%d\00"
declare i32 @"printf"(i8* %".1", ...)

@".str.1" = internal constant [3 x i8] c"%f\00"
@".str.2" = internal constant [3 x i8] c"%c\00"
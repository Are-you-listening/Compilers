; ModuleID = "tests/test13.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;    INT main
  %".4" = alloca i32, align 4
  store i32 5, i32* %".4", align 4
  ; INT x = 5
  %".7" = bitcast [3 x i8]* @".str.d" to i8*
  %".8" = alloca i32
  store i32 5, i32* %".8"
  %".10" = load i32, i32* %".8"
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".7", i32 %".10")
  ; printf "%d" x
  %".13" = load i32, i32* %".4", align 4
  ; INT z = x + 3
  %".15" = add i32 %".13", 3
  %".16" = alloca i32, align 4
  store i32 %".15", i32* %".16", align 4
  %".18" = load i32, i32* %".16", align 4
  ; printf "%d" z
  %".20" = bitcast [3 x i8]* @".str.d" to i8*
  %".21" = alloca i32
  store i32 %".18", i32* %".21"
  %".23" = load i32, i32* %".21"
  %".24" = call i32 (i8*, ...) @"printf"(i8* %".20", i32 %".23")
  %".25" = load i32, i32* %".16", align 4
  ;  x = z * z * z * x + x
  %".27" = load i32, i32* %".16", align 4
  %".28" = mul i32 %".25", %".27"
  %".29" = load i32, i32* %".16", align 4
  %".30" = mul i32 %".28", %".29"
  %".31" = load i32, i32* %".4", align 4
  %".32" = load i32, i32* %".4", align 4
  %".33" = add i32 %".31", %".32"
  %".34" = mul i32 %".30", %".33"
  store i32 %".34", i32* %".4", align 4
  %".36" = load i32, i32* %".4", align 4
  ; printf "%d" x
  %".38" = bitcast [3 x i8]* @".str.d" to i8*
  %".39" = alloca i32
  store i32 %".36", i32* %".39"
  %".41" = load i32, i32* %".39"
  %".42" = call i32 (i8*, ...) @"printf"(i8* %".38", i32 %".41")
  %".43" = alloca float, align 4
  store float 0x3fef8fde20000000, float* %".43", align 4
  ; FLOAT f = 0.986312
  %".46" = alloca float, align 4
  store float 0x4041462ea0000000, float* %".46", align 4
  ; FLOAT f2 = f * 33.0 + 2.0
  %".49" = bitcast [3 x i8]* @".str.d" to i8*
  %".50" = alloca i32
  store i32 34, i32* %".50"
  %".52" = load i32, i32* %".50"
  %".53" = call i32 (i8*, ...) @"printf"(i8* %".49", i32 %".52")
  ; printf "%d" INT f2
  %".55" = load float, float* %".46", align 4
  ; f2 = f2 + f
  %".57" = load float, float* %".43", align 4
  %".58" = fadd float %".55", %".57"
  store float %".58", float* %".46", align 4
  ; printf "%d" INT f2
  %".61" = load float, float* %".46", align 4
  %".62" = fptosi float %".61" to i32
  %".63" = bitcast [3 x i8]* @".str.d" to i8*
  %".64" = alloca i32
  store i32 %".62", i32* %".64"
  %".66" = load i32, i32* %".64"
  %".67" = call i32 (i8*, ...) @"printf"(i8* %".63", i32 %".66")
  %".68" = alloca i8, align 1
  store i8 97, i8* %".68", align 1
  ; CHAR c = 'a'
  store i8 98, i8* %".68", align 1
  ; c = 'b'
  %".73" = load i8, i8* %".68", align 1
  ; printf "%c" c
  %".75" = bitcast [3 x i8]* @".str.c" to i8*
  %".76" = alloca i8
  store i8 %".73", i8* %".76"
  %".78" = load i8, i8* %".76"
  %".79" = call i32 (i8*, ...) @"printf"(i8* %".75", i8 %".78")
  ret i32 0
  ;  return 0
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"
@".str.c" = internal constant [3 x i8] c"%c\00"
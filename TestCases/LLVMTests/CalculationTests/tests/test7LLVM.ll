; ModuleID = "tests/test7.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;     INT main
  %".4" = alloca i32, align 4
  store i32 5, i32* %".4", align 4
  ; INT x = 5
  %".7" = alloca i32, align 4
  store i32 0, i32* %".7", align 4
  ; INT a = 0
  store i32 1, i32* %".7", align 4
  ; a = 1
  %".12" = load i32, i32* %".4", align 4
  ;   a = x --
  %".14" = sub i32 %".12", 1
  store i32 %".14", i32* %".4", align 4
  store i32 %".12", i32* %".7", align 4
  %".17" = load i32, i32* %".7", align 4
  ; printf "%d" a
  %".19" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".20" = alloca i32
  store i32 %".17", i32* %".20"
  %".22" = load i32, i32* %".20"
  %".23" = call i32 (i8*, ...) @"printf"(i8* %".19", i32 %".22")
  %".24" = load i32, i32* %".4", align 4
  ;  INT z = x --
  %".26" = sub i32 %".24", 1
  store i32 %".26", i32* %".4", align 4
  %".28" = alloca i32, align 4
  store i32 %".24", i32* %".28", align 4
  %".30" = load i32, i32* %".28", align 4
  ; printf "%d" z
  %".32" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".33" = alloca i32
  store i32 %".30", i32* %".33"
  %".35" = load i32, i32* %".33"
  %".36" = call i32 (i8*, ...) @"printf"(i8* %".32", i32 %".35")
  %".37" = load i32, i32* %".4", align 4
  ;  x = x -- + z --
  %".39" = sub i32 %".37", 1
  store i32 %".39", i32* %".4", align 4
  %".41" = load i32, i32* %".28", align 4
  %".42" = sub i32 %".41", 1
  store i32 %".42", i32* %".28", align 4
  %".44" = add i32 %".37", %".41"
  store i32 %".44", i32* %".4", align 4
  %".46" = load i32, i32* %".4", align 4
  ;  printf "%d" x
  %".48" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".49" = alloca i32
  store i32 %".46", i32* %".49"
  %".51" = load i32, i32* %".49"
  %".52" = call i32 (i8*, ...) @"printf"(i8* %".48", i32 %".51")
  %".53" = load i32, i32* %".4", align 4
  ;  a = -- x
  %".55" = sub i32 %".53", 1
  store i32 %".55", i32* %".4", align 4
  store i32 %".55", i32* %".7", align 4
  %".58" = load i32, i32* %".7", align 4
  ;  printf "%d" a
  %".60" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".61" = alloca i32
  store i32 %".58", i32* %".61"
  %".63" = load i32, i32* %".61"
  %".64" = call i32 (i8*, ...) @"printf"(i8* %".60", i32 %".63")
  %".65" = load i32, i32* %".4", align 4
  ; printf "%d" x
  %".67" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".68" = alloca i32
  store i32 %".65", i32* %".68"
  %".70" = load i32, i32* %".68"
  %".71" = call i32 (i8*, ...) @"printf"(i8* %".67", i32 %".70")
  ret i32 0
  ;    return 0
}

declare i32 @"printf"(i8* %".1", ...)

@".str.PS0" = internal constant [3 x i8] c"%d\00"
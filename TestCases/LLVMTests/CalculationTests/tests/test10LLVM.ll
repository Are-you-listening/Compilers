; ModuleID = "tests/test10.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;     INT main
  %".4" = alloca i32, align 4
  store i32 98362, i32* %".4", align 4
  ; INT x = 98362
  %".7" = load i32, i32* %".4", align 4
  ; printf "%d" x
  %".9" = bitcast [3 x i8]* @".str.0" to i8*
  %".10" = alloca i32
  store i32 %".7", i32* %".10"
  %".12" = load i32, i32* %".10"
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".9", i32 %".12")
  %".14" = alloca i32*, align 8
  store i32* %".4", i32** %".14", align 8
  ;  INT * x_ptr = & x
  %".17" = alloca i32**, align 8
  store i32** %".14", i32*** %".17", align 8
  ;  INT * * p = & x_ptr
  %".20" = load i32*, i32** %".14", align 8
  ; printf "%d" * p == x_ptr
  %".22" = load i32*, i32** %".14", align 8
  %".23" = icmp eq i32* %".20", %".22"
  %".24" = bitcast [3 x i8]* @".str.0" to i8*
  %".25" = alloca i1
  store i1 %".23", i1* %".25"
  %".27" = load i1, i1* %".25"
  %".28" = call i32 (i8*, ...) @"printf"(i8* %".24", i1 %".27")
  %".29" = alloca i32*, align 8
  store i32* %".4", i32** %".29", align 8
  ; INT * z = & x
  %".32" = load i32, i32* %".4", align 4
  ; printf "%d" * z == x
  %".34" = load i32, i32* %".4", align 4
  %".35" = icmp eq i32 %".32", %".34"
  %".36" = bitcast [3 x i8]* @".str.0" to i8*
  %".37" = alloca i1
  store i1 %".35", i1* %".37"
  %".39" = load i1, i1* %".37"
  %".40" = call i32 (i8*, ...) @"printf"(i8* %".36", i1 %".39")
  %".41" = alloca float, align 4
  store float 0x408ac20da0000000, float* %".41", align 4
  ;  FLOAT a = 856.25668
  %".44" = alloca float*, align 8
  store float* %".41", float** %".44", align 8
  ; FLOAT * a_ptr = & a
  ;  printf "%d" INT * a_ptr == a
  %".48" = load float, float* %".41", align 4
  %".49" = load float, float* %".41", align 4
  %".50" = fcmp oeq float %".48", %".49"
  %".51" = zext i1 %".50" to i32
  %".52" = bitcast [3 x i8]* @".str.0" to i8*
  %".53" = alloca i32
  store i32 %".51", i32* %".53"
  %".55" = load i32, i32* %".53"
  %".56" = call i32 (i8*, ...) @"printf"(i8* %".52", i32 %".55")
  ret i32 0
  ;  return 0
}

@".str.0" = internal constant [3 x i8] c"%d\00"
declare i32 @"printf"(i8* %".1", ...)

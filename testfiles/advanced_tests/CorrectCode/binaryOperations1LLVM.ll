; ModuleID = "testfiles/advanced_tests/CorrectCode/binaryOperations1.c"
target triple = "unknown-unknown-unknown"
target datalayout = ""

define i32 @"main"()
{
.2:
printf_block:
  %".3" = bitcast [1 x i8]* @".str" to i8*
  %".4" = alloca i32
  store i32 10, i32* %".4"
  %".6" = load i32, i32* %".4"
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".3", i32 %".6")
printf_block.1:
  %".8" = bitcast [1 x i8]* @".str" to i8*
  %".9" = alloca float
  store float 0x4024000000000000, float* %".9"
  %".11" = load float, float* %".9"
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".8", float %".11")
printf_block.2:
  %".13" = bitcast [1 x i8]* @".str" to i8*
  %".14" = alloca i32
  store i32 10, i32* %".14"
  %".16" = load i32, i32* %".14"
  %".17" = call i32 (i8*, ...) @"printf"(i8* %".13", i32 %".16")
printf_block.3:
  %".18" = bitcast [1 x i8]* @".str" to i8*
  %".19" = alloca float
  store float 0x4024000000000000, float* %".19"
  %".21" = load float, float* %".19"
  %".22" = call i32 (i8*, ...) @"printf"(i8* %".18", float %".21")
printf_block.4:
  %".23" = bitcast [1 x i8]* @".str" to i8*
  %".24" = alloca i32
  store i32 10, i32* %".24"
  %".26" = load i32, i32* %".24"
  %".27" = call i32 (i8*, ...) @"printf"(i8* %".23", i32 %".26")
printf_block.5:
  %".28" = bitcast [1 x i8]* @".str" to i8*
  %".29" = alloca float
  store float 0x4024000000000000, float* %".29"
  %".31" = load float, float* %".29"
  %".32" = call i32 (i8*, ...) @"printf"(i8* %".28", float %".31")
printf_block.6:
  %".33" = bitcast [1 x i8]* @".str" to i8*
  %".34" = alloca i32
  store i32 10, i32* %".34"
  %".36" = load i32, i32* %".34"
  %".37" = call i32 (i8*, ...) @"printf"(i8* %".33", i32 %".36")
printf_block.7:
  %".38" = bitcast [1 x i8]* @".str" to i8*
  %".39" = alloca float
  store float 0x4024000000000000, float* %".39"
  %".41" = load float, float* %".39"
  %".42" = call i32 (i8*, ...) @"printf"(i8* %".38", float %".41")
}

declare i32 @"printf"(i8* %".1", ...)

@".str" = internal constant [1 x i8] c""
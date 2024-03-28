; ModuleID = "C:\Users\lucas\PycharmProjects\Compilers\src\llvm_target\LLVMSingleton.py"
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
  %".9" = alloca i32
  store i32 10, i32* %".9"
  %".11" = load i32, i32* %".9"
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".8", i32 %".11")
printf_block.2:
  %".13" = bitcast [1 x i8]* @".str" to i8*
  %".14" = alloca i32
  store i32 10, i32* %".14"
  %".16" = load i32, i32* %".14"
  %".17" = call i32 (i8*, ...) @"printf"(i8* %".13", i32 %".16")
printf_block.3:
  %".18" = bitcast [1 x i8]* @".str" to i8*
  %".19" = alloca i32
  store i32 10, i32* %".19"
  %".21" = load i32, i32* %".19"
  %".22" = call i32 (i8*, ...) @"printf"(i8* %".18", i32 %".21")
}

declare i32 @"printf"(i8* %".1", ...)

@".str" = internal constant [1 x i8] c""
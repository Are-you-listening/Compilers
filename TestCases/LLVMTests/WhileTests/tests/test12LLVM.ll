; ModuleID = "tests/test12.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;  INT main
  %".4" = alloca i32, align 4
  store i32 0, i32* %".4", align 4
  ;  INT k = 0
  store i32 0, i32* %".4", align 4
  ; k = 0
  ; for
  br label %".10"
.10:
  br label %".11"
.11:
  %".12" = load i32, i32* %".4", align 4
  ; printf "%d" k
  %".14" = bitcast [3 x i8]* @".str.0" to i8*
  %".15" = alloca i32
  store i32 %".12", i32* %".15"
  %".17" = load i32, i32* %".15"
  %".18" = call i32 (i8*, ...) @"printf"(i8* %".14", i32 %".17")
  %".19" = load i32, i32* %".4", align 4
  ; k ++
  %".21" = add i32 %".19", 1
  store i32 %".21", i32* %".4", align 4
  %".23" = load i32, i32* %".4", align 4
  ; if k > 10
  %".25" = icmp sgt i32 %".23", 10
  br i1 %".25", label %".26", label %".28"
.26:
  ; break
  br label %".29"
.28:
  br label %".10"
.29:
  ret i32 0
  ;    return 0
}

@"True" = global i32 1, align 4
@".str.0" = internal constant [3 x i8] c"%d\00"
declare i32 @"printf"(i8* %".1", ...)

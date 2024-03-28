; ModuleID = "tests/test13.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 5, i32* %".3", align 4
  ; INT x = 5
  %".6" = bitcast [3 x i8]* @".str.d" to i8*
  %".7" = alloca i32
  store i32 5, i32* %".7"
  %".9" = load i32, i32* %".7"
  %".10" = call i32 (i8*, ...) @"printf"(i8* %".6", i32 %".9")
  ; printf " %d " , x
  %".12" = load i32, i32* %".3", align 4
  ; INT z = x + 3
  %".14" = add i32 %".12", 3
  %".15" = alloca i32, align 4
  store i32 %".14", i32* %".15", align 4
  %".17" = load i32, i32* %".15", align 4
  ; printf " %d " , z
  %".19" = bitcast [3 x i8]* @".str.d" to i8*
  %".20" = alloca i32
  store i32 %".17", i32* %".20"
  %".22" = load i32, i32* %".20"
  %".23" = call i32 (i8*, ...) @"printf"(i8* %".19", i32 %".22")
  %".24" = load i32, i32* %".15", align 4
  ; x = z * z * z * x + x
  %".26" = load i32, i32* %".15", align 4
  %".27" = mul i32 %".24", %".26"
  %".28" = load i32, i32* %".15", align 4
  %".29" = mul i32 %".27", %".28"
  %".30" = load i32, i32* %".3", align 4
  %".31" = load i32, i32* %".3", align 4
  %".32" = add i32 %".30", %".31"
  %".33" = mul i32 %".29", %".32"
  store i32 %".33", i32* %".3", align 4
  %".35" = load i32, i32* %".3", align 4
  ; printf " %d " , x
  %".37" = bitcast [3 x i8]* @".str.d" to i8*
  %".38" = alloca i32
  store i32 %".35", i32* %".38"
  %".40" = load i32, i32* %".38"
  %".41" = call i32 (i8*, ...) @"printf"(i8* %".37", i32 %".40")
  %".42" = alloca float, align 4
  store float 0x3fef8fde20000000, float* %".42", align 4
  ; FLOAT f = 0.986312
  %".45" = alloca float, align 4
  store float 0x4041462ea0000000, float* %".45", align 4
  ; FLOAT f2 = f * 33.0 + 2.0
  %".48" = bitcast [3 x i8]* @".str.d" to i8*
  %".49" = alloca i32
  store i32 34, i32* %".49"
  %".51" = load i32, i32* %".49"
  %".52" = call i32 (i8*, ...) @"printf"(i8* %".48", i32 %".51")
  ; printf " %d " , INT f2
  %".54" = load float, float* %".45", align 4
  ; f2 = f2 + f
  %".56" = load float, float* %".42", align 4
  %".57" = fadd float %".54", %".56"
  store float %".57", float* %".45", align 4
  ; printf " %d " , INT f2
  %".60" = load float, float* %".45", align 4
  %".61" = fptosi float %".60" to i32
  %".62" = bitcast [3 x i8]* @".str.d" to i8*
  %".63" = alloca i32
  store i32 %".61", i32* %".63"
  %".65" = load i32, i32* %".63"
  %".66" = call i32 (i8*, ...) @"printf"(i8* %".62", i32 %".65")
  %".67" = alloca i8, align 1
  store i8 97, i8* %".67", align 1
  ; CHAR c = 'a'
  store i8 98, i8* %".67", align 1
  ; c = 'b'
  %".72" = load i8, i8* %".67", align 1
  ; printf " %c " , c
  %".74" = bitcast [3 x i8]* @".str.c" to i8*
  %".75" = alloca i8
  store i8 %".72", i8* %".75"
  %".77" = load i8, i8* %".75"
  %".78" = call i32 (i8*, ...) @"printf"(i8* %".74", i8 %".77")
  ret i32 0
  ; INT main
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"
@".str.c" = internal constant [3 x i8] c"%c\00"
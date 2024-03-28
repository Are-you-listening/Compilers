; ModuleID = "example_source_files/test7.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 5, i32* %".3", align 4
  ; INT b = CHAR 5
  %".6" = alloca float, align 4
  store float 0x4014000000000000, float* %".6", align 4
  ; FLOAT a = b
  %".9" = alloca i32, align 4
  store i32 5, i32* %".9", align 4
  ; INT c = 5.5
  %".12" = alloca i8, align 1
  store i8 5, i8* %".12", align 1
  ; const CHAR d = const CHAR c
  %".15" = load i32, i32* %".3", align 4
  ; CHAR e = b + 3.5
  %".17" = sitofp i32 %".15" to float
  %".18" = fadd float %".17", 0x400c000000000000
  %".19" = zext float %".18" to i8
  %".20" = alloca i8, align 1
  store i8 %".19", i8* %".20", align 1
  ; CHAR f = INT e + 'a'
  %".23" = load i32, i32* %".3", align 4
  %".24" = sitofp i32 %".23" to float
  %".25" = fadd float %".24", 0x400c000000000000
  %".26" = zext float %".25" to i8
  %".27" = zext i8 %".26" to i32
  %".28" = add i32 %".27", 97
  %".29" = trunc i32 %".28" to i8
  %".30" = alloca i8, align 1
  store i8 %".29", i8* %".30", align 1
  %".32" = load i32, i32* %".3", align 4
  ; printf " %d " , b
  %".34" = bitcast [3 x i8]* @".str.d" to i8*
  %".35" = alloca i32
  store i32 %".32", i32* %".35"
  %".37" = load i32, i32* %".35"
  %".38" = call i32 (i8*, ...) @"printf"(i8* %".34", i32 %".37")
  %".39" = bitcast [3 x i8]* @".str.f" to i8*
  %".40" = alloca float
  store float 0x4014000000000000, float* %".40"
  %".42" = load float, float* %".40"
  %".43" = fpext float %".42" to double
  %".44" = call i32 (i8*, ...) @"printf"(i8* %".39", double %".43")
  ; printf " %f " , a
  %".46" = load i32, i32* %".9", align 4
  ; printf " %d " , c
  %".48" = bitcast [3 x i8]* @".str.d" to i8*
  %".49" = alloca i32
  store i32 %".46", i32* %".49"
  %".51" = load i32, i32* %".49"
  %".52" = call i32 (i8*, ...) @"printf"(i8* %".48", i32 %".51")
  %".53" = bitcast [3 x i8]* @".str.c" to i8*
  %".54" = alloca i8
  store i8 5, i8* %".54"
  %".56" = load i8, i8* %".54"
  %".57" = call i32 (i8*, ...) @"printf"(i8* %".53", i8 %".56")
  ; printf " %c " , d
  %".59" = load i8, i8* %".20", align 1
  ; printf " %c " , e
  %".61" = bitcast [3 x i8]* @".str.c" to i8*
  %".62" = alloca i8
  store i8 %".59", i8* %".62"
  %".64" = load i8, i8* %".62"
  %".65" = call i32 (i8*, ...) @"printf"(i8* %".61", i8 %".64")
  %".66" = load i32, i32* %".3", align 4
  %".67" = sitofp i32 %".66" to float
  %".68" = fadd float %".67", 0x400c000000000000
  %".69" = zext float %".68" to i8
  %".70" = zext i8 %".69" to i32
  %".71" = add i32 %".70", 97
  %".72" = trunc i32 %".71" to i8
  %".73" = bitcast [3 x i8]* @".str.c" to i8*
  %".74" = alloca i8
  store i8 %".72", i8* %".74"
  %".76" = load i8, i8* %".74"
  %".77" = call i32 (i8*, ...) @"printf"(i8* %".73", i8 %".76")
  ; printf " %c " , f
  ret i32 0
  ; INT main
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"
@".str.f" = internal constant [3 x i8] c"%f\00"
@".str.c" = internal constant [3 x i8] c"%c\00"
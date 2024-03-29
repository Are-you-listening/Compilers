; ModuleID = "tests/test6.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ; comment 1
  %".4" = alloca i8, align 1
  store i8 97, i8* %".4", align 1
  ; CHAR a = 'a'
  %".7" = alloca i32, align 4
  store i32 1, i32* %".7", align 4
  ; INT b = 1
  %".10" = alloca float, align 4
  store float 0x4016666660000000, float* %".10", align 4
  ; FLOAT c = 5.6
  %".13" = load i8, i8* %".4", align 1
  ; const CHAR d = a
  %".15" = alloca i8, align 1
  store i8 %".13", i8* %".15", align 1
  %".17" = load i8, i8* %".15", align 1
  ; printf " %c " , d
  %".19" = bitcast [3 x i8]* @".str.c" to i8*
  %".20" = alloca i8
  store i8 %".17", i8* %".20"
  %".22" = load i8, i8* %".20"
  %".23" = call i32 (i8*, ...) @"printf"(i8* %".19", i8 %".22")
  %".24" = load i8, i8* %".15", align 1
  ; const INT e = d
  %".26" = zext i8 %".24" to i32
  %".27" = alloca i32, align 4
  store i32 %".26", i32* %".27", align 4
  %".29" = load i8, i8* %".15", align 1
  %".30" = zext i8 %".29" to i32
  %".31" = bitcast [3 x i8]* @".str.d" to i8*
  %".32" = alloca i32
  store i32 %".30", i32* %".32"
  %".34" = load i32, i32* %".32"
  %".35" = call i32 (i8*, ...) @"printf"(i8* %".31", i32 %".34")
  ; printf " %d " , e
  %".37" = load i8, i8* %".15", align 1
  %".38" = zext i8 %".37" to i32
  %".39" = sitofp i32 %".38" to float
  ; const FLOAT f = e
  %".41" = alloca float, align 4
  store float %".39", float* %".41", align 4
  %".43" = load i8, i8* %".15", align 1
  %".44" = zext i8 %".43" to i32
  %".45" = sitofp i32 %".44" to float
  %".46" = bitcast [3 x i8]* @".str.f" to i8*
  %".47" = alloca float
  store float %".45", float* %".47"
  %".49" = load float, float* %".47"
  %".50" = fpext float %".49" to double
  %".51" = call i32 (i8*, ...) @"printf"(i8* %".46", double %".50")
  ; printf " %f " , f
  %".53" = alloca i8*, align 8
  store i8* %".4", i8** %".53", align 8
  ; CHAR * g = & a
  %".56" = load i8, i8* %".4", align 1
  ; printf " %c " , * g
  %".58" = bitcast [3 x i8]* @".str.c" to i8*
  %".59" = alloca i8
  store i8 %".56", i8* %".59"
  %".61" = load i8, i8* %".59"
  %".62" = call i32 (i8*, ...) @"printf"(i8* %".58", i8 %".61")
  %".63" = alloca i32*, align 8
  store i32* %".7", i32** %".63", align 8
  ; INT * h = & b
  %".66" = load i32, i32* %".7", align 4
  ; printf " %d " , * h
  %".68" = bitcast [3 x i8]* @".str.d" to i8*
  %".69" = alloca i32
  store i32 %".66", i32* %".69"
  %".71" = load i32, i32* %".69"
  %".72" = call i32 (i8*, ...) @"printf"(i8* %".68", i32 %".71")
  %".73" = alloca float*, align 8
  store float* %".10", float** %".73", align 8
  ; FLOAT * i = & c
  %".76" = load float, float* %".10", align 4
  ; printf " %f " , * i
  %".78" = bitcast [3 x i8]* @".str.f" to i8*
  %".79" = alloca float
  store float %".76", float* %".79"
  %".81" = load float, float* %".79"
  %".82" = fpext float %".81" to double
  %".83" = call i32 (i8*, ...) @"printf"(i8* %".78", double %".82")
  %".84" = load i32*, i32** %".63", align 8
  ; h ++
  %".86" = getelementptr inbounds i32, i32* %".84", i64 1
  store i32* %".86", i32** %".63", align 8
  %".88" = load i32*, i32** %".63", align 8
  ; printf " %d " , * h
  %".90" = load i32, i32* %".88", align 8
  %".91" = bitcast [3 x i8]* @".str.d" to i8*
  %".92" = alloca i32
  store i32 %".90", i32* %".92"
  %".94" = load i32, i32* %".92"
  %".95" = call i32 (i8*, ...) @"printf"(i8* %".91", i32 %".94")
  %".96" = load i32*, i32** %".63", align 8
  ; h --
  %".98" = sub i64 0, 1
  %".99" = getelementptr inbounds i32, i32* %".96", i64 %".98"
  store i32* %".99", i32** %".63", align 8
  %".101" = load i32*, i32** %".63", align 8
  ; printf " %d " , * h
  %".103" = load i32, i32* %".101", align 8
  %".104" = bitcast [3 x i8]* @".str.d" to i8*
  %".105" = alloca i32
  store i32 %".103", i32* %".105"
  %".107" = load i32, i32* %".105"
  %".108" = call i32 (i8*, ...) @"printf"(i8* %".104", i32 %".107")
  %".109" = inttoptr i32 0 to i32*
  ; h = 0
  store i32* %".109", i32** %".63", align 8
  ;     Here is comment 2
  %".113" = alloca i8, align 1
  ; CHAR j
  %".115" = alloca i32, align 4
  ; INT m
  %".117" = alloca float, align 4
  ; FLOAT k
  %".119" = load i8*, i8** %".53", align 8
  ; CHAR l = * g
  %".121" = load i8, i8* %".119", align 8
  %".122" = alloca i8, align 1
  store i8 %".121", i8* %".122", align 1
  %".124" = load i8, i8* %".122", align 1
  ; printf " %c " , l
  %".126" = bitcast [3 x i8]* @".str.c" to i8*
  %".127" = alloca i8
  store i8 %".124", i8* %".127"
  %".129" = load i8, i8* %".127"
  %".130" = call i32 (i8*, ...) @"printf"(i8* %".126", i8 %".129")
  %".131" = load i8, i8* %".122", align 1
  ; l ++
  %".133" = add i8 %".131", 1
  store i8 %".133", i8* %".122", align 1
  %".135" = load i8, i8* %".122", align 1
  ; printf " %c " , l
  %".137" = bitcast [3 x i8]* @".str.c" to i8*
  %".138" = alloca i8
  store i8 %".135", i8* %".138"
  %".140" = load i8, i8* %".138"
  %".141" = call i32 (i8*, ...) @"printf"(i8* %".137", i8 %".140")
  %".142" = load i8, i8* %".122", align 1
  ; l --
  %".144" = sub i8 %".142", 1
  store i8 %".144", i8* %".122", align 1
  %".146" = load i8, i8* %".122", align 1
  ; printf " %c " , l
  %".148" = bitcast [3 x i8]* @".str.c" to i8*
  %".149" = alloca i8
  store i8 %".146", i8* %".149"
  %".151" = load i8, i8* %".149"
  %".152" = call i32 (i8*, ...) @"printf"(i8* %".148", i8 %".151")
  ret i32 0
  ; INT main
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.c" = internal constant [3 x i8] c"%c\00"
@".str.d" = internal constant [3 x i8] c"%d\00"
@".str.f" = internal constant [3 x i8] c"%f\00"
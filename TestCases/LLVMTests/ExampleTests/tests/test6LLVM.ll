; ModuleID = "tests/test6.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ; INT main
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
  ; printf "%c" , d
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
  ; printf "%d" , e
  %".37" = load i8, i8* %".15", align 1
  %".38" = zext i8 %".37" to i32
  %".39" = sitofp i32 %".38" to float
  ; const FLOAT f = e
  %".41" = alloca float, align 4
  store float %".39", float* %".41", align 4
  %".43" = alloca i8*, align 8
  store i8* %".4", i8** %".43", align 8
  ; CHAR * g = & a
  %".46" = load i8, i8* %".4", align 1
  ; printf "%c" , * g
  %".48" = bitcast [3 x i8]* @".str.c" to i8*
  %".49" = alloca i8
  store i8 %".46", i8* %".49"
  %".51" = load i8, i8* %".49"
  %".52" = call i32 (i8*, ...) @"printf"(i8* %".48", i8 %".51")
  %".53" = alloca i32*, align 8
  store i32* %".7", i32** %".53", align 8
  ; INT * h = & b
  %".56" = load i32, i32* %".7", align 4
  ; printf "%d" , * h
  %".58" = bitcast [3 x i8]* @".str.d" to i8*
  %".59" = alloca i32
  store i32 %".56", i32* %".59"
  %".61" = load i32, i32* %".59"
  %".62" = call i32 (i8*, ...) @"printf"(i8* %".58", i32 %".61")
  %".63" = alloca float*, align 8
  store float* %".10", float** %".63", align 8
  ; FLOAT * i = & c
  %".66" = load i32*, i32** %".53", align 8
  ; h ++
  %".68" = getelementptr inbounds i32, i32* %".66", i64 1
  store i32* %".68", i32** %".53", align 8
  %".70" = load i32*, i32** %".53", align 8
  ; printf "%d" , * h
  %".72" = load i32, i32* %".70", align 8
  %".73" = bitcast [3 x i8]* @".str.d" to i8*
  %".74" = alloca i32
  store i32 %".72", i32* %".74"
  %".76" = load i32, i32* %".74"
  %".77" = call i32 (i8*, ...) @"printf"(i8* %".73", i32 %".76")
  %".78" = load i32*, i32** %".53", align 8
  ; h --
  %".80" = sub i64 0, 1
  %".81" = getelementptr inbounds i32, i32* %".78", i64 %".80"
  store i32* %".81", i32** %".53", align 8
  %".83" = load i32*, i32** %".53", align 8
  ; printf "%d" , * h
  %".85" = load i32, i32* %".83", align 8
  %".86" = bitcast [3 x i8]* @".str.d" to i8*
  %".87" = alloca i32
  store i32 %".85", i32* %".87"
  %".89" = load i32, i32* %".87"
  %".90" = call i32 (i8*, ...) @"printf"(i8* %".86", i32 %".89")
  %".91" = inttoptr i32 0 to i32*
  ; h = 0
  store i32* %".91", i32** %".53", align 8
  ;     Here is comment 2
  %".95" = alloca i8, align 1
  ; CHAR j
  %".97" = alloca i32, align 4
  ; INT m
  %".99" = alloca float, align 4
  ; FLOAT k
  %".101" = load i8*, i8** %".43", align 8
  ; CHAR l = * g
  %".103" = load i8, i8* %".101", align 8
  %".104" = alloca i8, align 1
  store i8 %".103", i8* %".104", align 1
  %".106" = load i8, i8* %".104", align 1
  ; printf "%c" , l
  %".108" = bitcast [3 x i8]* @".str.c" to i8*
  %".109" = alloca i8
  store i8 %".106", i8* %".109"
  %".111" = load i8, i8* %".109"
  %".112" = call i32 (i8*, ...) @"printf"(i8* %".108", i8 %".111")
  %".113" = load i8, i8* %".104", align 1
  ; l ++
  %".115" = add i8 %".113", 1
  store i8 %".115", i8* %".104", align 1
  %".117" = load i8, i8* %".104", align 1
  ; printf "%c" , l
  %".119" = bitcast [3 x i8]* @".str.c" to i8*
  %".120" = alloca i8
  store i8 %".117", i8* %".120"
  %".122" = load i8, i8* %".120"
  %".123" = call i32 (i8*, ...) @"printf"(i8* %".119", i8 %".122")
  %".124" = load i8, i8* %".104", align 1
  ; l --
  %".126" = sub i8 %".124", 1
  store i8 %".126", i8* %".104", align 1
  %".128" = load i8, i8* %".104", align 1
  ; printf "%c" , l
  %".130" = bitcast [3 x i8]* @".str.c" to i8*
  %".131" = alloca i8
  store i8 %".128", i8* %".131"
  %".133" = load i8, i8* %".131"
  %".134" = call i32 (i8*, ...) @"printf"(i8* %".130", i8 %".133")
  ret i32 0
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.c" = internal constant [3 x i8] c"%c\00"
@".str.d" = internal constant [3 x i8] c"%d\00"
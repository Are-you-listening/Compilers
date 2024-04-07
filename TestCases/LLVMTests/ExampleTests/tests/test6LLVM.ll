; ModuleID = "tests/test6.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i8, align 1
  store i8 97, i8* %".3", align 1
  ; CHAR a = 'a'
  %".6" = alloca i32, align 4
  store i32 1, i32* %".6", align 4
  ; INT b = 1
  %".9" = alloca float, align 4
  store float 0x4016666660000000, float* %".9", align 4
  ; FLOAT c = 5.6
  %".12" = load i8, i8* %".3", align 1
  ; const CHAR d = a
  %".14" = alloca i8, align 1
  store i8 %".12", i8* %".14", align 1
  %".16" = load i8, i8* %".14", align 1
  ; printf "%c" d
  %".18" = bitcast [3 x i8]* @".str.c" to i8*
  %".19" = alloca i8
  store i8 %".16", i8* %".19"
  %".21" = load i8, i8* %".19"
  %".22" = call i32 (i8*, ...) @"printf"(i8* %".18", i8 %".21")
  %".23" = load i8, i8* %".14", align 1
  ; const INT e = d
  %".25" = zext i8 %".23" to i32
  %".26" = alloca i32, align 4
  store i32 %".25", i32* %".26", align 4
  %".28" = load i8, i8* %".14", align 1
  %".29" = zext i8 %".28" to i32
  %".30" = bitcast [3 x i8]* @".str.d" to i8*
  %".31" = alloca i32
  store i32 %".29", i32* %".31"
  %".33" = load i32, i32* %".31"
  %".34" = call i32 (i8*, ...) @"printf"(i8* %".30", i32 %".33")
  ; printf "%d" e
  %".36" = load i8, i8* %".14", align 1
  %".37" = zext i8 %".36" to i32
  %".38" = sitofp i32 %".37" to float
  ; const FLOAT f = e
  %".40" = alloca float, align 4
  store float %".38", float* %".40", align 4
  %".42" = alloca i8*, align 8
  store i8* %".3", i8** %".42", align 8
  ; CHAR * g = & a
  %".45" = load i8, i8* %".3", align 1
  ; printf "%c" * g
  %".47" = bitcast [3 x i8]* @".str.c" to i8*
  %".48" = alloca i8
  store i8 %".45", i8* %".48"
  %".50" = load i8, i8* %".48"
  %".51" = call i32 (i8*, ...) @"printf"(i8* %".47", i8 %".50")
  %".52" = alloca i32*, align 8
  store i32* %".6", i32** %".52", align 8
  ; INT * h = & b
  %".55" = load i32, i32* %".6", align 4
  ; printf "%d" * h
  %".57" = bitcast [3 x i8]* @".str.d" to i8*
  %".58" = alloca i32
  store i32 %".55", i32* %".58"
  %".60" = load i32, i32* %".58"
  %".61" = call i32 (i8*, ...) @"printf"(i8* %".57", i32 %".60")
  %".62" = alloca float*, align 8
  store float* %".9", float** %".62", align 8
  ; FLOAT * i = & c
  %".65" = load i32*, i32** %".52", align 8
  ; h ++
  %".67" = getelementptr inbounds i32, i32* %".65", i64 1
  store i32* %".67", i32** %".52", align 8
  %".69" = load i32*, i32** %".52", align 8
  ; printf "%d" * h
  %".71" = load i32, i32* %".69", align 8
  %".72" = bitcast [3 x i8]* @".str.d" to i8*
  %".73" = alloca i32
  store i32 %".71", i32* %".73"
  %".75" = load i32, i32* %".73"
  %".76" = call i32 (i8*, ...) @"printf"(i8* %".72", i32 %".75")
  %".77" = load i32*, i32** %".52", align 8
  ; h --
  %".79" = sub i64 0, 1
  %".80" = getelementptr inbounds i32, i32* %".77", i64 %".79"
  store i32* %".80", i32** %".52", align 8
  %".82" = load i32*, i32** %".52", align 8
  ; printf "%d" * h
  %".84" = load i32, i32* %".82", align 8
  %".85" = bitcast [3 x i8]* @".str.d" to i8*
  %".86" = alloca i32
  store i32 %".84", i32* %".86"
  %".88" = load i32, i32* %".86"
  %".89" = call i32 (i8*, ...) @"printf"(i8* %".85", i32 %".88")
  %".90" = inttoptr i32 0 to i32*
  ; h = 0
  store i32* %".90", i32** %".52", align 8
  ;     Here is comment 2
  %".94" = alloca i8, align 1
  ; CHAR j
  %".96" = alloca i32, align 4
  ; INT m
  %".98" = alloca float, align 4
  ; FLOAT k
  %".100" = load i8*, i8** %".42", align 8
  ; CHAR l = * g
  %".102" = load i8, i8* %".100", align 8
  %".103" = alloca i8, align 1
  store i8 %".102", i8* %".103", align 1
  %".105" = load i8, i8* %".103", align 1
  ; printf "%c" l
  %".107" = bitcast [3 x i8]* @".str.c" to i8*
  %".108" = alloca i8
  store i8 %".105", i8* %".108"
  %".110" = load i8, i8* %".108"
  %".111" = call i32 (i8*, ...) @"printf"(i8* %".107", i8 %".110")
  %".112" = load i8, i8* %".103", align 1
  ; l ++
  %".114" = add i8 %".112", 1
  store i8 %".114", i8* %".103", align 1
  %".116" = load i8, i8* %".103", align 1
  ; printf "%c" l
  %".118" = bitcast [3 x i8]* @".str.c" to i8*
  %".119" = alloca i8
  store i8 %".116", i8* %".119"
  %".121" = load i8, i8* %".119"
  %".122" = call i32 (i8*, ...) @"printf"(i8* %".118", i8 %".121")
  %".123" = load i8, i8* %".103", align 1
  ; l --
  %".125" = sub i8 %".123", 1
  store i8 %".125", i8* %".103", align 1
  %".127" = load i8, i8* %".103", align 1
  ; printf "%c" l
  %".129" = bitcast [3 x i8]* @".str.c" to i8*
  %".130" = alloca i8
  store i8 %".127", i8* %".130"
  %".132" = load i8, i8* %".130"
  %".133" = call i32 (i8*, ...) @"printf"(i8* %".129", i8 %".132")
  ret i32 0
  ; INT main
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.c" = internal constant [3 x i8] c"%c\00"
@".str.d" = internal constant [3 x i8] c"%d\00"
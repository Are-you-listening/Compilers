; ModuleID = "tests/test6.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;    INT main
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
  ;  const CHAR d = a
  %".15" = alloca i8, align 1
  store i8 %".13", i8* %".15", align 1
  %".17" = load i8, i8* %".15", align 1
  ; printf "%c" d
  %".19" = bitcast [3 x i8]* @".str.0" to i8*
  %".20" = alloca i8
  store i8 %".17", i8* %".20"
  %".22" = load i8, i8* %".20"
  %".23" = call i32 (i8*, ...) @"printf"(i8* %".19", i8 %".22")
  ; const INT e = d
  %".25" = load i8, i8* %".15", align 1
  %".26" = zext i8 %".25" to i32
  %".27" = alloca i32, align 4
  store i32 %".26", i32* %".27", align 4
  %".29" = load i8, i8* %".15", align 1
  %".30" = zext i8 %".29" to i32
  %".31" = bitcast [3 x i8]* @".str.1" to i8*
  %".32" = alloca i32
  store i32 %".30", i32* %".32"
  %".34" = load i32, i32* %".32"
  %".35" = call i32 (i8*, ...) @"printf"(i8* %".31", i32 %".34")
  ; printf "%d" e
  ; const FLOAT f = e
  %".38" = load i8, i8* %".15", align 1
  %".39" = zext i8 %".38" to i32
  %".40" = sitofp i32 %".39" to float
  %".41" = alloca float, align 4
  store float %".40", float* %".41", align 4
  %".43" = alloca i8*, align 8
  store i8* %".4", i8** %".43", align 8
  ;   CHAR * g = & a
  %".46" = load i8, i8* %".4", align 1
  ; printf "%c" * g
  %".48" = bitcast [3 x i8]* @".str.0" to i8*
  %".49" = alloca i8
  store i8 %".46", i8* %".49"
  %".51" = load i8, i8* %".49"
  %".52" = call i32 (i8*, ...) @"printf"(i8* %".48", i8 %".51")
  %".53" = alloca i32*, align 8
  store i32* %".7", i32** %".53", align 8
  ; INT * h = & b
  %".56" = load i32, i32* %".7", align 4
  ; printf "%d" * h
  %".58" = bitcast [3 x i8]* @".str.1" to i8*
  %".59" = alloca i32
  store i32 %".56", i32* %".59"
  %".61" = load i32, i32* %".59"
  %".62" = call i32 (i8*, ...) @"printf"(i8* %".58", i32 %".61")
  %".63" = alloca float*, align 8
  store float* %".10", float** %".63", align 8
  ; FLOAT * i = & c
  %".66" = load i32*, i32** %".53", align 8
  ;  h ++
  %".68" = getelementptr inbounds i32, i32* %".66", i64 1
  store i32* %".68", i32** %".53", align 8
  %".70" = load i32*, i32** %".53", align 8
  ; printf "%d" * h
  %".72" = load i32, i32* %".70", align 8
  %".73" = bitcast [3 x i8]* @".str.1" to i8*
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
  ; printf "%d" * h
  %".85" = load i32, i32* %".83", align 8
  %".86" = bitcast [3 x i8]* @".str.1" to i8*
  %".87" = alloca i32
  store i32 %".85", i32* %".87"
  %".89" = load i32, i32* %".87"
  %".90" = call i32 (i8*, ...) @"printf"(i8* %".86", i32 %".89")
  ; h = 0
  %".92" = inttoptr i32 0 to i32*
  store i32* %".92", i32** %".53", align 8
  ;     Here is comment 2
  ;
  %".96" = alloca i8, align 1
  ;    CHAR j
  %".98" = alloca i32, align 4
  ; INT m
  %".100" = alloca float, align 4
  ; FLOAT k
  %".102" = load i8*, i8** %".43", align 8
  ;  CHAR l = * g
  %".104" = load i8, i8* %".102", align 8
  %".105" = alloca i8, align 1
  store i8 %".104", i8* %".105", align 1
  %".107" = load i8, i8* %".105", align 1
  ; printf "%c" l
  %".109" = bitcast [3 x i8]* @".str.0" to i8*
  %".110" = alloca i8
  store i8 %".107", i8* %".110"
  %".112" = load i8, i8* %".110"
  %".113" = call i32 (i8*, ...) @"printf"(i8* %".109", i8 %".112")
  %".114" = load i8, i8* %".105", align 1
  ; l ++
  %".116" = add i8 %".114", 1
  store i8 %".116", i8* %".105", align 1
  %".118" = load i8, i8* %".105", align 1
  ; printf "%c" l
  %".120" = bitcast [3 x i8]* @".str.0" to i8*
  %".121" = alloca i8
  store i8 %".118", i8* %".121"
  %".123" = load i8, i8* %".121"
  %".124" = call i32 (i8*, ...) @"printf"(i8* %".120", i8 %".123")
  %".125" = load i8, i8* %".105", align 1
  ; l --
  %".127" = sub i8 %".125", 1
  store i8 %".127", i8* %".105", align 1
  %".129" = load i8, i8* %".105", align 1
  ; printf "%c" l
  %".131" = bitcast [3 x i8]* @".str.0" to i8*
  %".132" = alloca i8
  store i8 %".129", i8* %".132"
  %".134" = load i8, i8* %".132"
  %".135" = call i32 (i8*, ...) @"printf"(i8* %".131", i8 %".134")
  ret i32 0
  ;   return 0
}

@".str.0" = internal constant [3 x i8] c"%c\00"
declare i32 @"printf"(i8* %".1", ...)

@".str.1" = internal constant [3 x i8] c"%d\00"
; ModuleID = "tests/test6.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;     INT main
  %".4" = alloca i32, align 4
  store i32 4, i32* %".4", align 4
  ; INT x = 4
  %".7" = alloca i32, align 4
  store i32 5, i32* %".7", align 4
  ; INT y = 5
  %".10" = alloca i32, align 4
  store i32 9, i32* %".10", align 4
  ; INT a = 9
  %".13" = alloca i32*, align 8
  store i32* %".4", i32** %".13", align 8
  ; INT * ptr = & x
  %".16" = load i32*, i32** %".13", align 8
  ; ptr ++
  %".18" = getelementptr inbounds i32, i32* %".16", i64 1
  store i32* %".18", i32** %".13", align 8
  %".20" = load i32*, i32** %".13", align 8
  ; ptr --
  %".22" = sub i64 0, 1
  %".23" = getelementptr inbounds i32, i32* %".20", i64 %".22"
  store i32* %".23", i32** %".13", align 8
  ;  INT is_x = ptr == & x
  %".26" = load i32*, i32** %".13", align 8
  %".27" = icmp eq i32* %".26", %".4"
  %".28" = zext i1 %".27" to i32
  %".29" = alloca i32, align 4
  store i32 %".28", i32* %".29", align 4
  %".31" = load i32*, i32** %".13", align 8
  %".32" = icmp eq i32* %".31", %".4"
  %".33" = zext i1 %".32" to i32
  %".34" = bitcast [3 x i8]* @".str.d" to i8*
  %".35" = alloca i32
  store i32 %".33", i32* %".35"
  %".37" = load i32, i32* %".35"
  %".38" = call i32 (i8*, ...) @"printf"(i8* %".34", i32 %".37")
  ; printf "%d" is_x
  ; INT is_y = ptr == & y
  %".41" = load i32*, i32** %".13", align 8
  %".42" = icmp eq i32* %".41", %".7"
  %".43" = zext i1 %".42" to i32
  %".44" = alloca i32, align 4
  store i32 %".43", i32* %".44", align 4
  %".46" = load i32*, i32** %".13", align 8
  %".47" = icmp eq i32* %".46", %".7"
  %".48" = zext i1 %".47" to i32
  %".49" = bitcast [3 x i8]* @".str.d" to i8*
  %".50" = alloca i32
  store i32 %".48", i32* %".50"
  %".52" = load i32, i32* %".50"
  %".53" = call i32 (i8*, ...) @"printf"(i8* %".49", i32 %".52")
  ; printf "%d" is_y
  ; is_y = & x != ptr
  %".56" = load i32*, i32** %".13", align 8
  %".57" = icmp ne i32* %".4", %".56"
  %".58" = zext i1 %".57" to i32
  store i32 %".58", i32* %".44", align 4
  %".60" = load i32, i32* %".44", align 4
  ; printf "%d" is_y
  %".62" = bitcast [3 x i8]* @".str.d" to i8*
  %".63" = alloca i32
  store i32 %".60", i32* %".63"
  %".65" = load i32, i32* %".63"
  %".66" = call i32 (i8*, ...) @"printf"(i8* %".62", i32 %".65")
  ; FLOAT * ptr2 = 0
  %".68" = inttoptr i32 0 to float*
  %".69" = alloca float*, align 8
  store float* %".68", float** %".69", align 8
  %".71" = inttoptr i32 0 to float*
  %".72" = bitcast [3 x i8]* @".str.d" to i8*
  %".73" = alloca float*
  store float* %".71", float** %".73"
  %".75" = load float*, float** %".73"
  %".76" = call i32 (i8*, ...) @"printf"(i8* %".72", float* %".75")
  ; printf "%d" ptr2
  ret i32 0
  ; return 0
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"
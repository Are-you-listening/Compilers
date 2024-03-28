; ModuleID = "tests/test6.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 4, i32* %".3", align 4
  ; INT x = 4
  %".6" = alloca i32, align 4
  store i32 5, i32* %".6", align 4
  ; INT y = 5
  %".9" = alloca i32, align 4
  store i32 9, i32* %".9", align 4
  ; INT a = 9
  %".12" = alloca i32*, align 8
  store i32* %".3", i32** %".12", align 8
  ; INT * ptr = & x
  %".15" = load i32*, i32** %".12", align 8
  ; ptr ++
  %".17" = getelementptr inbounds i32, i32* %".15", i64 1
  store i32* %".17", i32** %".12", align 8
  %".19" = load i32*, i32** %".12", align 8
  ; ptr --
  %".21" = sub i64 0, 1
  %".22" = getelementptr inbounds i32, i32* %".19", i64 %".21"
  store i32* %".22", i32** %".12", align 8
  %".24" = load i32*, i32** %".12", align 8
  ; INT is_x = ptr == & x
  %".26" = icmp eq i32* %".24", %".3"
  %".27" = zext i1 %".26" to i32
  %".28" = alloca i32, align 4
  store i32 %".27", i32* %".28", align 4
  %".30" = load i32*, i32** %".12", align 8
  %".31" = icmp eq i32* %".30", %".3"
  %".32" = zext i1 %".31" to i32
  %".33" = bitcast [3 x i8]* @".str.d" to i8*
  %".34" = alloca i32
  store i32 %".32", i32* %".34"
  %".36" = load i32, i32* %".34"
  %".37" = call i32 (i8*, ...) @"printf"(i8* %".33", i32 %".36")
  ; printf " %d " , is_x
  %".39" = load i32*, i32** %".12", align 8
  ; INT is_y = ptr == & y
  %".41" = icmp eq i32* %".39", %".6"
  %".42" = zext i1 %".41" to i32
  %".43" = alloca i32, align 4
  store i32 %".42", i32* %".43", align 4
  %".45" = load i32*, i32** %".12", align 8
  %".46" = icmp eq i32* %".45", %".6"
  %".47" = zext i1 %".46" to i32
  %".48" = bitcast [3 x i8]* @".str.d" to i8*
  %".49" = alloca i32
  store i32 %".47", i32* %".49"
  %".51" = load i32, i32* %".49"
  %".52" = call i32 (i8*, ...) @"printf"(i8* %".48", i32 %".51")
  ; printf " %d " , is_y
  %".54" = load i32*, i32** %".12", align 8
  ; is_y = & x != ptr
  %".56" = icmp ne i32* %".3", %".54"
  %".57" = zext i1 %".56" to i32
  store i32 %".57", i32* %".43", align 4
  %".59" = load i32, i32* %".43", align 4
  ; printf " %d " , is_y
  %".61" = bitcast [3 x i8]* @".str.d" to i8*
  %".62" = alloca i32
  store i32 %".59", i32* %".62"
  %".64" = load i32, i32* %".62"
  %".65" = call i32 (i8*, ...) @"printf"(i8* %".61", i32 %".64")
  %".66" = inttoptr i32 0 to float*
  ; FLOAT * ptr2 = 0
  %".68" = alloca float*, align 8
  store float* %".66", float** %".68", align 8
  %".70" = inttoptr i32 0 to float*
  %".71" = bitcast [3 x i8]* @".str.d" to i8*
  %".72" = alloca float*
  store float* %".70", float** %".72"
  %".74" = load float*, float** %".72"
  %".75" = call i32 (i8*, ...) @"printf"(i8* %".71", float* %".74")
  ; printf " %d " , ptr2
  ret i32 0
  ; INT main
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"
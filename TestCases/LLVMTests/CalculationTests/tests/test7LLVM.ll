; ModuleID = "tests/test7.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 5, i32* %".3", align 4
  ; INT x = 5
  %".6" = alloca i32, align 4
  store i32 0, i32* %".6", align 4
  ; INT a = 0
  store i32 1, i32* %".6", align 4
  ; a = 1
  %".11" = load i32, i32* %".3", align 4
  ; a = x --
  %".13" = sub i32 %".11", 1
  store i32 %".13", i32* %".3", align 4
  store i32 %".11", i32* %".6", align 4
  %".16" = load i32, i32* %".6", align 4
  ; printf " %d " , a
  %".18" = bitcast [3 x i8]* @".str.d" to i8*
  %".19" = alloca i32
  store i32 %".16", i32* %".19"
  %".21" = load i32, i32* %".19"
  %".22" = call i32 (i8*, ...) @"printf"(i8* %".18", i32 %".21")
  %".23" = load i32, i32* %".3", align 4
  ; INT z = x --
  %".25" = sub i32 %".23", 1
  store i32 %".25", i32* %".3", align 4
  %".27" = alloca i32, align 4
  store i32 %".23", i32* %".27", align 4
  %".29" = load i32, i32* %".27", align 4
  ; printf " %d " , z
  %".31" = bitcast [3 x i8]* @".str.d" to i8*
  %".32" = alloca i32
  store i32 %".29", i32* %".32"
  %".34" = load i32, i32* %".32"
  %".35" = call i32 (i8*, ...) @"printf"(i8* %".31", i32 %".34")
  %".36" = load i32, i32* %".3", align 4
  ; x = x -- + z --
  %".38" = sub i32 %".36", 1
  store i32 %".38", i32* %".3", align 4
  %".40" = load i32, i32* %".27", align 4
  %".41" = sub i32 %".40", 1
  store i32 %".41", i32* %".27", align 4
  %".43" = add i32 %".36", %".40"
  store i32 %".43", i32* %".3", align 4
  %".45" = load i32, i32* %".3", align 4
  ; printf " %d " , x
  %".47" = bitcast [3 x i8]* @".str.d" to i8*
  %".48" = alloca i32
  store i32 %".45", i32* %".48"
  %".50" = load i32, i32* %".48"
  %".51" = call i32 (i8*, ...) @"printf"(i8* %".47", i32 %".50")
  %".52" = load i32, i32* %".3", align 4
  ; a = -- x
  %".54" = sub i32 %".52", 1
  store i32 %".54", i32* %".3", align 4
  store i32 %".54", i32* %".6", align 4
  %".57" = load i32, i32* %".6", align 4
  ; printf " %d " , a
  %".59" = bitcast [3 x i8]* @".str.d" to i8*
  %".60" = alloca i32
  store i32 %".57", i32* %".60"
  %".62" = load i32, i32* %".60"
  %".63" = call i32 (i8*, ...) @"printf"(i8* %".59", i32 %".62")
  %".64" = load i32, i32* %".3", align 4
  ; printf " %d " , x
  %".66" = bitcast [3 x i8]* @".str.d" to i8*
  %".67" = alloca i32
  store i32 %".64", i32* %".67"
  %".69" = load i32, i32* %".67"
  %".70" = call i32 (i8*, ...) @"printf"(i8* %".66", i32 %".69")
  ret i32 0
  ; INT main
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"
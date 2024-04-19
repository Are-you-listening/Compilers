; ModuleID = "tests/test15.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;    INT main
  %".4" = alloca i32, align 4
  store i32 5, i32* %".4", align 4
  ; INT integer = 5
  store i32 1, i32* %".4", align 4
  ; integer = integer || 6
  %".9" = load i32, i32* %".4", align 4
  ; printf "%d" integer
  %".11" = bitcast [3 x i8]* @".str.d" to i8*
  %".12" = alloca i32
  store i32 %".9", i32* %".12"
  %".14" = load i32, i32* %".12"
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".11", i32 %".14")
  %".16" = alloca i32*, align 8
  store i32* %".4", i32** %".16", align 8
  ; INT * int_ptr = & integer
  %".19" = load i32*, i32** %".16", align 8
  ; printf "%d" * int_ptr
  %".21" = load i32, i32* %".19", align 8
  %".22" = bitcast [3 x i8]* @".str.d" to i8*
  %".23" = alloca i32
  store i32 %".21", i32* %".23"
  %".25" = load i32, i32* %".23"
  %".26" = call i32 (i8*, ...) @"printf"(i8* %".22", i32 %".25")
  %".27" = alloca i32**, align 8
  store i32** %".16", i32*** %".27", align 8
  ; INT * * ptr_ptr = & int_ptr
  %".30" = load i32*, i32** %".16", align 8
  ; printf "%d" * * ptr_ptr
  %".32" = load i32, i32* %".30", align 8
  %".33" = bitcast [3 x i8]* @".str.d" to i8*
  %".34" = alloca i32
  store i32 %".32", i32* %".34"
  %".36" = load i32, i32* %".34"
  %".37" = call i32 (i8*, ...) @"printf"(i8* %".33", i32 %".36")
  %".38" = load i32**, i32*** %".27", align 8
  ;  INT * * another_pointer = ptr_ptr
  %".40" = alloca i32**, align 8
  store i32** %".38", i32*** %".40", align 8
  %".42" = load i32**, i32*** %".40", align 8
  ; printf "%d" * * another_pointer
  %".44" = load i32*, i32** %".42", align 8
  %".45" = load i32, i32* %".44", align 8
  %".46" = bitcast [3 x i8]* @".str.d" to i8*
  %".47" = alloca i32
  store i32 %".45", i32* %".47"
  %".49" = load i32, i32* %".47"
  %".50" = call i32 (i8*, ...) @"printf"(i8* %".46", i32 %".49")
  %".51" = load i32, i32* %".4", align 4
  ;   INT z = integer + 5
  %".53" = add i32 %".51", 5
  %".54" = alloca i32, align 4
  store i32 %".53", i32* %".54", align 4
  %".56" = load i32, i32* %".54", align 4
  ; printf "%d" z
  %".58" = bitcast [3 x i8]* @".str.d" to i8*
  %".59" = alloca i32
  store i32 %".56", i32* %".59"
  %".61" = load i32, i32* %".59"
  %".62" = call i32 (i8*, ...) @"printf"(i8* %".58", i32 %".61")
  store i32* %".54", i32** %".16", align 8
  ;  int_ptr = & z
  %".65" = load i32*, i32** %".16", align 8
  ; printf "%d" * int_ptr
  %".67" = load i32, i32* %".65", align 8
  %".68" = bitcast [3 x i8]* @".str.d" to i8*
  %".69" = alloca i32
  store i32 %".67", i32* %".69"
  %".71" = load i32, i32* %".69"
  %".72" = call i32 (i8*, ...) @"printf"(i8* %".68", i32 %".71")
  %".73" = alloca i32*, align 8
  store i32* %".54", i32** %".73", align 8
  ; INT * pointer = & z
  %".76" = load i32, i32* %".54", align 4
  ; printf "%d" * pointer
  %".78" = bitcast [3 x i8]* @".str.d" to i8*
  %".79" = alloca i32
  store i32 %".76", i32* %".79"
  %".81" = load i32, i32* %".79"
  %".82" = call i32 (i8*, ...) @"printf"(i8* %".78", i32 %".81")
  %".83" = load i32*, i32** %".73", align 8
  ;  INT x = * pointer
  %".85" = load i32, i32* %".83", align 8
  %".86" = alloca i32, align 4
  store i32 %".85", i32* %".86", align 4
  %".88" = load i32, i32* %".86", align 4
  ; printf "%d" x
  %".90" = bitcast [3 x i8]* @".str.d" to i8*
  %".91" = alloca i32
  store i32 %".88", i32* %".91"
  %".93" = load i32, i32* %".91"
  %".94" = call i32 (i8*, ...) @"printf"(i8* %".90", i32 %".93")
  %".95" = load i32, i32* %".86", align 4
  ; x ++
  %".97" = add i32 %".95", 1
  store i32 %".97", i32* %".86", align 4
  %".99" = load i32, i32* %".86", align 4
  ; x ++
  %".101" = add i32 %".99", 1
  store i32 %".101", i32* %".86", align 4
  %".103" = alloca i32**, align 8
  store i32** %".16", i32*** %".103", align 8
  ;  INT * * x_ptr = & int_ptr
  %".106" = load i32*, i32** %".16", align 8
  ; printf "%d" * * x_ptr
  %".108" = load i32, i32* %".106", align 8
  %".109" = bitcast [3 x i8]* @".str.d" to i8*
  %".110" = alloca i32
  store i32 %".108", i32* %".110"
  %".112" = load i32, i32* %".110"
  %".113" = call i32 (i8*, ...) @"printf"(i8* %".109", i32 %".112")
  ret i32 0
  ;  return 0
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"
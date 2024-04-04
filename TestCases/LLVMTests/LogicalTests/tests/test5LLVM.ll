; ModuleID = "tests/test5.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ; INT main
  %".40" = alloca i32, align 4
  store i32 0, i32* %".40", align 4
  ; INT a = 0
  %".43" = alloca i32, align 4
  store i32 0, i32* %".43", align 4
  ; INT b = 0
  %".46" = alloca i32, align 4
  store i32 0, i32* %".46", align 4
  ; INT c = 0
  %".49" = alloca i32, align 4
  store i32 0, i32* %".49", align 4
  ; INT d = 0
  %".52" = alloca i32, align 4
  store i32 0, i32* %".52", align 4
  ; INT e = 0
  %".55" = alloca i32, align 4
  store i32 0, i32* %".55", align 4
  ; INT f = 0
  store i32 0, i32* %".40", align 4
  ; a = 0
  store i32 0, i32* %".43", align 4
  ; b = 0
  store i32 0, i32* %".46", align 4
  ; c = 0
  store i32 0, i32* %".49", align 4
  ; d = 0
  store i32 0, i32* %".52", align 4
  ; e = 0
  %".68" = load i32, i32* %".40", align 4
  ; f = a && b || c || d && c && e
  %".70" = icmp ne i32 %".68", 0
  br i1 %".70", label %".3", label %".5"
.3:
  %".72" = load i32, i32* %".43", align 4
  %".73" = icmp ne i32 %".72", 0
  br i1 %".73", label %".8", label %".4"
.4:
  %".75" = load i32, i32* %".46", align 4
  %".76" = icmp ne i32 %".75", 0
  br i1 %".76", label %".8", label %".5"
.5:
  %".78" = load i32, i32* %".49", align 4
  %".79" = icmp ne i32 %".78", 0
  br i1 %".79", label %".6", label %".8"
.6:
  %".81" = load i32, i32* %".46", align 4
  %".82" = icmp ne i32 %".81", 0
  br i1 %".82", label %".7", label %".8"
.7:
  %".84" = load i32, i32* %".52", align 4
  %".85" = icmp ne i32 %".84", 0
  br label %".8"
.8:
  %".87" = phi  i1 [1, %".3"], [0, %".6"], [1, %".4"], [%".85", %".7"], [0, %".5"]
  %".88" = zext i1 %".87" to i32
  store i32 %".88", i32* %".55", align 4
  %".90" = load i32, i32* %".55", align 4
  ; printf "%d" , f
  %".92" = bitcast [3 x i8]* @".str.d" to i8*
  %".93" = alloca i32
  store i32 %".90", i32* %".93"
  %".95" = load i32, i32* %".93"
  %".96" = call i32 (i8*, ...) @"printf"(i8* %".92", i32 %".95")
  store i32 1, i32* %".40", align 4
  ; a = 1
  %".99" = load i32, i32* %".40", align 4
  ; f = a && b || c || d && c && e
  %".101" = icmp ne i32 %".99", 0
  br i1 %".101", label %".9", label %".11"
.9:
  %".103" = load i32, i32* %".43", align 4
  %".104" = icmp ne i32 %".103", 0
  br i1 %".104", label %".14", label %".10"
.10:
  %".106" = load i32, i32* %".46", align 4
  %".107" = icmp ne i32 %".106", 0
  br i1 %".107", label %".14", label %".11"
.11:
  %".109" = load i32, i32* %".49", align 4
  %".110" = icmp ne i32 %".109", 0
  br i1 %".110", label %".12", label %".14"
.12:
  %".112" = load i32, i32* %".46", align 4
  %".113" = icmp ne i32 %".112", 0
  br i1 %".113", label %".13", label %".14"
.13:
  %".115" = load i32, i32* %".52", align 4
  %".116" = icmp ne i32 %".115", 0
  br label %".14"
.14:
  %".118" = phi  i1 [1, %".9"], [0, %".12"], [0, %".11"], [%".116", %".13"], [1, %".10"]
  %".119" = zext i1 %".118" to i32
  store i32 %".119", i32* %".55", align 4
  %".121" = load i32, i32* %".55", align 4
  ; printf "%d" , f
  %".123" = bitcast [3 x i8]* @".str.d" to i8*
  %".124" = alloca i32
  store i32 %".121", i32* %".124"
  %".126" = load i32, i32* %".124"
  %".127" = call i32 (i8*, ...) @"printf"(i8* %".123", i32 %".126")
  store i32 1, i32* %".43", align 4
  ; b = 1
  %".130" = load i32, i32* %".40", align 4
  ; f = a && b || c || d && c && e
  %".132" = icmp ne i32 %".130", 0
  br i1 %".132", label %".15", label %".17"
.15:
  %".134" = load i32, i32* %".43", align 4
  %".135" = icmp ne i32 %".134", 0
  br i1 %".135", label %".20", label %".16"
.16:
  %".137" = load i32, i32* %".46", align 4
  %".138" = icmp ne i32 %".137", 0
  br i1 %".138", label %".20", label %".17"
.17:
  %".140" = load i32, i32* %".49", align 4
  %".141" = icmp ne i32 %".140", 0
  br i1 %".141", label %".18", label %".20"
.18:
  %".143" = load i32, i32* %".46", align 4
  %".144" = icmp ne i32 %".143", 0
  br i1 %".144", label %".19", label %".20"
.19:
  %".146" = load i32, i32* %".52", align 4
  %".147" = icmp ne i32 %".146", 0
  br label %".20"
.20:
  %".149" = phi  i1 [%".147", %".19"], [1, %".16"], [0, %".18"], [0, %".17"], [1, %".15"]
  %".150" = zext i1 %".149" to i32
  store i32 %".150", i32* %".55", align 4
  %".152" = load i32, i32* %".55", align 4
  ; printf "%d" , f
  %".154" = bitcast [3 x i8]* @".str.d" to i8*
  %".155" = alloca i32
  store i32 %".152", i32* %".155"
  %".157" = load i32, i32* %".155"
  %".158" = call i32 (i8*, ...) @"printf"(i8* %".154", i32 %".157")
  store i32 1, i32* %".46", align 4
  ; c = 1
  %".161" = load i32, i32* %".40", align 4
  ; f = a && b || c || d && c && e
  %".163" = icmp ne i32 %".161", 0
  br i1 %".163", label %".21", label %".23"
.21:
  %".165" = load i32, i32* %".43", align 4
  %".166" = icmp ne i32 %".165", 0
  br i1 %".166", label %".26", label %".22"
.22:
  %".168" = load i32, i32* %".46", align 4
  %".169" = icmp ne i32 %".168", 0
  br i1 %".169", label %".26", label %".23"
.23:
  %".171" = load i32, i32* %".49", align 4
  %".172" = icmp ne i32 %".171", 0
  br i1 %".172", label %".24", label %".26"
.24:
  %".174" = load i32, i32* %".46", align 4
  %".175" = icmp ne i32 %".174", 0
  br i1 %".175", label %".25", label %".26"
.25:
  %".177" = load i32, i32* %".52", align 4
  %".178" = icmp ne i32 %".177", 0
  br label %".26"
.26:
  %".180" = phi  i1 [0, %".23"], [1, %".22"], [1, %".21"], [0, %".24"], [%".178", %".25"]
  %".181" = zext i1 %".180" to i32
  store i32 %".181", i32* %".55", align 4
  %".183" = load i32, i32* %".55", align 4
  ; printf "%d" , f
  %".185" = bitcast [3 x i8]* @".str.d" to i8*
  %".186" = alloca i32
  store i32 %".183", i32* %".186"
  %".188" = load i32, i32* %".186"
  %".189" = call i32 (i8*, ...) @"printf"(i8* %".185", i32 %".188")
  store i32 1, i32* %".49", align 4
  ; d = 1
  %".192" = load i32, i32* %".40", align 4
  ; f = a && b || c || d && c && e
  %".194" = icmp ne i32 %".192", 0
  br i1 %".194", label %".27", label %".29"
.27:
  %".196" = load i32, i32* %".43", align 4
  %".197" = icmp ne i32 %".196", 0
  br i1 %".197", label %".32", label %".28"
.28:
  %".199" = load i32, i32* %".46", align 4
  %".200" = icmp ne i32 %".199", 0
  br i1 %".200", label %".32", label %".29"
.29:
  %".202" = load i32, i32* %".49", align 4
  %".203" = icmp ne i32 %".202", 0
  br i1 %".203", label %".30", label %".32"
.30:
  %".205" = load i32, i32* %".46", align 4
  %".206" = icmp ne i32 %".205", 0
  br i1 %".206", label %".31", label %".32"
.31:
  %".208" = load i32, i32* %".52", align 4
  %".209" = icmp ne i32 %".208", 0
  br label %".32"
.32:
  %".211" = phi  i1 [0, %".30"], [1, %".27"], [0, %".29"], [1, %".28"], [%".209", %".31"]
  %".212" = zext i1 %".211" to i32
  store i32 %".212", i32* %".55", align 4
  %".214" = load i32, i32* %".55", align 4
  ; printf "%d" , f
  %".216" = bitcast [3 x i8]* @".str.d" to i8*
  %".217" = alloca i32
  store i32 %".214", i32* %".217"
  %".219" = load i32, i32* %".217"
  %".220" = call i32 (i8*, ...) @"printf"(i8* %".216", i32 %".219")
  store i32 1, i32* %".52", align 4
  ; e = 1
  %".223" = load i32, i32* %".40", align 4
  ; f = a && b || c || d && c && e
  %".225" = icmp ne i32 %".223", 0
  br i1 %".225", label %".33", label %".35"
.33:
  %".227" = load i32, i32* %".43", align 4
  %".228" = icmp ne i32 %".227", 0
  br i1 %".228", label %".38", label %".34"
.34:
  %".230" = load i32, i32* %".46", align 4
  %".231" = icmp ne i32 %".230", 0
  br i1 %".231", label %".38", label %".35"
.35:
  %".233" = load i32, i32* %".49", align 4
  %".234" = icmp ne i32 %".233", 0
  br i1 %".234", label %".36", label %".38"
.36:
  %".236" = load i32, i32* %".46", align 4
  %".237" = icmp ne i32 %".236", 0
  br i1 %".237", label %".37", label %".38"
.37:
  %".239" = load i32, i32* %".52", align 4
  %".240" = icmp ne i32 %".239", 0
  br label %".38"
.38:
  %".242" = phi  i1 [0, %".36"], [0, %".35"], [1, %".33"], [%".240", %".37"], [1, %".34"]
  %".243" = zext i1 %".242" to i32
  store i32 %".243", i32* %".55", align 4
  %".245" = load i32, i32* %".55", align 4
  ; printf "%d" , f
  %".247" = bitcast [3 x i8]* @".str.d" to i8*
  %".248" = alloca i32
  store i32 %".245", i32* %".248"
  %".250" = load i32, i32* %".248"
  %".251" = call i32 (i8*, ...) @"printf"(i8* %".247", i32 %".250")
  ret i32 0
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"
; ModuleID = "tests/test15.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ; INT main
  %".49" = alloca i32, align 4
  store i32 0, i32* %".49", align 4
  ; INT a = 0
  %".52" = alloca i32, align 4
  store i32 0, i32* %".52", align 4
  ; INT b = 0
  %".55" = alloca i32, align 4
  store i32 0, i32* %".55", align 4
  ; INT c = 0
  %".58" = alloca i32, align 4
  store i32 0, i32* %".58", align 4
  ; INT d = 0
  %".61" = alloca i32, align 4
  store i32 0, i32* %".61", align 4
  ; INT e = 0
  %".64" = alloca i32, align 4
  store i32 0, i32* %".64", align 4
  ; INT f = 0
  store i32 0, i32* %".49", align 4
  ; a = 0
  store i32 0, i32* %".52", align 4
  ; b = 0
  store i32 0, i32* %".55", align 4
  ; c = 0
  store i32 0, i32* %".58", align 4
  ; d = 0
  store i32 0, i32* %".61", align 4
  ; e = 0
  %".77" = load i32, i32* %".49", align 4
  ; f = a && ! b || c || ! b && ! d || e && ! a
  %".79" = icmp ne i32 %".77", 0
  br i1 %".79", label %".3", label %".5"
.3:
  %".81" = load i32, i32* %".52", align 4
  %".82" = icmp ne i32 %".81", 0
  br i1 %".82", label %".5", label %".4"
.4:
  %".84" = load i32, i32* %".55", align 4
  %".85" = icmp ne i32 %".84", 0
  br i1 %".85", label %".5", label %".9"
.5:
  %".87" = load i32, i32* %".52", align 4
  %".88" = icmp ne i32 %".87", 0
  br i1 %".88", label %".6", label %".7"
.6:
  %".90" = load i32, i32* %".58", align 4
  %".91" = icmp ne i32 %".90", 0
  %".92" = xor i1 %".91", 1
  br i1 %".92", label %".9", label %".7"
.7:
  %".94" = load i32, i32* %".61", align 4
  %".95" = icmp ne i32 %".94", 0
  br i1 %".95", label %".8", label %".9"
.8:
  %".97" = load i32, i32* %".49", align 4
  %".98" = icmp ne i32 %".97", 0
  %".99" = xor i1 %".98", 1
  %".100" = xor i1 %".99", 1
  br label %".9"
.9:
  %".102" = phi  i1 [0, %".6"], [1, %".7"], [%".100", %".8"], [1, %".4"]
  %".103" = zext i1 %".102" to i32
  store i32 %".103", i32* %".64", align 4
  %".105" = load i32, i32* %".64", align 4
  ; printf "%d" , f
  %".107" = bitcast [3 x i8]* @".str.d" to i8*
  %".108" = alloca i32
  store i32 %".105", i32* %".108"
  %".110" = load i32, i32* %".108"
  %".111" = call i32 (i8*, ...) @"printf"(i8* %".107", i32 %".110")
  store i32 1, i32* %".49", align 4
  ; a = 1
  %".114" = load i32, i32* %".49", align 4
  ; f = a && ! b || c
  %".116" = icmp ne i32 %".114", 0
  br i1 %".116", label %".10", label %".12"
.10:
  %".118" = load i32, i32* %".52", align 4
  %".119" = icmp ne i32 %".118", 0
  br i1 %".119", label %".12", label %".11"
.11:
  %".121" = load i32, i32* %".55", align 4
  %".122" = icmp ne i32 %".121", 0
  %".123" = xor i1 %".122", 1
  br label %".12"
.12:
  %".125" = phi  i1 [0, %".9"], [%".123", %".11"], [0, %".10"]
  %".126" = zext i1 %".125" to i32
  store i32 %".126", i32* %".64", align 4
  %".128" = load i32, i32* %".64", align 4
  ; printf "%d" , f
  %".130" = bitcast [3 x i8]* @".str.d" to i8*
  %".131" = alloca i32
  store i32 %".128", i32* %".131"
  %".133" = load i32, i32* %".131"
  %".134" = call i32 (i8*, ...) @"printf"(i8* %".130", i32 %".133")
  %".135" = load i32, i32* %".49", align 4
  ; f = a && ! b || c || ! b && ! d
  %".137" = icmp ne i32 %".135", 0
  br i1 %".137", label %".13", label %".15"
.13:
  %".139" = load i32, i32* %".52", align 4
  %".140" = icmp ne i32 %".139", 0
  br i1 %".140", label %".15", label %".14"
.14:
  %".142" = load i32, i32* %".55", align 4
  %".143" = icmp ne i32 %".142", 0
  br i1 %".143", label %".15", label %".17"
.15:
  %".145" = load i32, i32* %".52", align 4
  %".146" = icmp ne i32 %".145", 0
  br i1 %".146", label %".16", label %".17"
.16:
  %".148" = load i32, i32* %".58", align 4
  %".149" = icmp ne i32 %".148", 0
  %".150" = xor i1 %".149", 1
  %".151" = xor i1 %".150", 1
  br label %".17"
.17:
  %".153" = phi  i1 [%".151", %".16"], [1, %".15"], [1, %".14"]
  %".154" = zext i1 %".153" to i32
  store i32 %".154", i32* %".64", align 4
  %".156" = load i32, i32* %".64", align 4
  ; printf "%d" , f
  %".158" = bitcast [3 x i8]* @".str.d" to i8*
  %".159" = alloca i32
  store i32 %".156", i32* %".159"
  %".161" = load i32, i32* %".159"
  %".162" = call i32 (i8*, ...) @"printf"(i8* %".158", i32 %".161")
  store i32 0, i32* %".49", align 4
  ; a = 0
  store i32 1, i32* %".52", align 4
  ; b = 1
  store i32 1, i32* %".58", align 4
  ; d = 1
  %".169" = load i32, i32* %".49", align 4
  ; f = a && ! b || c || ! b && ! d
  %".171" = icmp ne i32 %".169", 0
  br i1 %".171", label %".18", label %".20"
.18:
  %".173" = load i32, i32* %".52", align 4
  %".174" = icmp ne i32 %".173", 0
  br i1 %".174", label %".20", label %".19"
.19:
  %".176" = load i32, i32* %".55", align 4
  %".177" = icmp ne i32 %".176", 0
  br i1 %".177", label %".20", label %".22"
.20:
  %".179" = load i32, i32* %".52", align 4
  %".180" = icmp ne i32 %".179", 0
  br i1 %".180", label %".21", label %".22"
.21:
  %".182" = load i32, i32* %".58", align 4
  %".183" = icmp ne i32 %".182", 0
  %".184" = xor i1 %".183", 1
  %".185" = xor i1 %".184", 1
  br label %".22"
.22:
  %".187" = phi  i1 [1, %".20"], [1, %".19"], [%".185", %".21"]
  %".188" = zext i1 %".187" to i32
  store i32 %".188", i32* %".64", align 4
  %".190" = load i32, i32* %".64", align 4
  ; printf "%d" , f
  %".192" = bitcast [3 x i8]* @".str.d" to i8*
  %".193" = alloca i32
  store i32 %".190", i32* %".193"
  %".195" = load i32, i32* %".193"
  %".196" = call i32 (i8*, ...) @"printf"(i8* %".192", i32 %".195")
  store i32 1, i32* %".49", align 4
  ; a = 1
  store i32 1, i32* %".52", align 4
  ; b = 1
  %".201" = load i32, i32* %".49", align 4
  ; f = a && ! b || c || ! b && ! d
  %".203" = icmp ne i32 %".201", 0
  br i1 %".203", label %".23", label %".25"
.23:
  %".205" = load i32, i32* %".52", align 4
  %".206" = icmp ne i32 %".205", 0
  br i1 %".206", label %".25", label %".24"
.24:
  %".208" = load i32, i32* %".55", align 4
  %".209" = icmp ne i32 %".208", 0
  br i1 %".209", label %".25", label %".27"
.25:
  %".211" = load i32, i32* %".52", align 4
  %".212" = icmp ne i32 %".211", 0
  br i1 %".212", label %".26", label %".27"
.26:
  %".214" = load i32, i32* %".58", align 4
  %".215" = icmp ne i32 %".214", 0
  %".216" = xor i1 %".215", 1
  %".217" = xor i1 %".216", 1
  br label %".27"
.27:
  %".219" = phi  i1 [%".217", %".26"], [1, %".25"], [1, %".24"]
  %".220" = zext i1 %".219" to i32
  store i32 %".220", i32* %".64", align 4
  %".222" = load i32, i32* %".64", align 4
  ; printf "%d" , f
  %".224" = bitcast [3 x i8]* @".str.d" to i8*
  %".225" = alloca i32
  store i32 %".222", i32* %".225"
  %".227" = load i32, i32* %".225"
  %".228" = call i32 (i8*, ...) @"printf"(i8* %".224", i32 %".227")
  store i32 0, i32* %".49", align 4
  ; a = 0
  store i32 0, i32* %".52", align 4
  ; b = 0
  store i32 1, i32* %".55", align 4
  ; c = 1
  %".235" = load i32, i32* %".49", align 4
  ; f = a && ! b || c || ! b && ! d
  %".237" = icmp ne i32 %".235", 0
  br i1 %".237", label %".28", label %".30"
.28:
  %".239" = load i32, i32* %".52", align 4
  %".240" = icmp ne i32 %".239", 0
  br i1 %".240", label %".30", label %".29"
.29:
  %".242" = load i32, i32* %".55", align 4
  %".243" = icmp ne i32 %".242", 0
  br i1 %".243", label %".30", label %".32"
.30:
  %".245" = load i32, i32* %".52", align 4
  %".246" = icmp ne i32 %".245", 0
  br i1 %".246", label %".31", label %".32"
.31:
  %".248" = load i32, i32* %".58", align 4
  %".249" = icmp ne i32 %".248", 0
  %".250" = xor i1 %".249", 1
  %".251" = xor i1 %".250", 1
  br label %".32"
.32:
  %".253" = phi  i1 [%".251", %".31"], [1, %".29"], [1, %".30"]
  %".254" = zext i1 %".253" to i32
  store i32 %".254", i32* %".64", align 4
  %".256" = load i32, i32* %".64", align 4
  ; printf "%d" , f
  %".258" = bitcast [3 x i8]* @".str.d" to i8*
  %".259" = alloca i32
  store i32 %".256", i32* %".259"
  %".261" = load i32, i32* %".259"
  %".262" = call i32 (i8*, ...) @"printf"(i8* %".258", i32 %".261")
  store i32 1, i32* %".49", align 4
  ; a = 1
  store i32 0, i32* %".52", align 4
  ; b = 0
  store i32 1, i32* %".55", align 4
  ; c = 1
  %".269" = load i32, i32* %".49", align 4
  ; f = a && ! b || c || ! b && ! d
  %".271" = icmp ne i32 %".269", 0
  br i1 %".271", label %".33", label %".35"
.33:
  %".273" = load i32, i32* %".52", align 4
  %".274" = icmp ne i32 %".273", 0
  br i1 %".274", label %".35", label %".34"
.34:
  %".276" = load i32, i32* %".55", align 4
  %".277" = icmp ne i32 %".276", 0
  br i1 %".277", label %".35", label %".37"
.35:
  %".279" = load i32, i32* %".52", align 4
  %".280" = icmp ne i32 %".279", 0
  br i1 %".280", label %".36", label %".37"
.36:
  %".282" = load i32, i32* %".58", align 4
  %".283" = icmp ne i32 %".282", 0
  %".284" = xor i1 %".283", 1
  %".285" = xor i1 %".284", 1
  br label %".37"
.37:
  %".287" = phi  i1 [1, %".34"], [%".285", %".36"], [1, %".35"]
  %".288" = zext i1 %".287" to i32
  store i32 %".288", i32* %".64", align 4
  %".290" = load i32, i32* %".64", align 4
  ; printf "%d" , f
  %".292" = bitcast [3 x i8]* @".str.d" to i8*
  %".293" = alloca i32
  store i32 %".290", i32* %".293"
  %".295" = load i32, i32* %".293"
  %".296" = call i32 (i8*, ...) @"printf"(i8* %".292", i32 %".295")
  store i32 0, i32* %".49", align 4
  ; a = 0
  store i32 1, i32* %".52", align 4
  ; b = 1
  store i32 1, i32* %".55", align 4
  ; c = 1
  %".303" = load i32, i32* %".49", align 4
  ; f = a && ! b || c || ! b && ! d
  %".305" = icmp ne i32 %".303", 0
  br i1 %".305", label %".38", label %".40"
.38:
  %".307" = load i32, i32* %".52", align 4
  %".308" = icmp ne i32 %".307", 0
  br i1 %".308", label %".40", label %".39"
.39:
  %".310" = load i32, i32* %".55", align 4
  %".311" = icmp ne i32 %".310", 0
  br i1 %".311", label %".40", label %".42"
.40:
  %".313" = load i32, i32* %".52", align 4
  %".314" = icmp ne i32 %".313", 0
  br i1 %".314", label %".41", label %".42"
.41:
  %".316" = load i32, i32* %".58", align 4
  %".317" = icmp ne i32 %".316", 0
  %".318" = xor i1 %".317", 1
  %".319" = xor i1 %".318", 1
  br label %".42"
.42:
  %".321" = phi  i1 [1, %".40"], [1, %".39"], [%".319", %".41"]
  %".322" = zext i1 %".321" to i32
  store i32 %".322", i32* %".64", align 4
  %".324" = load i32, i32* %".64", align 4
  ; printf "%d" , f
  %".326" = bitcast [3 x i8]* @".str.d" to i8*
  %".327" = alloca i32
  store i32 %".324", i32* %".327"
  %".329" = load i32, i32* %".327"
  %".330" = call i32 (i8*, ...) @"printf"(i8* %".326", i32 %".329")
  store i32 1, i32* %".49", align 4
  ; a = 1
  store i32 1, i32* %".52", align 4
  ; b = 1
  store i32 1, i32* %".55", align 4
  ; c = 1
  %".337" = load i32, i32* %".49", align 4
  ; f = a && ! b || c || ! b && ! d
  %".339" = icmp ne i32 %".337", 0
  br i1 %".339", label %".43", label %".45"
.43:
  %".341" = load i32, i32* %".52", align 4
  %".342" = icmp ne i32 %".341", 0
  br i1 %".342", label %".45", label %".44"
.44:
  %".344" = load i32, i32* %".55", align 4
  %".345" = icmp ne i32 %".344", 0
  br i1 %".345", label %".45", label %".47"
.45:
  %".347" = load i32, i32* %".52", align 4
  %".348" = icmp ne i32 %".347", 0
  br i1 %".348", label %".46", label %".47"
.46:
  %".350" = load i32, i32* %".58", align 4
  %".351" = icmp ne i32 %".350", 0
  %".352" = xor i1 %".351", 1
  %".353" = xor i1 %".352", 1
  br label %".47"
.47:
  %".355" = phi  i1 [1, %".45"], [1, %".44"], [%".353", %".46"]
  %".356" = zext i1 %".355" to i32
  store i32 %".356", i32* %".64", align 4
  %".358" = load i32, i32* %".64", align 4
  ; printf "%d" , f
  %".360" = bitcast [3 x i8]* @".str.d" to i8*
  %".361" = alloca i32
  store i32 %".358", i32* %".361"
  %".363" = load i32, i32* %".361"
  %".364" = call i32 (i8*, ...) @"printf"(i8* %".360", i32 %".363")
  ret i32 0
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"
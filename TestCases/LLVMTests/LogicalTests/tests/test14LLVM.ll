; ModuleID = "tests/test14.c"
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
  %".102" = phi  i1 [%".100", %".8"], [1, %".7"], [0, %".6"], [1, %".4"]
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
  %".125" = phi  i1 [%".123", %".11"], [0, %".10"], [0, %".9"]
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
  %".153" = phi  i1 [1, %".15"], [%".151", %".16"], [1, %".14"]
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
  %".167" = load i32, i32* %".49", align 4
  ; f = a && ! b || c || ! b && ! d
  %".169" = icmp ne i32 %".167", 0
  br i1 %".169", label %".18", label %".20"
.18:
  %".171" = load i32, i32* %".52", align 4
  %".172" = icmp ne i32 %".171", 0
  br i1 %".172", label %".20", label %".19"
.19:
  %".174" = load i32, i32* %".55", align 4
  %".175" = icmp ne i32 %".174", 0
  br i1 %".175", label %".20", label %".22"
.20:
  %".177" = load i32, i32* %".52", align 4
  %".178" = icmp ne i32 %".177", 0
  br i1 %".178", label %".21", label %".22"
.21:
  %".180" = load i32, i32* %".58", align 4
  %".181" = icmp ne i32 %".180", 0
  %".182" = xor i1 %".181", 1
  %".183" = xor i1 %".182", 1
  br label %".22"
.22:
  %".185" = phi  i1 [1, %".20"], [1, %".19"], [%".183", %".21"]
  %".186" = zext i1 %".185" to i32
  store i32 %".186", i32* %".64", align 4
  %".188" = load i32, i32* %".64", align 4
  ; printf "%d" , f
  %".190" = bitcast [3 x i8]* @".str.d" to i8*
  %".191" = alloca i32
  store i32 %".188", i32* %".191"
  %".193" = load i32, i32* %".191"
  %".194" = call i32 (i8*, ...) @"printf"(i8* %".190", i32 %".193")
  store i32 1, i32* %".49", align 4
  ; a = 1
  store i32 1, i32* %".52", align 4
  ; b = 1
  %".199" = load i32, i32* %".49", align 4
  ; f = a && ! b || c || ! b && ! d
  %".201" = icmp ne i32 %".199", 0
  br i1 %".201", label %".23", label %".25"
.23:
  %".203" = load i32, i32* %".52", align 4
  %".204" = icmp ne i32 %".203", 0
  br i1 %".204", label %".25", label %".24"
.24:
  %".206" = load i32, i32* %".55", align 4
  %".207" = icmp ne i32 %".206", 0
  br i1 %".207", label %".25", label %".27"
.25:
  %".209" = load i32, i32* %".52", align 4
  %".210" = icmp ne i32 %".209", 0
  br i1 %".210", label %".26", label %".27"
.26:
  %".212" = load i32, i32* %".58", align 4
  %".213" = icmp ne i32 %".212", 0
  %".214" = xor i1 %".213", 1
  %".215" = xor i1 %".214", 1
  br label %".27"
.27:
  %".217" = phi  i1 [1, %".25"], [1, %".24"], [%".215", %".26"]
  %".218" = zext i1 %".217" to i32
  store i32 %".218", i32* %".64", align 4
  %".220" = load i32, i32* %".64", align 4
  ; printf "%d" , f
  %".222" = bitcast [3 x i8]* @".str.d" to i8*
  %".223" = alloca i32
  store i32 %".220", i32* %".223"
  %".225" = load i32, i32* %".223"
  %".226" = call i32 (i8*, ...) @"printf"(i8* %".222", i32 %".225")
  store i32 0, i32* %".49", align 4
  ; a = 0
  store i32 0, i32* %".52", align 4
  ; b = 0
  store i32 1, i32* %".55", align 4
  ; c = 1
  %".233" = load i32, i32* %".49", align 4
  ; f = a && ! b || c || ! b && ! d
  %".235" = icmp ne i32 %".233", 0
  br i1 %".235", label %".28", label %".30"
.28:
  %".237" = load i32, i32* %".52", align 4
  %".238" = icmp ne i32 %".237", 0
  br i1 %".238", label %".30", label %".29"
.29:
  %".240" = load i32, i32* %".55", align 4
  %".241" = icmp ne i32 %".240", 0
  br i1 %".241", label %".30", label %".32"
.30:
  %".243" = load i32, i32* %".52", align 4
  %".244" = icmp ne i32 %".243", 0
  br i1 %".244", label %".31", label %".32"
.31:
  %".246" = load i32, i32* %".58", align 4
  %".247" = icmp ne i32 %".246", 0
  %".248" = xor i1 %".247", 1
  %".249" = xor i1 %".248", 1
  br label %".32"
.32:
  %".251" = phi  i1 [1, %".29"], [1, %".30"], [%".249", %".31"]
  %".252" = zext i1 %".251" to i32
  store i32 %".252", i32* %".64", align 4
  %".254" = load i32, i32* %".64", align 4
  ; printf "%d" , f
  %".256" = bitcast [3 x i8]* @".str.d" to i8*
  %".257" = alloca i32
  store i32 %".254", i32* %".257"
  %".259" = load i32, i32* %".257"
  %".260" = call i32 (i8*, ...) @"printf"(i8* %".256", i32 %".259")
  store i32 1, i32* %".49", align 4
  ; a = 1
  store i32 0, i32* %".52", align 4
  ; b = 0
  store i32 1, i32* %".55", align 4
  ; c = 1
  %".267" = load i32, i32* %".49", align 4
  ; f = a && ! b || c || ! b && ! d
  %".269" = icmp ne i32 %".267", 0
  br i1 %".269", label %".33", label %".35"
.33:
  %".271" = load i32, i32* %".52", align 4
  %".272" = icmp ne i32 %".271", 0
  br i1 %".272", label %".35", label %".34"
.34:
  %".274" = load i32, i32* %".55", align 4
  %".275" = icmp ne i32 %".274", 0
  br i1 %".275", label %".35", label %".37"
.35:
  %".277" = load i32, i32* %".52", align 4
  %".278" = icmp ne i32 %".277", 0
  br i1 %".278", label %".36", label %".37"
.36:
  %".280" = load i32, i32* %".58", align 4
  %".281" = icmp ne i32 %".280", 0
  %".282" = xor i1 %".281", 1
  %".283" = xor i1 %".282", 1
  br label %".37"
.37:
  %".285" = phi  i1 [%".283", %".36"], [1, %".35"], [1, %".34"]
  %".286" = zext i1 %".285" to i32
  store i32 %".286", i32* %".64", align 4
  %".288" = load i32, i32* %".64", align 4
  ; printf "%d" , f
  %".290" = bitcast [3 x i8]* @".str.d" to i8*
  %".291" = alloca i32
  store i32 %".288", i32* %".291"
  %".293" = load i32, i32* %".291"
  %".294" = call i32 (i8*, ...) @"printf"(i8* %".290", i32 %".293")
  store i32 0, i32* %".49", align 4
  ; a = 0
  store i32 1, i32* %".52", align 4
  ; b = 1
  store i32 1, i32* %".55", align 4
  ; c = 1
  %".301" = load i32, i32* %".49", align 4
  ; f = a && ! b || c || ! b && ! d
  %".303" = icmp ne i32 %".301", 0
  br i1 %".303", label %".38", label %".40"
.38:
  %".305" = load i32, i32* %".52", align 4
  %".306" = icmp ne i32 %".305", 0
  br i1 %".306", label %".40", label %".39"
.39:
  %".308" = load i32, i32* %".55", align 4
  %".309" = icmp ne i32 %".308", 0
  br i1 %".309", label %".40", label %".42"
.40:
  %".311" = load i32, i32* %".52", align 4
  %".312" = icmp ne i32 %".311", 0
  br i1 %".312", label %".41", label %".42"
.41:
  %".314" = load i32, i32* %".58", align 4
  %".315" = icmp ne i32 %".314", 0
  %".316" = xor i1 %".315", 1
  %".317" = xor i1 %".316", 1
  br label %".42"
.42:
  %".319" = phi  i1 [%".317", %".41"], [1, %".39"], [1, %".40"]
  %".320" = zext i1 %".319" to i32
  store i32 %".320", i32* %".64", align 4
  %".322" = load i32, i32* %".64", align 4
  ; printf "%d" , f
  %".324" = bitcast [3 x i8]* @".str.d" to i8*
  %".325" = alloca i32
  store i32 %".322", i32* %".325"
  %".327" = load i32, i32* %".325"
  %".328" = call i32 (i8*, ...) @"printf"(i8* %".324", i32 %".327")
  store i32 1, i32* %".49", align 4
  ; a = 1
  store i32 1, i32* %".52", align 4
  ; b = 1
  store i32 1, i32* %".55", align 4
  ; c = 1
  %".335" = load i32, i32* %".49", align 4
  ; f = a && ! b || c || ! b && ! d
  %".337" = icmp ne i32 %".335", 0
  br i1 %".337", label %".43", label %".45"
.43:
  %".339" = load i32, i32* %".52", align 4
  %".340" = icmp ne i32 %".339", 0
  br i1 %".340", label %".45", label %".44"
.44:
  %".342" = load i32, i32* %".55", align 4
  %".343" = icmp ne i32 %".342", 0
  br i1 %".343", label %".45", label %".47"
.45:
  %".345" = load i32, i32* %".52", align 4
  %".346" = icmp ne i32 %".345", 0
  br i1 %".346", label %".46", label %".47"
.46:
  %".348" = load i32, i32* %".58", align 4
  %".349" = icmp ne i32 %".348", 0
  %".350" = xor i1 %".349", 1
  %".351" = xor i1 %".350", 1
  br label %".47"
.47:
  %".353" = phi  i1 [1, %".44"], [1, %".45"], [%".351", %".46"]
  %".354" = zext i1 %".353" to i32
  store i32 %".354", i32* %".64", align 4
  %".356" = load i32, i32* %".64", align 4
  ; printf "%d" , f
  %".358" = bitcast [3 x i8]* @".str.d" to i8*
  %".359" = alloca i32
  store i32 %".356", i32* %".359"
  %".361" = load i32, i32* %".359"
  %".362" = call i32 (i8*, ...) @"printf"(i8* %".358", i32 %".361")
  ret i32 0
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"
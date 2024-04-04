; ModuleID = "tests/test16.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ; INT main
  %".32" = alloca i32, align 4
  store i32 0, i32* %".32", align 4
  ; INT a = 0
  %".35" = alloca i32, align 4
  store i32 0, i32* %".35", align 4
  ; INT b = 0
  %".38" = alloca i32, align 4
  store i32 0, i32* %".38", align 4
  ; INT c = 0
  %".41" = alloca i32, align 4
  store i32 0, i32* %".41", align 4
  ; INT d = 0
  %".44" = alloca i32, align 4
  store i32 0, i32* %".44", align 4
  ; INT e = 0
  %".47" = alloca i32, align 4
  store i32 0, i32* %".47", align 4
  ; INT f = 0
  %".50" = alloca i32, align 4
  store i32 0, i32* %".50", align 4
  ; INT g = 0
  %".53" = alloca i32, align 4
  store i32 0, i32* %".53", align 4
  ; INT h = 0
  store i32 0, i32* %".32", align 4
  ; a = 0
  store i32 0, i32* %".35", align 4
  ; b = 0
  store i32 0, i32* %".38", align 4
  ; c = 0
  store i32 0, i32* %".41", align 4
  ; d = 0
  store i32 0, i32* %".44", align 4
  ; e = 0
  %".66" = load i32, i32* %".32", align 4
  ; f = ! a || e && d && 5 < 6
  %".68" = icmp ne i32 %".66", 0
  br i1 %".68", label %".5", label %".3"
.3:
  %".70" = load i32, i32* %".44", align 4
  %".71" = icmp ne i32 %".70", 0
  br i1 %".71", label %".4", label %".5"
.4:
  %".73" = load i32, i32* %".41", align 4
  %".74" = icmp ne i32 %".73", 0
  br label %".5"
.5:
  %".76" = phi  i1 [1, %".2"], [%".74", %".4"], [0, %".3"]
  %".77" = icmp ne i1 %".76", 0
  %".78" = xor i1 %".77", 1
  %".79" = zext i1 %".78" to i32
  store i32 %".79", i32* %".47", align 4
  %".81" = load i32, i32* %".47", align 4
  ; printf "%d" , f
  %".83" = bitcast [3 x i8]* @".str.d" to i8*
  %".84" = alloca i32
  store i32 %".81", i32* %".84"
  %".86" = load i32, i32* %".84"
  %".87" = call i32 (i8*, ...) @"printf"(i8* %".83", i32 %".86")
  %".88" = load i32, i32* %".32", align 4
  ; g = a < d && e >= b
  %".90" = load i32, i32* %".41", align 4
  %".91" = icmp slt i32 %".88", %".90"
  br i1 %".91", label %".6", label %".7"
.6:
  %".93" = load i32, i32* %".44", align 4
  %".94" = load i32, i32* %".35", align 4
  %".95" = icmp sge i32 %".93", %".94"
  br label %".7"
.7:
  %".97" = phi  i1 [%".95", %".6"], [0, %".5"]
  %".98" = zext i1 %".97" to i32
  store i32 %".98", i32* %".50", align 4
  %".100" = load i32, i32* %".50", align 4
  ; printf "%d" , g
  %".102" = bitcast [3 x i8]* @".str.d" to i8*
  %".103" = alloca i32
  store i32 %".100", i32* %".103"
  %".105" = load i32, i32* %".103"
  %".106" = call i32 (i8*, ...) @"printf"(i8* %".102", i32 %".105")
  %".107" = load i32, i32* %".32", align 4
  ; h = a - b < d && ! e > g
  %".109" = load i32, i32* %".35", align 4
  %".110" = sub i32 %".107", %".109"
  %".111" = load i32, i32* %".41", align 4
  %".112" = icmp slt i32 %".110", %".111"
  br i1 %".112", label %".8", label %".9"
.8:
  %".114" = load i32, i32* %".44", align 4
  %".115" = load i32, i32* %".50", align 4
  %".116" = icmp sgt i32 %".114", %".115"
  %".117" = icmp ne i1 %".116", 0
  %".118" = xor i1 %".117", 1
  br label %".9"
.9:
  %".120" = phi  i1 [%".118", %".8"], [0, %".7"]
  %".121" = zext i1 %".120" to i32
  store i32 %".121", i32* %".53", align 4
  %".123" = load i32, i32* %".53", align 4
  ; printf "%d" , h
  %".125" = bitcast [3 x i8]* @".str.d" to i8*
  %".126" = alloca i32
  store i32 %".123", i32* %".126"
  %".128" = load i32, i32* %".126"
  %".129" = call i32 (i8*, ...) @"printf"(i8* %".125", i32 %".128")
  store i32 0, i32* %".32", align 4
  ; a = 0
  store i32 1, i32* %".35", align 4
  ; b = 1
  store i32 0, i32* %".38", align 4
  ; c = 0
  store i32 1, i32* %".41", align 4
  ; d = 1
  store i32 0, i32* %".44", align 4
  ; e = 0
  %".140" = load i32, i32* %".32", align 4
  ; f = ! a || e && d && 5 < 6
  %".142" = icmp ne i32 %".140", 0
  br i1 %".142", label %".12", label %".10"
.10:
  %".144" = load i32, i32* %".44", align 4
  %".145" = icmp ne i32 %".144", 0
  br i1 %".145", label %".11", label %".12"
.11:
  %".147" = load i32, i32* %".41", align 4
  %".148" = icmp ne i32 %".147", 0
  br label %".12"
.12:
  %".150" = phi  i1 [0, %".10"], [%".148", %".11"], [1, %".9"]
  %".151" = icmp ne i1 %".150", 0
  %".152" = xor i1 %".151", 1
  %".153" = zext i1 %".152" to i32
  store i32 %".153", i32* %".47", align 4
  %".155" = load i32, i32* %".47", align 4
  ; printf "%d" , f
  %".157" = bitcast [3 x i8]* @".str.d" to i8*
  %".158" = alloca i32
  store i32 %".155", i32* %".158"
  %".160" = load i32, i32* %".158"
  %".161" = call i32 (i8*, ...) @"printf"(i8* %".157", i32 %".160")
  %".162" = load i32, i32* %".32", align 4
  ; g = a < d && e >= b
  %".164" = load i32, i32* %".41", align 4
  %".165" = icmp slt i32 %".162", %".164"
  br i1 %".165", label %".13", label %".14"
.13:
  %".167" = load i32, i32* %".44", align 4
  %".168" = load i32, i32* %".35", align 4
  %".169" = icmp sge i32 %".167", %".168"
  br label %".14"
.14:
  %".171" = phi  i1 [%".169", %".13"], [0, %".12"]
  %".172" = zext i1 %".171" to i32
  store i32 %".172", i32* %".50", align 4
  %".174" = load i32, i32* %".50", align 4
  ; printf "%d" , g
  %".176" = bitcast [3 x i8]* @".str.d" to i8*
  %".177" = alloca i32
  store i32 %".174", i32* %".177"
  %".179" = load i32, i32* %".177"
  %".180" = call i32 (i8*, ...) @"printf"(i8* %".176", i32 %".179")
  %".181" = load i32, i32* %".32", align 4
  ; h = a - b < d && ! e > g
  %".183" = load i32, i32* %".35", align 4
  %".184" = sub i32 %".181", %".183"
  %".185" = load i32, i32* %".41", align 4
  %".186" = icmp slt i32 %".184", %".185"
  br i1 %".186", label %".15", label %".16"
.15:
  %".188" = load i32, i32* %".44", align 4
  %".189" = load i32, i32* %".50", align 4
  %".190" = icmp sgt i32 %".188", %".189"
  %".191" = icmp ne i1 %".190", 0
  %".192" = xor i1 %".191", 1
  br label %".16"
.16:
  %".194" = phi  i1 [%".192", %".15"], [0, %".14"]
  %".195" = zext i1 %".194" to i32
  store i32 %".195", i32* %".53", align 4
  %".197" = load i32, i32* %".53", align 4
  ; printf "%d" , h
  %".199" = bitcast [3 x i8]* @".str.d" to i8*
  %".200" = alloca i32
  store i32 %".197", i32* %".200"
  %".202" = load i32, i32* %".200"
  %".203" = call i32 (i8*, ...) @"printf"(i8* %".199", i32 %".202")
  store i32 1, i32* %".32", align 4
  ; a = 1
  store i32 1, i32* %".35", align 4
  ; b = 1
  store i32 1, i32* %".38", align 4
  ; c = 1
  store i32 1, i32* %".41", align 4
  ; d = 1
  store i32 0, i32* %".44", align 4
  ; e = 0
  %".214" = load i32, i32* %".32", align 4
  ; f = ! a || e && d && 5 < 6
  %".216" = icmp ne i32 %".214", 0
  br i1 %".216", label %".19", label %".17"
.17:
  %".218" = load i32, i32* %".44", align 4
  %".219" = icmp ne i32 %".218", 0
  br i1 %".219", label %".18", label %".19"
.18:
  %".221" = load i32, i32* %".41", align 4
  %".222" = icmp ne i32 %".221", 0
  br label %".19"
.19:
  %".224" = phi  i1 [0, %".17"], [%".222", %".18"], [1, %".16"]
  %".225" = icmp ne i1 %".224", 0
  %".226" = xor i1 %".225", 1
  %".227" = zext i1 %".226" to i32
  store i32 %".227", i32* %".47", align 4
  %".229" = load i32, i32* %".47", align 4
  ; printf "%d" , f
  %".231" = bitcast [3 x i8]* @".str.d" to i8*
  %".232" = alloca i32
  store i32 %".229", i32* %".232"
  %".234" = load i32, i32* %".232"
  %".235" = call i32 (i8*, ...) @"printf"(i8* %".231", i32 %".234")
  %".236" = load i32, i32* %".32", align 4
  ; g = a < d && e >= b
  %".238" = load i32, i32* %".41", align 4
  %".239" = icmp slt i32 %".236", %".238"
  br i1 %".239", label %".20", label %".21"
.20:
  %".241" = load i32, i32* %".44", align 4
  %".242" = load i32, i32* %".35", align 4
  %".243" = icmp sge i32 %".241", %".242"
  br label %".21"
.21:
  %".245" = phi  i1 [0, %".19"], [%".243", %".20"]
  %".246" = zext i1 %".245" to i32
  store i32 %".246", i32* %".50", align 4
  %".248" = load i32, i32* %".50", align 4
  ; printf "%d" , g
  %".250" = bitcast [3 x i8]* @".str.d" to i8*
  %".251" = alloca i32
  store i32 %".248", i32* %".251"
  %".253" = load i32, i32* %".251"
  %".254" = call i32 (i8*, ...) @"printf"(i8* %".250", i32 %".253")
  %".255" = load i32, i32* %".32", align 4
  ; h = a - b < d && ! e > g
  %".257" = load i32, i32* %".35", align 4
  %".258" = sub i32 %".255", %".257"
  %".259" = load i32, i32* %".41", align 4
  %".260" = icmp slt i32 %".258", %".259"
  br i1 %".260", label %".22", label %".23"
.22:
  %".262" = load i32, i32* %".44", align 4
  %".263" = load i32, i32* %".50", align 4
  %".264" = icmp sgt i32 %".262", %".263"
  %".265" = icmp ne i1 %".264", 0
  %".266" = xor i1 %".265", 1
  br label %".23"
.23:
  %".268" = phi  i1 [%".266", %".22"], [0, %".21"]
  %".269" = zext i1 %".268" to i32
  store i32 %".269", i32* %".53", align 4
  %".271" = load i32, i32* %".53", align 4
  ; printf "%d" , h
  %".273" = bitcast [3 x i8]* @".str.d" to i8*
  %".274" = alloca i32
  store i32 %".271", i32* %".274"
  %".276" = load i32, i32* %".274"
  %".277" = call i32 (i8*, ...) @"printf"(i8* %".273", i32 %".276")
  store i32 1, i32* %".32", align 4
  ; a = 1
  store i32 0, i32* %".35", align 4
  ; b = 0
  store i32 0, i32* %".38", align 4
  ; c = 0
  store i32 1, i32* %".41", align 4
  ; d = 1
  store i32 0, i32* %".44", align 4
  ; e = 0
  %".288" = load i32, i32* %".32", align 4
  ; f = ! a || e && d && 5 < 6
  %".290" = icmp ne i32 %".288", 0
  br i1 %".290", label %".26", label %".24"
.24:
  %".292" = load i32, i32* %".44", align 4
  %".293" = icmp ne i32 %".292", 0
  br i1 %".293", label %".25", label %".26"
.25:
  %".295" = load i32, i32* %".41", align 4
  %".296" = icmp ne i32 %".295", 0
  br label %".26"
.26:
  %".298" = phi  i1 [%".296", %".25"], [0, %".24"], [1, %".23"]
  %".299" = icmp ne i1 %".298", 0
  %".300" = xor i1 %".299", 1
  %".301" = zext i1 %".300" to i32
  store i32 %".301", i32* %".47", align 4
  %".303" = load i32, i32* %".47", align 4
  ; printf "%d" , f
  %".305" = bitcast [3 x i8]* @".str.d" to i8*
  %".306" = alloca i32
  store i32 %".303", i32* %".306"
  %".308" = load i32, i32* %".306"
  %".309" = call i32 (i8*, ...) @"printf"(i8* %".305", i32 %".308")
  %".310" = load i32, i32* %".32", align 4
  ; g = a < d && e >= b
  %".312" = load i32, i32* %".41", align 4
  %".313" = icmp slt i32 %".310", %".312"
  br i1 %".313", label %".27", label %".28"
.27:
  %".315" = load i32, i32* %".44", align 4
  %".316" = load i32, i32* %".35", align 4
  %".317" = icmp sge i32 %".315", %".316"
  br label %".28"
.28:
  %".319" = phi  i1 [0, %".26"], [%".317", %".27"]
  %".320" = zext i1 %".319" to i32
  store i32 %".320", i32* %".50", align 4
  %".322" = load i32, i32* %".50", align 4
  ; printf "%d" , g
  %".324" = bitcast [3 x i8]* @".str.d" to i8*
  %".325" = alloca i32
  store i32 %".322", i32* %".325"
  %".327" = load i32, i32* %".325"
  %".328" = call i32 (i8*, ...) @"printf"(i8* %".324", i32 %".327")
  %".329" = load i32, i32* %".32", align 4
  ; h = a - b < d && ! e > g
  %".331" = load i32, i32* %".35", align 4
  %".332" = sub i32 %".329", %".331"
  %".333" = load i32, i32* %".41", align 4
  %".334" = icmp slt i32 %".332", %".333"
  br i1 %".334", label %".29", label %".30"
.29:
  %".336" = load i32, i32* %".44", align 4
  %".337" = load i32, i32* %".50", align 4
  %".338" = icmp sgt i32 %".336", %".337"
  %".339" = icmp ne i1 %".338", 0
  %".340" = xor i1 %".339", 1
  br label %".30"
.30:
  %".342" = phi  i1 [0, %".28"], [%".340", %".29"]
  %".343" = zext i1 %".342" to i32
  store i32 %".343", i32* %".53", align 4
  %".345" = load i32, i32* %".53", align 4
  ; printf "%d" , h
  %".347" = bitcast [3 x i8]* @".str.d" to i8*
  %".348" = alloca i32
  store i32 %".345", i32* %".348"
  %".350" = load i32, i32* %".348"
  %".351" = call i32 (i8*, ...) @"printf"(i8* %".347", i32 %".350")
  ret i32 0
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"
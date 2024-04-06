; ModuleID = "tests/test14.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 0, i32* %".3", align 4
  ; INT a = 0
  %".6" = alloca i32, align 4
  store i32 0, i32* %".6", align 4
  ; INT b = 0
  %".9" = alloca i32, align 4
  store i32 0, i32* %".9", align 4
  ; INT c = 0
  %".12" = alloca i32, align 4
  store i32 0, i32* %".12", align 4
  ; INT d = 0
  %".15" = alloca i32, align 4
  store i32 0, i32* %".15", align 4
  ; INT e = 0
  %".18" = alloca i32, align 4
  store i32 0, i32* %".18", align 4
  ; INT f = 0
  store i32 0, i32* %".3", align 4
  ; a = 0
  store i32 0, i32* %".6", align 4
  ; b = 0
  store i32 0, i32* %".9", align 4
  ; c = 0
  store i32 0, i32* %".12", align 4
  ; d = 0
  store i32 0, i32* %".15", align 4
  ; e = 0
  %".31" = load i32, i32* %".3", align 4
  ; f = a && ! b || c || ! b && ! d || e && ! a
  %".33" = icmp ne i32 %".31", 0
  br i1 %".33", label %".34", label %".40"
.34:
  %".35" = load i32, i32* %".6", align 4
  %".36" = icmp ne i32 %".35", 0
  br i1 %".36", label %".40", label %".37"
.37:
  %".38" = load i32, i32* %".9", align 4
  %".39" = icmp ne i32 %".38", 0
  br i1 %".39", label %".40", label %".55"
.40:
  %".41" = load i32, i32* %".6", align 4
  %".42" = icmp ne i32 %".41", 0
  br i1 %".42", label %".43", label %".47"
.43:
  %".44" = load i32, i32* %".12", align 4
  %".45" = icmp ne i32 %".44", 0
  %".46" = xor i1 %".45", 1
  br i1 %".46", label %".55", label %".47"
.47:
  %".48" = load i32, i32* %".15", align 4
  %".49" = icmp ne i32 %".48", 0
  br i1 %".49", label %".50", label %".55"
.50:
  %".51" = load i32, i32* %".3", align 4
  %".52" = icmp ne i32 %".51", 0
  %".53" = xor i1 %".52", 1
  %".54" = xor i1 %".53", 1
  br label %".55"
.55:
  %".56" = phi  i1 [1, %".37"], [0, %".43"], [1, %".47"], [%".54", %".50"]
  %".57" = zext i1 %".56" to i32
  store i32 %".57", i32* %".18", align 4
  %".59" = load i32, i32* %".18", align 4
  ; printf "%d" , f
  %".61" = bitcast [3 x i8]* @".str.d" to i8*
  %".62" = alloca i32
  store i32 %".59", i32* %".62"
  %".64" = load i32, i32* %".62"
  %".65" = call i32 (i8*, ...) @"printf"(i8* %".61", i32 %".64")
  store i32 1, i32* %".3", align 4
  ; a = 1
  %".68" = load i32, i32* %".3", align 4
  ; f = a && ! b || c
  %".70" = icmp ne i32 %".68", 0
  br i1 %".70", label %".71", label %".78"
.71:
  %".72" = load i32, i32* %".6", align 4
  %".73" = icmp ne i32 %".72", 0
  br i1 %".73", label %".78", label %".74"
.74:
  %".75" = load i32, i32* %".9", align 4
  %".76" = icmp ne i32 %".75", 0
  %".77" = xor i1 %".76", 1
  br label %".78"
.78:
  %".79" = phi  i1 [0, %".55"], [0, %".71"], [%".77", %".74"]
  %".80" = zext i1 %".79" to i32
  store i32 %".80", i32* %".18", align 4
  %".82" = load i32, i32* %".18", align 4
  ; printf "%d" , f
  %".84" = bitcast [3 x i8]* @".str.d" to i8*
  %".85" = alloca i32
  store i32 %".82", i32* %".85"
  %".87" = load i32, i32* %".85"
  %".88" = call i32 (i8*, ...) @"printf"(i8* %".84", i32 %".87")
  %".89" = load i32, i32* %".3", align 4
  ; f = a && ! b || c || ! b && ! d
  %".91" = icmp ne i32 %".89", 0
  br i1 %".91", label %".92", label %".98"
.92:
  %".93" = load i32, i32* %".6", align 4
  %".94" = icmp ne i32 %".93", 0
  br i1 %".94", label %".98", label %".95"
.95:
  %".96" = load i32, i32* %".9", align 4
  %".97" = icmp ne i32 %".96", 0
  br i1 %".97", label %".98", label %".106"
.98:
  %".99" = load i32, i32* %".6", align 4
  %".100" = icmp ne i32 %".99", 0
  br i1 %".100", label %".101", label %".106"
.101:
  %".102" = load i32, i32* %".12", align 4
  %".103" = icmp ne i32 %".102", 0
  %".104" = xor i1 %".103", 1
  %".105" = xor i1 %".104", 1
  br label %".106"
.106:
  %".107" = phi  i1 [%".105", %".101"], [1, %".95"], [1, %".98"]
  %".108" = zext i1 %".107" to i32
  store i32 %".108", i32* %".18", align 4
  %".110" = load i32, i32* %".18", align 4
  ; printf "%d" , f
  %".112" = bitcast [3 x i8]* @".str.d" to i8*
  %".113" = alloca i32
  store i32 %".110", i32* %".113"
  %".115" = load i32, i32* %".113"
  %".116" = call i32 (i8*, ...) @"printf"(i8* %".112", i32 %".115")
  store i32 0, i32* %".3", align 4
  ; a = 0
  store i32 1, i32* %".6", align 4
  ; b = 1
  %".121" = load i32, i32* %".3", align 4
  ; f = a && ! b || c || ! b && ! d
  %".123" = icmp ne i32 %".121", 0
  br i1 %".123", label %".124", label %".130"
.124:
  %".125" = load i32, i32* %".6", align 4
  %".126" = icmp ne i32 %".125", 0
  br i1 %".126", label %".130", label %".127"
.127:
  %".128" = load i32, i32* %".9", align 4
  %".129" = icmp ne i32 %".128", 0
  br i1 %".129", label %".130", label %".138"
.130:
  %".131" = load i32, i32* %".6", align 4
  %".132" = icmp ne i32 %".131", 0
  br i1 %".132", label %".133", label %".138"
.133:
  %".134" = load i32, i32* %".12", align 4
  %".135" = icmp ne i32 %".134", 0
  %".136" = xor i1 %".135", 1
  %".137" = xor i1 %".136", 1
  br label %".138"
.138:
  %".139" = phi  i1 [1, %".127"], [1, %".130"], [%".137", %".133"]
  %".140" = zext i1 %".139" to i32
  store i32 %".140", i32* %".18", align 4
  %".142" = load i32, i32* %".18", align 4
  ; printf "%d" , f
  %".144" = bitcast [3 x i8]* @".str.d" to i8*
  %".145" = alloca i32
  store i32 %".142", i32* %".145"
  %".147" = load i32, i32* %".145"
  %".148" = call i32 (i8*, ...) @"printf"(i8* %".144", i32 %".147")
  store i32 1, i32* %".3", align 4
  ; a = 1
  store i32 1, i32* %".6", align 4
  ; b = 1
  %".153" = load i32, i32* %".3", align 4
  ; f = a && ! b || c || ! b && ! d
  %".155" = icmp ne i32 %".153", 0
  br i1 %".155", label %".156", label %".162"
.156:
  %".157" = load i32, i32* %".6", align 4
  %".158" = icmp ne i32 %".157", 0
  br i1 %".158", label %".162", label %".159"
.159:
  %".160" = load i32, i32* %".9", align 4
  %".161" = icmp ne i32 %".160", 0
  br i1 %".161", label %".162", label %".170"
.162:
  %".163" = load i32, i32* %".6", align 4
  %".164" = icmp ne i32 %".163", 0
  br i1 %".164", label %".165", label %".170"
.165:
  %".166" = load i32, i32* %".12", align 4
  %".167" = icmp ne i32 %".166", 0
  %".168" = xor i1 %".167", 1
  %".169" = xor i1 %".168", 1
  br label %".170"
.170:
  %".171" = phi  i1 [1, %".159"], [1, %".162"], [%".169", %".165"]
  %".172" = zext i1 %".171" to i32
  store i32 %".172", i32* %".18", align 4
  %".174" = load i32, i32* %".18", align 4
  ; printf "%d" , f
  %".176" = bitcast [3 x i8]* @".str.d" to i8*
  %".177" = alloca i32
  store i32 %".174", i32* %".177"
  %".179" = load i32, i32* %".177"
  %".180" = call i32 (i8*, ...) @"printf"(i8* %".176", i32 %".179")
  store i32 0, i32* %".3", align 4
  ; a = 0
  store i32 0, i32* %".6", align 4
  ; b = 0
  store i32 1, i32* %".9", align 4
  ; c = 1
  %".187" = load i32, i32* %".3", align 4
  ; f = a && ! b || c || ! b && ! d
  %".189" = icmp ne i32 %".187", 0
  br i1 %".189", label %".190", label %".196"
.190:
  %".191" = load i32, i32* %".6", align 4
  %".192" = icmp ne i32 %".191", 0
  br i1 %".192", label %".196", label %".193"
.193:
  %".194" = load i32, i32* %".9", align 4
  %".195" = icmp ne i32 %".194", 0
  br i1 %".195", label %".196", label %".204"
.196:
  %".197" = load i32, i32* %".6", align 4
  %".198" = icmp ne i32 %".197", 0
  br i1 %".198", label %".199", label %".204"
.199:
  %".200" = load i32, i32* %".12", align 4
  %".201" = icmp ne i32 %".200", 0
  %".202" = xor i1 %".201", 1
  %".203" = xor i1 %".202", 1
  br label %".204"
.204:
  %".205" = phi  i1 [1, %".193"], [1, %".196"], [%".203", %".199"]
  %".206" = zext i1 %".205" to i32
  store i32 %".206", i32* %".18", align 4
  %".208" = load i32, i32* %".18", align 4
  ; printf "%d" , f
  %".210" = bitcast [3 x i8]* @".str.d" to i8*
  %".211" = alloca i32
  store i32 %".208", i32* %".211"
  %".213" = load i32, i32* %".211"
  %".214" = call i32 (i8*, ...) @"printf"(i8* %".210", i32 %".213")
  store i32 1, i32* %".3", align 4
  ; a = 1
  store i32 0, i32* %".6", align 4
  ; b = 0
  store i32 1, i32* %".9", align 4
  ; c = 1
  %".221" = load i32, i32* %".3", align 4
  ; f = a && ! b || c || ! b && ! d
  %".223" = icmp ne i32 %".221", 0
  br i1 %".223", label %".224", label %".230"
.224:
  %".225" = load i32, i32* %".6", align 4
  %".226" = icmp ne i32 %".225", 0
  br i1 %".226", label %".230", label %".227"
.227:
  %".228" = load i32, i32* %".9", align 4
  %".229" = icmp ne i32 %".228", 0
  br i1 %".229", label %".230", label %".238"
.230:
  %".231" = load i32, i32* %".6", align 4
  %".232" = icmp ne i32 %".231", 0
  br i1 %".232", label %".233", label %".238"
.233:
  %".234" = load i32, i32* %".12", align 4
  %".235" = icmp ne i32 %".234", 0
  %".236" = xor i1 %".235", 1
  %".237" = xor i1 %".236", 1
  br label %".238"
.238:
  %".239" = phi  i1 [1, %".227"], [1, %".230"], [%".237", %".233"]
  %".240" = zext i1 %".239" to i32
  store i32 %".240", i32* %".18", align 4
  %".242" = load i32, i32* %".18", align 4
  ; printf "%d" , f
  %".244" = bitcast [3 x i8]* @".str.d" to i8*
  %".245" = alloca i32
  store i32 %".242", i32* %".245"
  %".247" = load i32, i32* %".245"
  %".248" = call i32 (i8*, ...) @"printf"(i8* %".244", i32 %".247")
  store i32 0, i32* %".3", align 4
  ; a = 0
  store i32 1, i32* %".6", align 4
  ; b = 1
  store i32 1, i32* %".9", align 4
  ; c = 1
  %".255" = load i32, i32* %".3", align 4
  ; f = a && ! b || c || ! b && ! d
  %".257" = icmp ne i32 %".255", 0
  br i1 %".257", label %".258", label %".264"
.258:
  %".259" = load i32, i32* %".6", align 4
  %".260" = icmp ne i32 %".259", 0
  br i1 %".260", label %".264", label %".261"
.261:
  %".262" = load i32, i32* %".9", align 4
  %".263" = icmp ne i32 %".262", 0
  br i1 %".263", label %".264", label %".272"
.264:
  %".265" = load i32, i32* %".6", align 4
  %".266" = icmp ne i32 %".265", 0
  br i1 %".266", label %".267", label %".272"
.267:
  %".268" = load i32, i32* %".12", align 4
  %".269" = icmp ne i32 %".268", 0
  %".270" = xor i1 %".269", 1
  %".271" = xor i1 %".270", 1
  br label %".272"
.272:
  %".273" = phi  i1 [1, %".261"], [1, %".264"], [%".271", %".267"]
  %".274" = zext i1 %".273" to i32
  store i32 %".274", i32* %".18", align 4
  %".276" = load i32, i32* %".18", align 4
  ; printf "%d" , f
  %".278" = bitcast [3 x i8]* @".str.d" to i8*
  %".279" = alloca i32
  store i32 %".276", i32* %".279"
  %".281" = load i32, i32* %".279"
  %".282" = call i32 (i8*, ...) @"printf"(i8* %".278", i32 %".281")
  store i32 1, i32* %".3", align 4
  ; a = 1
  store i32 1, i32* %".6", align 4
  ; b = 1
  store i32 1, i32* %".9", align 4
  ; c = 1
  %".289" = load i32, i32* %".3", align 4
  ; f = a && ! b || c || ! b && ! d
  %".291" = icmp ne i32 %".289", 0
  br i1 %".291", label %".292", label %".298"
.292:
  %".293" = load i32, i32* %".6", align 4
  %".294" = icmp ne i32 %".293", 0
  br i1 %".294", label %".298", label %".295"
.295:
  %".296" = load i32, i32* %".9", align 4
  %".297" = icmp ne i32 %".296", 0
  br i1 %".297", label %".298", label %".306"
.298:
  %".299" = load i32, i32* %".6", align 4
  %".300" = icmp ne i32 %".299", 0
  br i1 %".300", label %".301", label %".306"
.301:
  %".302" = load i32, i32* %".12", align 4
  %".303" = icmp ne i32 %".302", 0
  %".304" = xor i1 %".303", 1
  %".305" = xor i1 %".304", 1
  br label %".306"
.306:
  %".307" = phi  i1 [1, %".295"], [1, %".298"], [%".305", %".301"]
  %".308" = zext i1 %".307" to i32
  store i32 %".308", i32* %".18", align 4
  %".310" = load i32, i32* %".18", align 4
  ; printf "%d" , f
  %".312" = bitcast [3 x i8]* @".str.d" to i8*
  %".313" = alloca i32
  store i32 %".310", i32* %".313"
  %".315" = load i32, i32* %".313"
  %".316" = call i32 (i8*, ...) @"printf"(i8* %".312", i32 %".315")
  ret i32 0
  ; INT main
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"
; ModuleID = "tests/test15.c"
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
  %".56" = phi  i1 [0, %".43"], [1, %".37"], [1, %".47"], [%".54", %".50"]
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
  %".79" = phi  i1 [%".77", %".74"], [0, %".71"], [0, %".55"]
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
  %".107" = phi  i1 [1, %".95"], [%".105", %".101"], [1, %".98"]
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
  store i32 1, i32* %".12", align 4
  ; d = 1
  %".123" = load i32, i32* %".3", align 4
  ; f = a && ! b || c || ! b && ! d
  %".125" = icmp ne i32 %".123", 0
  br i1 %".125", label %".126", label %".132"
.126:
  %".127" = load i32, i32* %".6", align 4
  %".128" = icmp ne i32 %".127", 0
  br i1 %".128", label %".132", label %".129"
.129:
  %".130" = load i32, i32* %".9", align 4
  %".131" = icmp ne i32 %".130", 0
  br i1 %".131", label %".132", label %".140"
.132:
  %".133" = load i32, i32* %".6", align 4
  %".134" = icmp ne i32 %".133", 0
  br i1 %".134", label %".135", label %".140"
.135:
  %".136" = load i32, i32* %".12", align 4
  %".137" = icmp ne i32 %".136", 0
  %".138" = xor i1 %".137", 1
  %".139" = xor i1 %".138", 1
  br label %".140"
.140:
  %".141" = phi  i1 [%".139", %".135"], [1, %".132"], [1, %".129"]
  %".142" = zext i1 %".141" to i32
  store i32 %".142", i32* %".18", align 4
  %".144" = load i32, i32* %".18", align 4
  ; printf "%d" , f
  %".146" = bitcast [3 x i8]* @".str.d" to i8*
  %".147" = alloca i32
  store i32 %".144", i32* %".147"
  %".149" = load i32, i32* %".147"
  %".150" = call i32 (i8*, ...) @"printf"(i8* %".146", i32 %".149")
  store i32 1, i32* %".3", align 4
  ; a = 1
  store i32 1, i32* %".6", align 4
  ; b = 1
  %".155" = load i32, i32* %".3", align 4
  ; f = a && ! b || c || ! b && ! d
  %".157" = icmp ne i32 %".155", 0
  br i1 %".157", label %".158", label %".164"
.158:
  %".159" = load i32, i32* %".6", align 4
  %".160" = icmp ne i32 %".159", 0
  br i1 %".160", label %".164", label %".161"
.161:
  %".162" = load i32, i32* %".9", align 4
  %".163" = icmp ne i32 %".162", 0
  br i1 %".163", label %".164", label %".172"
.164:
  %".165" = load i32, i32* %".6", align 4
  %".166" = icmp ne i32 %".165", 0
  br i1 %".166", label %".167", label %".172"
.167:
  %".168" = load i32, i32* %".12", align 4
  %".169" = icmp ne i32 %".168", 0
  %".170" = xor i1 %".169", 1
  %".171" = xor i1 %".170", 1
  br label %".172"
.172:
  %".173" = phi  i1 [%".171", %".167"], [1, %".164"], [1, %".161"]
  %".174" = zext i1 %".173" to i32
  store i32 %".174", i32* %".18", align 4
  %".176" = load i32, i32* %".18", align 4
  ; printf "%d" , f
  %".178" = bitcast [3 x i8]* @".str.d" to i8*
  %".179" = alloca i32
  store i32 %".176", i32* %".179"
  %".181" = load i32, i32* %".179"
  %".182" = call i32 (i8*, ...) @"printf"(i8* %".178", i32 %".181")
  store i32 0, i32* %".3", align 4
  ; a = 0
  store i32 0, i32* %".6", align 4
  ; b = 0
  store i32 1, i32* %".9", align 4
  ; c = 1
  %".189" = load i32, i32* %".3", align 4
  ; f = a && ! b || c || ! b && ! d
  %".191" = icmp ne i32 %".189", 0
  br i1 %".191", label %".192", label %".198"
.192:
  %".193" = load i32, i32* %".6", align 4
  %".194" = icmp ne i32 %".193", 0
  br i1 %".194", label %".198", label %".195"
.195:
  %".196" = load i32, i32* %".9", align 4
  %".197" = icmp ne i32 %".196", 0
  br i1 %".197", label %".198", label %".206"
.198:
  %".199" = load i32, i32* %".6", align 4
  %".200" = icmp ne i32 %".199", 0
  br i1 %".200", label %".201", label %".206"
.201:
  %".202" = load i32, i32* %".12", align 4
  %".203" = icmp ne i32 %".202", 0
  %".204" = xor i1 %".203", 1
  %".205" = xor i1 %".204", 1
  br label %".206"
.206:
  %".207" = phi  i1 [1, %".198"], [%".205", %".201"], [1, %".195"]
  %".208" = zext i1 %".207" to i32
  store i32 %".208", i32* %".18", align 4
  %".210" = load i32, i32* %".18", align 4
  ; printf "%d" , f
  %".212" = bitcast [3 x i8]* @".str.d" to i8*
  %".213" = alloca i32
  store i32 %".210", i32* %".213"
  %".215" = load i32, i32* %".213"
  %".216" = call i32 (i8*, ...) @"printf"(i8* %".212", i32 %".215")
  store i32 1, i32* %".3", align 4
  ; a = 1
  store i32 0, i32* %".6", align 4
  ; b = 0
  store i32 1, i32* %".9", align 4
  ; c = 1
  %".223" = load i32, i32* %".3", align 4
  ; f = a && ! b || c || ! b && ! d
  %".225" = icmp ne i32 %".223", 0
  br i1 %".225", label %".226", label %".232"
.226:
  %".227" = load i32, i32* %".6", align 4
  %".228" = icmp ne i32 %".227", 0
  br i1 %".228", label %".232", label %".229"
.229:
  %".230" = load i32, i32* %".9", align 4
  %".231" = icmp ne i32 %".230", 0
  br i1 %".231", label %".232", label %".240"
.232:
  %".233" = load i32, i32* %".6", align 4
  %".234" = icmp ne i32 %".233", 0
  br i1 %".234", label %".235", label %".240"
.235:
  %".236" = load i32, i32* %".12", align 4
  %".237" = icmp ne i32 %".236", 0
  %".238" = xor i1 %".237", 1
  %".239" = xor i1 %".238", 1
  br label %".240"
.240:
  %".241" = phi  i1 [1, %".229"], [%".239", %".235"], [1, %".232"]
  %".242" = zext i1 %".241" to i32
  store i32 %".242", i32* %".18", align 4
  %".244" = load i32, i32* %".18", align 4
  ; printf "%d" , f
  %".246" = bitcast [3 x i8]* @".str.d" to i8*
  %".247" = alloca i32
  store i32 %".244", i32* %".247"
  %".249" = load i32, i32* %".247"
  %".250" = call i32 (i8*, ...) @"printf"(i8* %".246", i32 %".249")
  store i32 0, i32* %".3", align 4
  ; a = 0
  store i32 1, i32* %".6", align 4
  ; b = 1
  store i32 1, i32* %".9", align 4
  ; c = 1
  %".257" = load i32, i32* %".3", align 4
  ; f = a && ! b || c || ! b && ! d
  %".259" = icmp ne i32 %".257", 0
  br i1 %".259", label %".260", label %".266"
.260:
  %".261" = load i32, i32* %".6", align 4
  %".262" = icmp ne i32 %".261", 0
  br i1 %".262", label %".266", label %".263"
.263:
  %".264" = load i32, i32* %".9", align 4
  %".265" = icmp ne i32 %".264", 0
  br i1 %".265", label %".266", label %".274"
.266:
  %".267" = load i32, i32* %".6", align 4
  %".268" = icmp ne i32 %".267", 0
  br i1 %".268", label %".269", label %".274"
.269:
  %".270" = load i32, i32* %".12", align 4
  %".271" = icmp ne i32 %".270", 0
  %".272" = xor i1 %".271", 1
  %".273" = xor i1 %".272", 1
  br label %".274"
.274:
  %".275" = phi  i1 [%".273", %".269"], [1, %".266"], [1, %".263"]
  %".276" = zext i1 %".275" to i32
  store i32 %".276", i32* %".18", align 4
  %".278" = load i32, i32* %".18", align 4
  ; printf "%d" , f
  %".280" = bitcast [3 x i8]* @".str.d" to i8*
  %".281" = alloca i32
  store i32 %".278", i32* %".281"
  %".283" = load i32, i32* %".281"
  %".284" = call i32 (i8*, ...) @"printf"(i8* %".280", i32 %".283")
  store i32 1, i32* %".3", align 4
  ; a = 1
  store i32 1, i32* %".6", align 4
  ; b = 1
  store i32 1, i32* %".9", align 4
  ; c = 1
  %".291" = load i32, i32* %".3", align 4
  ; f = a && ! b || c || ! b && ! d
  %".293" = icmp ne i32 %".291", 0
  br i1 %".293", label %".294", label %".300"
.294:
  %".295" = load i32, i32* %".6", align 4
  %".296" = icmp ne i32 %".295", 0
  br i1 %".296", label %".300", label %".297"
.297:
  %".298" = load i32, i32* %".9", align 4
  %".299" = icmp ne i32 %".298", 0
  br i1 %".299", label %".300", label %".308"
.300:
  %".301" = load i32, i32* %".6", align 4
  %".302" = icmp ne i32 %".301", 0
  br i1 %".302", label %".303", label %".308"
.303:
  %".304" = load i32, i32* %".12", align 4
  %".305" = icmp ne i32 %".304", 0
  %".306" = xor i1 %".305", 1
  %".307" = xor i1 %".306", 1
  br label %".308"
.308:
  %".309" = phi  i1 [1, %".297"], [%".307", %".303"], [1, %".300"]
  %".310" = zext i1 %".309" to i32
  store i32 %".310", i32* %".18", align 4
  %".312" = load i32, i32* %".18", align 4
  ; printf "%d" , f
  %".314" = bitcast [3 x i8]* @".str.d" to i8*
  %".315" = alloca i32
  store i32 %".312", i32* %".315"
  %".317" = load i32, i32* %".315"
  %".318" = call i32 (i8*, ...) @"printf"(i8* %".314", i32 %".317")
  ret i32 0
  ; INT main
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"
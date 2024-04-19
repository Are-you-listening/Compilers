; ModuleID = "tests/test15.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;    INT main
  %".4" = alloca i32, align 4
  store i32 0, i32* %".4", align 4
  ; INT a = 0
  %".7" = alloca i32, align 4
  store i32 0, i32* %".7", align 4
  ; INT b = 0
  %".10" = alloca i32, align 4
  store i32 0, i32* %".10", align 4
  ; INT c = 0
  %".13" = alloca i32, align 4
  store i32 0, i32* %".13", align 4
  ; INT d = 0
  %".16" = alloca i32, align 4
  store i32 0, i32* %".16", align 4
  ; INT e = 0
  %".19" = alloca i32, align 4
  store i32 0, i32* %".19", align 4
  ; INT f = 0
  store i32 0, i32* %".4", align 4
  ;  a = 0
  store i32 0, i32* %".7", align 4
  ; b = 0
  store i32 0, i32* %".10", align 4
  ; c = 0
  store i32 0, i32* %".13", align 4
  ; d = 0
  store i32 0, i32* %".16", align 4
  ; e = 0
  ;  f = a && ! b || c || ! b && ! d || e && ! a
  %".33" = load i32, i32* %".4", align 4
  %".34" = icmp ne i32 %".33", 0
  br i1 %".34", label %".35", label %".41"
.35:
  %".36" = load i32, i32* %".7", align 4
  %".37" = icmp ne i32 %".36", 0
  br i1 %".37", label %".41", label %".38"
.38:
  %".39" = load i32, i32* %".10", align 4
  %".40" = icmp ne i32 %".39", 0
  br i1 %".40", label %".41", label %".56"
.41:
  %".42" = load i32, i32* %".7", align 4
  %".43" = icmp ne i32 %".42", 0
  br i1 %".43", label %".44", label %".48"
.44:
  %".45" = load i32, i32* %".13", align 4
  %".46" = icmp ne i32 %".45", 0
  %".47" = xor i1 %".46", 1
  br i1 %".47", label %".56", label %".48"
.48:
  %".49" = load i32, i32* %".16", align 4
  %".50" = icmp ne i32 %".49", 0
  br i1 %".50", label %".51", label %".56"
.51:
  %".52" = load i32, i32* %".4", align 4
  %".53" = icmp ne i32 %".52", 0
  %".54" = xor i1 %".53", 1
  %".55" = xor i1 %".54", 1
  br label %".56"
.56:
  %".57" = phi  i1 [1, %".38"], [0, %".44"], [1, %".48"], [%".55", %".51"]
  %".58" = zext i1 %".57" to i32
  store i32 %".58", i32* %".19", align 4
  %".60" = load i32, i32* %".19", align 4
  ; printf "%d" f
  %".62" = bitcast [3 x i8]* @".str.d" to i8*
  %".63" = alloca i32
  store i32 %".60", i32* %".63"
  %".65" = load i32, i32* %".63"
  %".66" = call i32 (i8*, ...) @"printf"(i8* %".62", i32 %".65")
  store i32 1, i32* %".4", align 4
  ;  a = 1
  ; f = a && ! b || c
  %".70" = load i32, i32* %".4", align 4
  %".71" = icmp ne i32 %".70", 0
  br i1 %".71", label %".72", label %".79"
.72:
  %".73" = load i32, i32* %".7", align 4
  %".74" = icmp ne i32 %".73", 0
  br i1 %".74", label %".79", label %".75"
.75:
  %".76" = load i32, i32* %".10", align 4
  %".77" = icmp ne i32 %".76", 0
  %".78" = xor i1 %".77", 1
  br label %".79"
.79:
  %".80" = phi  i1 [0, %".56"], [0, %".72"], [%".78", %".75"]
  %".81" = zext i1 %".80" to i32
  store i32 %".81", i32* %".19", align 4
  %".83" = load i32, i32* %".19", align 4
  ; printf "%d" f
  %".85" = bitcast [3 x i8]* @".str.d" to i8*
  %".86" = alloca i32
  store i32 %".83", i32* %".86"
  %".88" = load i32, i32* %".86"
  %".89" = call i32 (i8*, ...) @"printf"(i8* %".85", i32 %".88")
  ;  f = a && ! b || c || ! b && ! d
  %".91" = load i32, i32* %".4", align 4
  %".92" = icmp ne i32 %".91", 0
  br i1 %".92", label %".93", label %".99"
.93:
  %".94" = load i32, i32* %".7", align 4
  %".95" = icmp ne i32 %".94", 0
  br i1 %".95", label %".99", label %".96"
.96:
  %".97" = load i32, i32* %".10", align 4
  %".98" = icmp ne i32 %".97", 0
  br i1 %".98", label %".99", label %".107"
.99:
  %".100" = load i32, i32* %".7", align 4
  %".101" = icmp ne i32 %".100", 0
  br i1 %".101", label %".102", label %".107"
.102:
  %".103" = load i32, i32* %".13", align 4
  %".104" = icmp ne i32 %".103", 0
  %".105" = xor i1 %".104", 1
  %".106" = xor i1 %".105", 1
  br label %".107"
.107:
  %".108" = phi  i1 [%".106", %".102"], [1, %".96"], [1, %".99"]
  %".109" = zext i1 %".108" to i32
  store i32 %".109", i32* %".19", align 4
  %".111" = load i32, i32* %".19", align 4
  ; printf "%d" f
  %".113" = bitcast [3 x i8]* @".str.d" to i8*
  %".114" = alloca i32
  store i32 %".111", i32* %".114"
  %".116" = load i32, i32* %".114"
  %".117" = call i32 (i8*, ...) @"printf"(i8* %".113", i32 %".116")
  store i32 0, i32* %".4", align 4
  ;  a = 0
  store i32 1, i32* %".7", align 4
  ; b = 1
  store i32 1, i32* %".13", align 4
  ; d = 1
  ; f = a && ! b || c || ! b && ! d
  %".125" = load i32, i32* %".4", align 4
  %".126" = icmp ne i32 %".125", 0
  br i1 %".126", label %".127", label %".133"
.127:
  %".128" = load i32, i32* %".7", align 4
  %".129" = icmp ne i32 %".128", 0
  br i1 %".129", label %".133", label %".130"
.130:
  %".131" = load i32, i32* %".10", align 4
  %".132" = icmp ne i32 %".131", 0
  br i1 %".132", label %".133", label %".141"
.133:
  %".134" = load i32, i32* %".7", align 4
  %".135" = icmp ne i32 %".134", 0
  br i1 %".135", label %".136", label %".141"
.136:
  %".137" = load i32, i32* %".13", align 4
  %".138" = icmp ne i32 %".137", 0
  %".139" = xor i1 %".138", 1
  %".140" = xor i1 %".139", 1
  br label %".141"
.141:
  %".142" = phi  i1 [1, %".130"], [1, %".133"], [%".140", %".136"]
  %".143" = zext i1 %".142" to i32
  store i32 %".143", i32* %".19", align 4
  %".145" = load i32, i32* %".19", align 4
  ; printf "%d" f
  %".147" = bitcast [3 x i8]* @".str.d" to i8*
  %".148" = alloca i32
  store i32 %".145", i32* %".148"
  %".150" = load i32, i32* %".148"
  %".151" = call i32 (i8*, ...) @"printf"(i8* %".147", i32 %".150")
  store i32 1, i32* %".4", align 4
  ;  a = 1
  store i32 1, i32* %".7", align 4
  ; b = 1
  ; f = a && ! b || c || ! b && ! d
  %".157" = load i32, i32* %".4", align 4
  %".158" = icmp ne i32 %".157", 0
  br i1 %".158", label %".159", label %".165"
.159:
  %".160" = load i32, i32* %".7", align 4
  %".161" = icmp ne i32 %".160", 0
  br i1 %".161", label %".165", label %".162"
.162:
  %".163" = load i32, i32* %".10", align 4
  %".164" = icmp ne i32 %".163", 0
  br i1 %".164", label %".165", label %".173"
.165:
  %".166" = load i32, i32* %".7", align 4
  %".167" = icmp ne i32 %".166", 0
  br i1 %".167", label %".168", label %".173"
.168:
  %".169" = load i32, i32* %".13", align 4
  %".170" = icmp ne i32 %".169", 0
  %".171" = xor i1 %".170", 1
  %".172" = xor i1 %".171", 1
  br label %".173"
.173:
  %".174" = phi  i1 [1, %".162"], [1, %".165"], [%".172", %".168"]
  %".175" = zext i1 %".174" to i32
  store i32 %".175", i32* %".19", align 4
  %".177" = load i32, i32* %".19", align 4
  ; printf "%d" f
  %".179" = bitcast [3 x i8]* @".str.d" to i8*
  %".180" = alloca i32
  store i32 %".177", i32* %".180"
  %".182" = load i32, i32* %".180"
  %".183" = call i32 (i8*, ...) @"printf"(i8* %".179", i32 %".182")
  store i32 0, i32* %".4", align 4
  ;  a = 0
  store i32 0, i32* %".7", align 4
  ; b = 0
  store i32 1, i32* %".10", align 4
  ; c = 1
  ; f = a && ! b || c || ! b && ! d
  %".191" = load i32, i32* %".4", align 4
  %".192" = icmp ne i32 %".191", 0
  br i1 %".192", label %".193", label %".199"
.193:
  %".194" = load i32, i32* %".7", align 4
  %".195" = icmp ne i32 %".194", 0
  br i1 %".195", label %".199", label %".196"
.196:
  %".197" = load i32, i32* %".10", align 4
  %".198" = icmp ne i32 %".197", 0
  br i1 %".198", label %".199", label %".207"
.199:
  %".200" = load i32, i32* %".7", align 4
  %".201" = icmp ne i32 %".200", 0
  br i1 %".201", label %".202", label %".207"
.202:
  %".203" = load i32, i32* %".13", align 4
  %".204" = icmp ne i32 %".203", 0
  %".205" = xor i1 %".204", 1
  %".206" = xor i1 %".205", 1
  br label %".207"
.207:
  %".208" = phi  i1 [1, %".196"], [1, %".199"], [%".206", %".202"]
  %".209" = zext i1 %".208" to i32
  store i32 %".209", i32* %".19", align 4
  %".211" = load i32, i32* %".19", align 4
  ; printf "%d" f
  %".213" = bitcast [3 x i8]* @".str.d" to i8*
  %".214" = alloca i32
  store i32 %".211", i32* %".214"
  %".216" = load i32, i32* %".214"
  %".217" = call i32 (i8*, ...) @"printf"(i8* %".213", i32 %".216")
  store i32 1, i32* %".4", align 4
  ;  a = 1
  store i32 0, i32* %".7", align 4
  ; b = 0
  store i32 1, i32* %".10", align 4
  ; c = 1
  ; f = a && ! b || c || ! b && ! d
  %".225" = load i32, i32* %".4", align 4
  %".226" = icmp ne i32 %".225", 0
  br i1 %".226", label %".227", label %".233"
.227:
  %".228" = load i32, i32* %".7", align 4
  %".229" = icmp ne i32 %".228", 0
  br i1 %".229", label %".233", label %".230"
.230:
  %".231" = load i32, i32* %".10", align 4
  %".232" = icmp ne i32 %".231", 0
  br i1 %".232", label %".233", label %".241"
.233:
  %".234" = load i32, i32* %".7", align 4
  %".235" = icmp ne i32 %".234", 0
  br i1 %".235", label %".236", label %".241"
.236:
  %".237" = load i32, i32* %".13", align 4
  %".238" = icmp ne i32 %".237", 0
  %".239" = xor i1 %".238", 1
  %".240" = xor i1 %".239", 1
  br label %".241"
.241:
  %".242" = phi  i1 [1, %".230"], [1, %".233"], [%".240", %".236"]
  %".243" = zext i1 %".242" to i32
  store i32 %".243", i32* %".19", align 4
  %".245" = load i32, i32* %".19", align 4
  ; printf "%d" f
  %".247" = bitcast [3 x i8]* @".str.d" to i8*
  %".248" = alloca i32
  store i32 %".245", i32* %".248"
  %".250" = load i32, i32* %".248"
  %".251" = call i32 (i8*, ...) @"printf"(i8* %".247", i32 %".250")
  store i32 0, i32* %".4", align 4
  ;  a = 0
  store i32 1, i32* %".7", align 4
  ; b = 1
  store i32 1, i32* %".10", align 4
  ; c = 1
  ; f = a && ! b || c || ! b && ! d
  %".259" = load i32, i32* %".4", align 4
  %".260" = icmp ne i32 %".259", 0
  br i1 %".260", label %".261", label %".267"
.261:
  %".262" = load i32, i32* %".7", align 4
  %".263" = icmp ne i32 %".262", 0
  br i1 %".263", label %".267", label %".264"
.264:
  %".265" = load i32, i32* %".10", align 4
  %".266" = icmp ne i32 %".265", 0
  br i1 %".266", label %".267", label %".275"
.267:
  %".268" = load i32, i32* %".7", align 4
  %".269" = icmp ne i32 %".268", 0
  br i1 %".269", label %".270", label %".275"
.270:
  %".271" = load i32, i32* %".13", align 4
  %".272" = icmp ne i32 %".271", 0
  %".273" = xor i1 %".272", 1
  %".274" = xor i1 %".273", 1
  br label %".275"
.275:
  %".276" = phi  i1 [1, %".264"], [1, %".267"], [%".274", %".270"]
  %".277" = zext i1 %".276" to i32
  store i32 %".277", i32* %".19", align 4
  %".279" = load i32, i32* %".19", align 4
  ; printf "%d" f
  %".281" = bitcast [3 x i8]* @".str.d" to i8*
  %".282" = alloca i32
  store i32 %".279", i32* %".282"
  %".284" = load i32, i32* %".282"
  %".285" = call i32 (i8*, ...) @"printf"(i8* %".281", i32 %".284")
  store i32 1, i32* %".4", align 4
  ;  a = 1
  store i32 1, i32* %".7", align 4
  ; b = 1
  store i32 1, i32* %".10", align 4
  ; c = 1
  ; f = a && ! b || c || ! b && ! d
  %".293" = load i32, i32* %".4", align 4
  %".294" = icmp ne i32 %".293", 0
  br i1 %".294", label %".295", label %".301"
.295:
  %".296" = load i32, i32* %".7", align 4
  %".297" = icmp ne i32 %".296", 0
  br i1 %".297", label %".301", label %".298"
.298:
  %".299" = load i32, i32* %".10", align 4
  %".300" = icmp ne i32 %".299", 0
  br i1 %".300", label %".301", label %".309"
.301:
  %".302" = load i32, i32* %".7", align 4
  %".303" = icmp ne i32 %".302", 0
  br i1 %".303", label %".304", label %".309"
.304:
  %".305" = load i32, i32* %".13", align 4
  %".306" = icmp ne i32 %".305", 0
  %".307" = xor i1 %".306", 1
  %".308" = xor i1 %".307", 1
  br label %".309"
.309:
  %".310" = phi  i1 [1, %".298"], [1, %".301"], [%".308", %".304"]
  %".311" = zext i1 %".310" to i32
  store i32 %".311", i32* %".19", align 4
  %".313" = load i32, i32* %".19", align 4
  ; printf "%d" f
  %".315" = bitcast [3 x i8]* @".str.d" to i8*
  %".316" = alloca i32
  store i32 %".313", i32* %".316"
  %".318" = load i32, i32* %".316"
  %".319" = call i32 (i8*, ...) @"printf"(i8* %".315", i32 %".318")
  ret i32 0
  ;    return 0
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"
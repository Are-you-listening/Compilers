; ModuleID = "tests/test17.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;  #include <stdio.h>   INT main
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
  %".22" = alloca i32, align 4
  store i32 0, i32* %".22", align 4
  ; INT g = 0
  %".25" = alloca i32, align 4
  store i32 0, i32* %".25", align 4
  ; INT h = 0
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
  ;  f = ! a || e && d && 5 < 6
  %".39" = load i32, i32* %".4", align 4
  %".40" = icmp ne i32 %".39", 0
  br i1 %".40", label %".47", label %".41"
.41:
  %".42" = load i32, i32* %".16", align 4
  %".43" = icmp ne i32 %".42", 0
  br i1 %".43", label %".44", label %".47"
.44:
  %".45" = load i32, i32* %".13", align 4
  %".46" = icmp ne i32 %".45", 0
  br label %".47"
.47:
  %".48" = phi  i1 [1, %".2"], [0, %".41"], [%".46", %".44"]
  %".49" = icmp ne i1 %".48", 0
  %".50" = xor i1 %".49", 1
  %".51" = zext i1 %".50" to i32
  store i32 %".51", i32* %".19", align 4
  %".53" = load i32, i32* %".19", align 4
  ; printf "%d" f
  %".55" = bitcast [3 x i8]* @".str.d" to i8*
  %".56" = alloca i32
  store i32 %".53", i32* %".56"
  %".58" = load i32, i32* %".56"
  %".59" = call i32 (i8*, ...) @"printf"(i8* %".55", i32 %".58")
  %".60" = load i32, i32* %".4", align 4
  ; g = a < d && e >= b
  %".62" = load i32, i32* %".13", align 4
  %".63" = icmp slt i32 %".60", %".62"
  br i1 %".63", label %".64", label %".68"
.64:
  %".65" = load i32, i32* %".16", align 4
  %".66" = load i32, i32* %".7", align 4
  %".67" = icmp sge i32 %".65", %".66"
  br label %".68"
.68:
  %".69" = phi  i1 [0, %".47"], [%".67", %".64"]
  %".70" = zext i1 %".69" to i32
  store i32 %".70", i32* %".22", align 4
  %".72" = load i32, i32* %".22", align 4
  ; printf "%d" g
  %".74" = bitcast [3 x i8]* @".str.d" to i8*
  %".75" = alloca i32
  store i32 %".72", i32* %".75"
  %".77" = load i32, i32* %".75"
  %".78" = call i32 (i8*, ...) @"printf"(i8* %".74", i32 %".77")
  %".79" = load i32, i32* %".4", align 4
  ; h = a - b < d && ! e > g
  %".81" = load i32, i32* %".7", align 4
  %".82" = sub i32 %".79", %".81"
  %".83" = load i32, i32* %".13", align 4
  %".84" = icmp slt i32 %".82", %".83"
  br i1 %".84", label %".85", label %".91"
.85:
  %".86" = load i32, i32* %".16", align 4
  %".87" = load i32, i32* %".22", align 4
  %".88" = icmp sgt i32 %".86", %".87"
  %".89" = icmp ne i1 %".88", 0
  %".90" = xor i1 %".89", 1
  br label %".91"
.91:
  %".92" = phi  i1 [0, %".68"], [%".90", %".85"]
  %".93" = zext i1 %".92" to i32
  store i32 %".93", i32* %".25", align 4
  %".95" = load i32, i32* %".25", align 4
  ; printf "%d" h
  %".97" = bitcast [3 x i8]* @".str.d" to i8*
  %".98" = alloca i32
  store i32 %".95", i32* %".98"
  %".100" = load i32, i32* %".98"
  %".101" = call i32 (i8*, ...) @"printf"(i8* %".97", i32 %".100")
  store i32 0, i32* %".4", align 4
  ;  a = 0
  store i32 1, i32* %".7", align 4
  ; b = 1
  store i32 0, i32* %".10", align 4
  ; c = 0
  store i32 1, i32* %".13", align 4
  ; d = 1
  store i32 0, i32* %".16", align 4
  ; e = 0
  ;  f = ! a || e && d && 5 < 6
  %".113" = load i32, i32* %".4", align 4
  %".114" = icmp ne i32 %".113", 0
  br i1 %".114", label %".121", label %".115"
.115:
  %".116" = load i32, i32* %".16", align 4
  %".117" = icmp ne i32 %".116", 0
  br i1 %".117", label %".118", label %".121"
.118:
  %".119" = load i32, i32* %".13", align 4
  %".120" = icmp ne i32 %".119", 0
  br label %".121"
.121:
  %".122" = phi  i1 [0, %".115"], [%".120", %".118"], [1, %".91"]
  %".123" = icmp ne i1 %".122", 0
  %".124" = xor i1 %".123", 1
  %".125" = zext i1 %".124" to i32
  store i32 %".125", i32* %".19", align 4
  %".127" = load i32, i32* %".19", align 4
  ; printf "%d" f
  %".129" = bitcast [3 x i8]* @".str.d" to i8*
  %".130" = alloca i32
  store i32 %".127", i32* %".130"
  %".132" = load i32, i32* %".130"
  %".133" = call i32 (i8*, ...) @"printf"(i8* %".129", i32 %".132")
  %".134" = load i32, i32* %".4", align 4
  ; g = a < d && e >= b
  %".136" = load i32, i32* %".13", align 4
  %".137" = icmp slt i32 %".134", %".136"
  br i1 %".137", label %".138", label %".142"
.138:
  %".139" = load i32, i32* %".16", align 4
  %".140" = load i32, i32* %".7", align 4
  %".141" = icmp sge i32 %".139", %".140"
  br label %".142"
.142:
  %".143" = phi  i1 [0, %".121"], [%".141", %".138"]
  %".144" = zext i1 %".143" to i32
  store i32 %".144", i32* %".22", align 4
  %".146" = load i32, i32* %".22", align 4
  ; printf "%d" g
  %".148" = bitcast [3 x i8]* @".str.d" to i8*
  %".149" = alloca i32
  store i32 %".146", i32* %".149"
  %".151" = load i32, i32* %".149"
  %".152" = call i32 (i8*, ...) @"printf"(i8* %".148", i32 %".151")
  %".153" = load i32, i32* %".4", align 4
  ; h = a - b < d && ! e > g
  %".155" = load i32, i32* %".7", align 4
  %".156" = sub i32 %".153", %".155"
  %".157" = load i32, i32* %".13", align 4
  %".158" = icmp slt i32 %".156", %".157"
  br i1 %".158", label %".159", label %".165"
.159:
  %".160" = load i32, i32* %".16", align 4
  %".161" = load i32, i32* %".22", align 4
  %".162" = icmp sgt i32 %".160", %".161"
  %".163" = icmp ne i1 %".162", 0
  %".164" = xor i1 %".163", 1
  br label %".165"
.165:
  %".166" = phi  i1 [0, %".142"], [%".164", %".159"]
  %".167" = zext i1 %".166" to i32
  store i32 %".167", i32* %".25", align 4
  %".169" = load i32, i32* %".25", align 4
  ; printf "%d" h
  %".171" = bitcast [3 x i8]* @".str.d" to i8*
  %".172" = alloca i32
  store i32 %".169", i32* %".172"
  %".174" = load i32, i32* %".172"
  %".175" = call i32 (i8*, ...) @"printf"(i8* %".171", i32 %".174")
  store i32 1, i32* %".4", align 4
  ;  a = 1
  store i32 0, i32* %".7", align 4
  ; b = 0
  store i32 0, i32* %".10", align 4
  ; c = 0
  store i32 1, i32* %".13", align 4
  ; d = 1
  store i32 1, i32* %".16", align 4
  ; e = 1
  ;  f = ! a || e && d && 5 < 6
  %".187" = load i32, i32* %".4", align 4
  %".188" = icmp ne i32 %".187", 0
  br i1 %".188", label %".195", label %".189"
.189:
  %".190" = load i32, i32* %".16", align 4
  %".191" = icmp ne i32 %".190", 0
  br i1 %".191", label %".192", label %".195"
.192:
  %".193" = load i32, i32* %".13", align 4
  %".194" = icmp ne i32 %".193", 0
  br label %".195"
.195:
  %".196" = phi  i1 [1, %".165"], [0, %".189"], [%".194", %".192"]
  %".197" = icmp ne i1 %".196", 0
  %".198" = xor i1 %".197", 1
  %".199" = zext i1 %".198" to i32
  store i32 %".199", i32* %".19", align 4
  %".201" = load i32, i32* %".19", align 4
  ; printf "%d" f
  %".203" = bitcast [3 x i8]* @".str.d" to i8*
  %".204" = alloca i32
  store i32 %".201", i32* %".204"
  %".206" = load i32, i32* %".204"
  %".207" = call i32 (i8*, ...) @"printf"(i8* %".203", i32 %".206")
  %".208" = load i32, i32* %".4", align 4
  ; g = a < d && e >= b
  %".210" = load i32, i32* %".13", align 4
  %".211" = icmp slt i32 %".208", %".210"
  br i1 %".211", label %".212", label %".216"
.212:
  %".213" = load i32, i32* %".16", align 4
  %".214" = load i32, i32* %".7", align 4
  %".215" = icmp sge i32 %".213", %".214"
  br label %".216"
.216:
  %".217" = phi  i1 [0, %".195"], [%".215", %".212"]
  %".218" = zext i1 %".217" to i32
  store i32 %".218", i32* %".22", align 4
  %".220" = load i32, i32* %".22", align 4
  ; printf "%d" g
  %".222" = bitcast [3 x i8]* @".str.d" to i8*
  %".223" = alloca i32
  store i32 %".220", i32* %".223"
  %".225" = load i32, i32* %".223"
  %".226" = call i32 (i8*, ...) @"printf"(i8* %".222", i32 %".225")
  %".227" = load i32, i32* %".4", align 4
  ; h = a - b < d && ! e > g
  %".229" = load i32, i32* %".7", align 4
  %".230" = sub i32 %".227", %".229"
  %".231" = load i32, i32* %".13", align 4
  %".232" = icmp slt i32 %".230", %".231"
  br i1 %".232", label %".233", label %".239"
.233:
  %".234" = load i32, i32* %".16", align 4
  %".235" = load i32, i32* %".22", align 4
  %".236" = icmp sgt i32 %".234", %".235"
  %".237" = icmp ne i1 %".236", 0
  %".238" = xor i1 %".237", 1
  br label %".239"
.239:
  %".240" = phi  i1 [0, %".216"], [%".238", %".233"]
  %".241" = zext i1 %".240" to i32
  store i32 %".241", i32* %".25", align 4
  %".243" = load i32, i32* %".25", align 4
  ; printf "%d" h
  %".245" = bitcast [3 x i8]* @".str.d" to i8*
  %".246" = alloca i32
  store i32 %".243", i32* %".246"
  %".248" = load i32, i32* %".246"
  %".249" = call i32 (i8*, ...) @"printf"(i8* %".245", i32 %".248")
  store i32 1, i32* %".4", align 4
  ;  a = 1
  store i32 1, i32* %".7", align 4
  ; b = 1
  store i32 1, i32* %".10", align 4
  ; c = 1
  store i32 1, i32* %".13", align 4
  ; d = 1
  store i32 1, i32* %".16", align 4
  ; e = 1
  ;  f = ! a || e && d && 5 < 6
  %".261" = load i32, i32* %".4", align 4
  %".262" = icmp ne i32 %".261", 0
  br i1 %".262", label %".269", label %".263"
.263:
  %".264" = load i32, i32* %".16", align 4
  %".265" = icmp ne i32 %".264", 0
  br i1 %".265", label %".266", label %".269"
.266:
  %".267" = load i32, i32* %".13", align 4
  %".268" = icmp ne i32 %".267", 0
  br label %".269"
.269:
  %".270" = phi  i1 [1, %".239"], [0, %".263"], [%".268", %".266"]
  %".271" = icmp ne i1 %".270", 0
  %".272" = xor i1 %".271", 1
  %".273" = zext i1 %".272" to i32
  store i32 %".273", i32* %".19", align 4
  %".275" = load i32, i32* %".19", align 4
  ; printf "%d" f
  %".277" = bitcast [3 x i8]* @".str.d" to i8*
  %".278" = alloca i32
  store i32 %".275", i32* %".278"
  %".280" = load i32, i32* %".278"
  %".281" = call i32 (i8*, ...) @"printf"(i8* %".277", i32 %".280")
  %".282" = load i32, i32* %".4", align 4
  ; g = a < d && e >= b
  %".284" = load i32, i32* %".13", align 4
  %".285" = icmp slt i32 %".282", %".284"
  br i1 %".285", label %".286", label %".290"
.286:
  %".287" = load i32, i32* %".16", align 4
  %".288" = load i32, i32* %".7", align 4
  %".289" = icmp sge i32 %".287", %".288"
  br label %".290"
.290:
  %".291" = phi  i1 [0, %".269"], [%".289", %".286"]
  %".292" = zext i1 %".291" to i32
  store i32 %".292", i32* %".22", align 4
  %".294" = load i32, i32* %".22", align 4
  ; printf "%d" g
  %".296" = bitcast [3 x i8]* @".str.d" to i8*
  %".297" = alloca i32
  store i32 %".294", i32* %".297"
  %".299" = load i32, i32* %".297"
  %".300" = call i32 (i8*, ...) @"printf"(i8* %".296", i32 %".299")
  %".301" = load i32, i32* %".4", align 4
  ; h = a - b < d && ! e > g
  %".303" = load i32, i32* %".7", align 4
  %".304" = sub i32 %".301", %".303"
  %".305" = load i32, i32* %".13", align 4
  %".306" = icmp slt i32 %".304", %".305"
  br i1 %".306", label %".307", label %".313"
.307:
  %".308" = load i32, i32* %".16", align 4
  %".309" = load i32, i32* %".22", align 4
  %".310" = icmp sgt i32 %".308", %".309"
  %".311" = icmp ne i1 %".310", 0
  %".312" = xor i1 %".311", 1
  br label %".313"
.313:
  %".314" = phi  i1 [0, %".290"], [%".312", %".307"]
  %".315" = zext i1 %".314" to i32
  store i32 %".315", i32* %".25", align 4
  %".317" = load i32, i32* %".25", align 4
  ; printf "%d" h
  %".319" = bitcast [3 x i8]* @".str.d" to i8*
  %".320" = alloca i32
  store i32 %".317", i32* %".320"
  %".322" = load i32, i32* %".320"
  %".323" = call i32 (i8*, ...) @"printf"(i8* %".319", i32 %".322")
  ret i32 0
  ;   return 0
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"
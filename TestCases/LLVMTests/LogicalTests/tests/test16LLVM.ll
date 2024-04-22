; ModuleID = "tests/test16.c"
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
  br i1 %".40", label %".48", label %".41"
.41:
  %".42" = load i32, i32* %".16", align 4
  %".43" = icmp ne i32 %".42", 0
  br i1 %".43", label %".44", label %".48"
.44:
  %".45" = load i32, i32* %".13", align 4
  %".46" = icmp ne i32 %".45", 0
  %".47" = icmp ne i1 %".46", 0
  br label %".48"
.48:
  %".49" = phi  i1 [1, %".2"], [0, %".41"], [%".47", %".44"]
  %".50" = icmp ne i1 %".49", 0
  %".51" = xor i1 %".50", 1
  %".52" = zext i1 %".51" to i32
  store i32 %".52", i32* %".19", align 4
  %".54" = load i32, i32* %".19", align 4
  ; printf "%d" f
  %".56" = bitcast [3 x i8]* @".str.0" to i8*
  %".57" = alloca i32
  store i32 %".54", i32* %".57"
  %".59" = load i32, i32* %".57"
  %".60" = call i32 (i8*, ...) @"printf"(i8* %".56", i32 %".59")
  %".61" = load i32, i32* %".4", align 4
  ; g = a < d && e >= b
  %".63" = load i32, i32* %".13", align 4
  %".64" = icmp slt i32 %".61", %".63"
  br i1 %".64", label %".65", label %".69"
.65:
  %".66" = load i32, i32* %".16", align 4
  %".67" = load i32, i32* %".7", align 4
  %".68" = icmp sge i32 %".66", %".67"
  br label %".69"
.69:
  %".70" = phi  i1 [0, %".48"], [%".68", %".65"]
  %".71" = zext i1 %".70" to i32
  store i32 %".71", i32* %".22", align 4
  %".73" = load i32, i32* %".22", align 4
  ; printf "%d" g
  %".75" = bitcast [3 x i8]* @".str.0" to i8*
  %".76" = alloca i32
  store i32 %".73", i32* %".76"
  %".78" = load i32, i32* %".76"
  %".79" = call i32 (i8*, ...) @"printf"(i8* %".75", i32 %".78")
  %".80" = load i32, i32* %".4", align 4
  ; h = a - b < d && ! e > g
  %".82" = load i32, i32* %".7", align 4
  %".83" = sub i32 %".80", %".82"
  %".84" = load i32, i32* %".13", align 4
  %".85" = icmp slt i32 %".83", %".84"
  br i1 %".85", label %".86", label %".92"
.86:
  %".87" = load i32, i32* %".16", align 4
  %".88" = load i32, i32* %".22", align 4
  %".89" = icmp sgt i32 %".87", %".88"
  %".90" = icmp ne i1 %".89", 0
  %".91" = xor i1 %".90", 1
  br label %".92"
.92:
  %".93" = phi  i1 [0, %".69"], [%".91", %".86"]
  %".94" = zext i1 %".93" to i32
  store i32 %".94", i32* %".25", align 4
  %".96" = load i32, i32* %".25", align 4
  ; printf "%d" h
  %".98" = bitcast [3 x i8]* @".str.0" to i8*
  %".99" = alloca i32
  store i32 %".96", i32* %".99"
  %".101" = load i32, i32* %".99"
  %".102" = call i32 (i8*, ...) @"printf"(i8* %".98", i32 %".101")
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
  %".114" = load i32, i32* %".4", align 4
  %".115" = icmp ne i32 %".114", 0
  br i1 %".115", label %".123", label %".116"
.116:
  %".117" = load i32, i32* %".16", align 4
  %".118" = icmp ne i32 %".117", 0
  br i1 %".118", label %".119", label %".123"
.119:
  %".120" = load i32, i32* %".13", align 4
  %".121" = icmp ne i32 %".120", 0
  %".122" = icmp ne i1 %".121", 0
  br label %".123"
.123:
  %".124" = phi  i1 [0, %".116"], [%".122", %".119"], [1, %".92"]
  %".125" = icmp ne i1 %".124", 0
  %".126" = xor i1 %".125", 1
  %".127" = zext i1 %".126" to i32
  store i32 %".127", i32* %".19", align 4
  %".129" = load i32, i32* %".19", align 4
  ; printf "%d" f
  %".131" = bitcast [3 x i8]* @".str.0" to i8*
  %".132" = alloca i32
  store i32 %".129", i32* %".132"
  %".134" = load i32, i32* %".132"
  %".135" = call i32 (i8*, ...) @"printf"(i8* %".131", i32 %".134")
  %".136" = load i32, i32* %".4", align 4
  ; g = a < d && e >= b
  %".138" = load i32, i32* %".13", align 4
  %".139" = icmp slt i32 %".136", %".138"
  br i1 %".139", label %".140", label %".144"
.140:
  %".141" = load i32, i32* %".16", align 4
  %".142" = load i32, i32* %".7", align 4
  %".143" = icmp sge i32 %".141", %".142"
  br label %".144"
.144:
  %".145" = phi  i1 [0, %".123"], [%".143", %".140"]
  %".146" = zext i1 %".145" to i32
  store i32 %".146", i32* %".22", align 4
  %".148" = load i32, i32* %".22", align 4
  ; printf "%d" g
  %".150" = bitcast [3 x i8]* @".str.0" to i8*
  %".151" = alloca i32
  store i32 %".148", i32* %".151"
  %".153" = load i32, i32* %".151"
  %".154" = call i32 (i8*, ...) @"printf"(i8* %".150", i32 %".153")
  %".155" = load i32, i32* %".4", align 4
  ; h = a - b < d && ! e > g
  %".157" = load i32, i32* %".7", align 4
  %".158" = sub i32 %".155", %".157"
  %".159" = load i32, i32* %".13", align 4
  %".160" = icmp slt i32 %".158", %".159"
  br i1 %".160", label %".161", label %".167"
.161:
  %".162" = load i32, i32* %".16", align 4
  %".163" = load i32, i32* %".22", align 4
  %".164" = icmp sgt i32 %".162", %".163"
  %".165" = icmp ne i1 %".164", 0
  %".166" = xor i1 %".165", 1
  br label %".167"
.167:
  %".168" = phi  i1 [0, %".144"], [%".166", %".161"]
  %".169" = zext i1 %".168" to i32
  store i32 %".169", i32* %".25", align 4
  %".171" = load i32, i32* %".25", align 4
  ; printf "%d" h
  %".173" = bitcast [3 x i8]* @".str.0" to i8*
  %".174" = alloca i32
  store i32 %".171", i32* %".174"
  %".176" = load i32, i32* %".174"
  %".177" = call i32 (i8*, ...) @"printf"(i8* %".173", i32 %".176")
  store i32 1, i32* %".4", align 4
  ;   a = 1
  store i32 1, i32* %".7", align 4
  ; b = 1
  store i32 1, i32* %".10", align 4
  ; c = 1
  store i32 1, i32* %".13", align 4
  ; d = 1
  store i32 0, i32* %".16", align 4
  ; e = 0
  ;  f = ! a || e && d && 5 < 6
  %".189" = load i32, i32* %".4", align 4
  %".190" = icmp ne i32 %".189", 0
  br i1 %".190", label %".198", label %".191"
.191:
  %".192" = load i32, i32* %".16", align 4
  %".193" = icmp ne i32 %".192", 0
  br i1 %".193", label %".194", label %".198"
.194:
  %".195" = load i32, i32* %".13", align 4
  %".196" = icmp ne i32 %".195", 0
  %".197" = icmp ne i1 %".196", 0
  br label %".198"
.198:
  %".199" = phi  i1 [1, %".167"], [0, %".191"], [%".197", %".194"]
  %".200" = icmp ne i1 %".199", 0
  %".201" = xor i1 %".200", 1
  %".202" = zext i1 %".201" to i32
  store i32 %".202", i32* %".19", align 4
  %".204" = load i32, i32* %".19", align 4
  ; printf "%d" f
  %".206" = bitcast [3 x i8]* @".str.0" to i8*
  %".207" = alloca i32
  store i32 %".204", i32* %".207"
  %".209" = load i32, i32* %".207"
  %".210" = call i32 (i8*, ...) @"printf"(i8* %".206", i32 %".209")
  %".211" = load i32, i32* %".4", align 4
  ; g = a < d && e >= b
  %".213" = load i32, i32* %".13", align 4
  %".214" = icmp slt i32 %".211", %".213"
  br i1 %".214", label %".215", label %".219"
.215:
  %".216" = load i32, i32* %".16", align 4
  %".217" = load i32, i32* %".7", align 4
  %".218" = icmp sge i32 %".216", %".217"
  br label %".219"
.219:
  %".220" = phi  i1 [0, %".198"], [%".218", %".215"]
  %".221" = zext i1 %".220" to i32
  store i32 %".221", i32* %".22", align 4
  %".223" = load i32, i32* %".22", align 4
  ; printf "%d" g
  %".225" = bitcast [3 x i8]* @".str.0" to i8*
  %".226" = alloca i32
  store i32 %".223", i32* %".226"
  %".228" = load i32, i32* %".226"
  %".229" = call i32 (i8*, ...) @"printf"(i8* %".225", i32 %".228")
  %".230" = load i32, i32* %".4", align 4
  ; h = a - b < d && ! e > g
  %".232" = load i32, i32* %".7", align 4
  %".233" = sub i32 %".230", %".232"
  %".234" = load i32, i32* %".13", align 4
  %".235" = icmp slt i32 %".233", %".234"
  br i1 %".235", label %".236", label %".242"
.236:
  %".237" = load i32, i32* %".16", align 4
  %".238" = load i32, i32* %".22", align 4
  %".239" = icmp sgt i32 %".237", %".238"
  %".240" = icmp ne i1 %".239", 0
  %".241" = xor i1 %".240", 1
  br label %".242"
.242:
  %".243" = phi  i1 [0, %".219"], [%".241", %".236"]
  %".244" = zext i1 %".243" to i32
  store i32 %".244", i32* %".25", align 4
  %".246" = load i32, i32* %".25", align 4
  ; printf "%d" h
  %".248" = bitcast [3 x i8]* @".str.0" to i8*
  %".249" = alloca i32
  store i32 %".246", i32* %".249"
  %".251" = load i32, i32* %".249"
  %".252" = call i32 (i8*, ...) @"printf"(i8* %".248", i32 %".251")
  store i32 1, i32* %".4", align 4
  ;  a = 1
  store i32 0, i32* %".7", align 4
  ; b = 0
  store i32 0, i32* %".10", align 4
  ; c = 0
  store i32 1, i32* %".13", align 4
  ; d = 1
  store i32 0, i32* %".16", align 4
  ; e = 0
  ;  f = ! a || e && d && 5 < 6
  %".264" = load i32, i32* %".4", align 4
  %".265" = icmp ne i32 %".264", 0
  br i1 %".265", label %".273", label %".266"
.266:
  %".267" = load i32, i32* %".16", align 4
  %".268" = icmp ne i32 %".267", 0
  br i1 %".268", label %".269", label %".273"
.269:
  %".270" = load i32, i32* %".13", align 4
  %".271" = icmp ne i32 %".270", 0
  %".272" = icmp ne i1 %".271", 0
  br label %".273"
.273:
  %".274" = phi  i1 [1, %".242"], [0, %".266"], [%".272", %".269"]
  %".275" = icmp ne i1 %".274", 0
  %".276" = xor i1 %".275", 1
  %".277" = zext i1 %".276" to i32
  store i32 %".277", i32* %".19", align 4
  %".279" = load i32, i32* %".19", align 4
  ; printf "%d" f
  %".281" = bitcast [3 x i8]* @".str.0" to i8*
  %".282" = alloca i32
  store i32 %".279", i32* %".282"
  %".284" = load i32, i32* %".282"
  %".285" = call i32 (i8*, ...) @"printf"(i8* %".281", i32 %".284")
  %".286" = load i32, i32* %".4", align 4
  ; g = a < d && e >= b
  %".288" = load i32, i32* %".13", align 4
  %".289" = icmp slt i32 %".286", %".288"
  br i1 %".289", label %".290", label %".294"
.290:
  %".291" = load i32, i32* %".16", align 4
  %".292" = load i32, i32* %".7", align 4
  %".293" = icmp sge i32 %".291", %".292"
  br label %".294"
.294:
  %".295" = phi  i1 [0, %".273"], [%".293", %".290"]
  %".296" = zext i1 %".295" to i32
  store i32 %".296", i32* %".22", align 4
  %".298" = load i32, i32* %".22", align 4
  ; printf "%d" g
  %".300" = bitcast [3 x i8]* @".str.0" to i8*
  %".301" = alloca i32
  store i32 %".298", i32* %".301"
  %".303" = load i32, i32* %".301"
  %".304" = call i32 (i8*, ...) @"printf"(i8* %".300", i32 %".303")
  %".305" = load i32, i32* %".4", align 4
  ; h = a - b < d && ! e > g
  %".307" = load i32, i32* %".7", align 4
  %".308" = sub i32 %".305", %".307"
  %".309" = load i32, i32* %".13", align 4
  %".310" = icmp slt i32 %".308", %".309"
  br i1 %".310", label %".311", label %".317"
.311:
  %".312" = load i32, i32* %".16", align 4
  %".313" = load i32, i32* %".22", align 4
  %".314" = icmp sgt i32 %".312", %".313"
  %".315" = icmp ne i1 %".314", 0
  %".316" = xor i1 %".315", 1
  br label %".317"
.317:
  %".318" = phi  i1 [0, %".294"], [%".316", %".311"]
  %".319" = zext i1 %".318" to i32
  store i32 %".319", i32* %".25", align 4
  %".321" = load i32, i32* %".25", align 4
  ; printf "%d" h
  %".323" = bitcast [3 x i8]* @".str.0" to i8*
  %".324" = alloca i32
  store i32 %".321", i32* %".324"
  %".326" = load i32, i32* %".324"
  %".327" = call i32 (i8*, ...) @"printf"(i8* %".323", i32 %".326")
  ret i32 0
  ;   return 0
}

@".str.0" = internal constant [3 x i8] c"%d\00"
declare i32 @"printf"(i8* %".1", ...)

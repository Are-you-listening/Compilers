; ModuleID = "tests/test16.c"
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
  %".21" = alloca i32, align 4
  store i32 0, i32* %".21", align 4
  ; INT g = 0
  %".24" = alloca i32, align 4
  store i32 0, i32* %".24", align 4
  ; INT h = 0
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
  %".37" = load i32, i32* %".3", align 4
  ; f = ! a || e && d && 5 < 6
  %".39" = icmp ne i32 %".37", 0
  br i1 %".39", label %".46", label %".40"
.40:
  %".41" = load i32, i32* %".15", align 4
  %".42" = icmp ne i32 %".41", 0
  br i1 %".42", label %".43", label %".46"
.43:
  %".44" = load i32, i32* %".12", align 4
  %".45" = icmp ne i32 %".44", 0
  br label %".46"
.46:
  %".50" = phi  i1 [%".45", %".43"], [1, %".2"], [0, %".40"]
  %".51" = icmp ne i1 %".50", 0
  %".52" = xor i1 %".51", 1
  %".53" = zext i1 %".52" to i32
  store i32 %".53", i32* %".18", align 4
  %".55" = load i32, i32* %".18", align 4
  ; printf " %d " , f
  %".57" = bitcast [3 x i8]* @".str.d" to i8*
  %".58" = alloca i32
  store i32 %".55", i32* %".58"
  %".60" = load i32, i32* %".58"
  %".61" = call i32 (i8*, ...) @"printf"(i8* %".57", i32 %".60")
  %".62" = load i32, i32* %".3", align 4
  ; g = a < d && e >= b
  %".64" = load i32, i32* %".12", align 4
  %".65" = icmp slt i32 %".62", %".64"
  br i1 %".65", label %".66", label %".70"
.66:
  %".67" = load i32, i32* %".15", align 4
  %".68" = load i32, i32* %".6", align 4
  %".69" = icmp sge i32 %".67", %".68"
  br label %".70"
.70:
  %".73" = phi  i1 [0, %".46"], [%".69", %".66"]
  %".74" = zext i1 %".73" to i32
  store i32 %".74", i32* %".21", align 4
  %".76" = load i32, i32* %".21", align 4
  ; printf " %d " , g
  %".78" = bitcast [3 x i8]* @".str.d" to i8*
  %".79" = alloca i32
  store i32 %".76", i32* %".79"
  %".81" = load i32, i32* %".79"
  %".82" = call i32 (i8*, ...) @"printf"(i8* %".78", i32 %".81")
  %".83" = load i32, i32* %".3", align 4
  ; h = a - b < d && ! e > g
  %".85" = load i32, i32* %".6", align 4
  %".86" = sub i32 %".83", %".85"
  %".87" = load i32, i32* %".12", align 4
  %".88" = icmp slt i32 %".86", %".87"
  br i1 %".88", label %".89", label %".95"
.89:
  %".90" = load i32, i32* %".15", align 4
  %".91" = load i32, i32* %".21", align 4
  %".92" = icmp sgt i32 %".90", %".91"
  %".93" = icmp ne i1 %".92", 0
  %".94" = xor i1 %".93", 1
  br label %".95"
.95:
  %".98" = phi  i1 [0, %".70"], [%".94", %".89"]
  %".99" = zext i1 %".98" to i32
  store i32 %".99", i32* %".24", align 4
  %".101" = load i32, i32* %".24", align 4
  ; printf " %d " , h
  %".103" = bitcast [3 x i8]* @".str.d" to i8*
  %".104" = alloca i32
  store i32 %".101", i32* %".104"
  %".106" = load i32, i32* %".104"
  %".107" = call i32 (i8*, ...) @"printf"(i8* %".103", i32 %".106")
  store i32 0, i32* %".3", align 4
  ; a = 0
  store i32 1, i32* %".6", align 4
  ; b = 1
  store i32 0, i32* %".9", align 4
  ; c = 0
  store i32 1, i32* %".12", align 4
  ; d = 1
  store i32 0, i32* %".15", align 4
  ; e = 0
  %".118" = load i32, i32* %".3", align 4
  ; f = ! a || e && d && 5 < 6
  %".120" = icmp ne i32 %".118", 0
  br i1 %".120", label %".127", label %".121"
.121:
  %".122" = load i32, i32* %".15", align 4
  %".123" = icmp ne i32 %".122", 0
  br i1 %".123", label %".124", label %".127"
.124:
  %".125" = load i32, i32* %".12", align 4
  %".126" = icmp ne i32 %".125", 0
  br label %".127"
.127:
  %".131" = phi  i1 [1, %".95"], [%".126", %".124"], [0, %".121"]
  %".132" = icmp ne i1 %".131", 0
  %".133" = xor i1 %".132", 1
  %".134" = zext i1 %".133" to i32
  store i32 %".134", i32* %".18", align 4
  %".136" = load i32, i32* %".18", align 4
  ; printf " %d " , f
  %".138" = bitcast [3 x i8]* @".str.d" to i8*
  %".139" = alloca i32
  store i32 %".136", i32* %".139"
  %".141" = load i32, i32* %".139"
  %".142" = call i32 (i8*, ...) @"printf"(i8* %".138", i32 %".141")
  %".143" = load i32, i32* %".3", align 4
  ; g = a < d && e >= b
  %".145" = load i32, i32* %".12", align 4
  %".146" = icmp slt i32 %".143", %".145"
  br i1 %".146", label %".147", label %".151"
.147:
  %".148" = load i32, i32* %".15", align 4
  %".149" = load i32, i32* %".6", align 4
  %".150" = icmp sge i32 %".148", %".149"
  br label %".151"
.151:
  %".154" = phi  i1 [0, %".127"], [%".150", %".147"]
  %".155" = zext i1 %".154" to i32
  store i32 %".155", i32* %".21", align 4
  %".157" = load i32, i32* %".21", align 4
  ; printf " %d " , g
  %".159" = bitcast [3 x i8]* @".str.d" to i8*
  %".160" = alloca i32
  store i32 %".157", i32* %".160"
  %".162" = load i32, i32* %".160"
  %".163" = call i32 (i8*, ...) @"printf"(i8* %".159", i32 %".162")
  %".164" = load i32, i32* %".3", align 4
  ; h = a - b < d && ! e > g
  %".166" = load i32, i32* %".6", align 4
  %".167" = sub i32 %".164", %".166"
  %".168" = load i32, i32* %".12", align 4
  %".169" = icmp slt i32 %".167", %".168"
  br i1 %".169", label %".170", label %".176"
.170:
  %".171" = load i32, i32* %".15", align 4
  %".172" = load i32, i32* %".21", align 4
  %".173" = icmp sgt i32 %".171", %".172"
  %".174" = icmp ne i1 %".173", 0
  %".175" = xor i1 %".174", 1
  br label %".176"
.176:
  %".179" = phi  i1 [%".175", %".170"], [0, %".151"]
  %".180" = zext i1 %".179" to i32
  store i32 %".180", i32* %".24", align 4
  %".182" = load i32, i32* %".24", align 4
  ; printf " %d " , h
  %".184" = bitcast [3 x i8]* @".str.d" to i8*
  %".185" = alloca i32
  store i32 %".182", i32* %".185"
  %".187" = load i32, i32* %".185"
  %".188" = call i32 (i8*, ...) @"printf"(i8* %".184", i32 %".187")
  store i32 1, i32* %".3", align 4
  ; a = 1
  store i32 1, i32* %".6", align 4
  ; b = 1
  store i32 1, i32* %".9", align 4
  ; c = 1
  store i32 1, i32* %".12", align 4
  ; d = 1
  store i32 0, i32* %".15", align 4
  ; e = 0
  %".199" = load i32, i32* %".3", align 4
  ; f = ! a || e && d && 5 < 6
  %".201" = icmp ne i32 %".199", 0
  br i1 %".201", label %".208", label %".202"
.202:
  %".203" = load i32, i32* %".15", align 4
  %".204" = icmp ne i32 %".203", 0
  br i1 %".204", label %".205", label %".208"
.205:
  %".206" = load i32, i32* %".12", align 4
  %".207" = icmp ne i32 %".206", 0
  br label %".208"
.208:
  %".212" = phi  i1 [%".207", %".205"], [1, %".176"], [0, %".202"]
  %".213" = icmp ne i1 %".212", 0
  %".214" = xor i1 %".213", 1
  %".215" = zext i1 %".214" to i32
  store i32 %".215", i32* %".18", align 4
  %".217" = load i32, i32* %".18", align 4
  ; printf " %d " , f
  %".219" = bitcast [3 x i8]* @".str.d" to i8*
  %".220" = alloca i32
  store i32 %".217", i32* %".220"
  %".222" = load i32, i32* %".220"
  %".223" = call i32 (i8*, ...) @"printf"(i8* %".219", i32 %".222")
  %".224" = load i32, i32* %".3", align 4
  ; g = a < d && e >= b
  %".226" = load i32, i32* %".12", align 4
  %".227" = icmp slt i32 %".224", %".226"
  br i1 %".227", label %".228", label %".232"
.228:
  %".229" = load i32, i32* %".15", align 4
  %".230" = load i32, i32* %".6", align 4
  %".231" = icmp sge i32 %".229", %".230"
  br label %".232"
.232:
  %".235" = phi  i1 [0, %".208"], [%".231", %".228"]
  %".236" = zext i1 %".235" to i32
  store i32 %".236", i32* %".21", align 4
  %".238" = load i32, i32* %".21", align 4
  ; printf " %d " , g
  %".240" = bitcast [3 x i8]* @".str.d" to i8*
  %".241" = alloca i32
  store i32 %".238", i32* %".241"
  %".243" = load i32, i32* %".241"
  %".244" = call i32 (i8*, ...) @"printf"(i8* %".240", i32 %".243")
  %".245" = load i32, i32* %".3", align 4
  ; h = a - b < d && ! e > g
  %".247" = load i32, i32* %".6", align 4
  %".248" = sub i32 %".245", %".247"
  %".249" = load i32, i32* %".12", align 4
  %".250" = icmp slt i32 %".248", %".249"
  br i1 %".250", label %".251", label %".257"
.251:
  %".252" = load i32, i32* %".15", align 4
  %".253" = load i32, i32* %".21", align 4
  %".254" = icmp sgt i32 %".252", %".253"
  %".255" = icmp ne i1 %".254", 0
  %".256" = xor i1 %".255", 1
  br label %".257"
.257:
  %".260" = phi  i1 [0, %".232"], [%".256", %".251"]
  %".261" = zext i1 %".260" to i32
  store i32 %".261", i32* %".24", align 4
  %".263" = load i32, i32* %".24", align 4
  ; printf " %d " , h
  %".265" = bitcast [3 x i8]* @".str.d" to i8*
  %".266" = alloca i32
  store i32 %".263", i32* %".266"
  %".268" = load i32, i32* %".266"
  %".269" = call i32 (i8*, ...) @"printf"(i8* %".265", i32 %".268")
  store i32 1, i32* %".3", align 4
  ; a = 1
  store i32 0, i32* %".6", align 4
  ; b = 0
  store i32 0, i32* %".9", align 4
  ; c = 0
  store i32 1, i32* %".12", align 4
  ; d = 1
  store i32 0, i32* %".15", align 4
  ; e = 0
  %".280" = load i32, i32* %".3", align 4
  ; f = ! a || e && d && 5 < 6
  %".282" = icmp ne i32 %".280", 0
  br i1 %".282", label %".289", label %".283"
.283:
  %".284" = load i32, i32* %".15", align 4
  %".285" = icmp ne i32 %".284", 0
  br i1 %".285", label %".286", label %".289"
.286:
  %".287" = load i32, i32* %".12", align 4
  %".288" = icmp ne i32 %".287", 0
  br label %".289"
.289:
  %".293" = phi  i1 [0, %".283"], [%".288", %".286"], [1, %".257"]
  %".294" = icmp ne i1 %".293", 0
  %".295" = xor i1 %".294", 1
  %".296" = zext i1 %".295" to i32
  store i32 %".296", i32* %".18", align 4
  %".298" = load i32, i32* %".18", align 4
  ; printf " %d " , f
  %".300" = bitcast [3 x i8]* @".str.d" to i8*
  %".301" = alloca i32
  store i32 %".298", i32* %".301"
  %".303" = load i32, i32* %".301"
  %".304" = call i32 (i8*, ...) @"printf"(i8* %".300", i32 %".303")
  %".305" = load i32, i32* %".3", align 4
  ; g = a < d && e >= b
  %".307" = load i32, i32* %".12", align 4
  %".308" = icmp slt i32 %".305", %".307"
  br i1 %".308", label %".309", label %".313"
.309:
  %".310" = load i32, i32* %".15", align 4
  %".311" = load i32, i32* %".6", align 4
  %".312" = icmp sge i32 %".310", %".311"
  br label %".313"
.313:
  %".316" = phi  i1 [%".312", %".309"], [0, %".289"]
  %".317" = zext i1 %".316" to i32
  store i32 %".317", i32* %".21", align 4
  %".319" = load i32, i32* %".21", align 4
  ; printf " %d " , g
  %".321" = bitcast [3 x i8]* @".str.d" to i8*
  %".322" = alloca i32
  store i32 %".319", i32* %".322"
  %".324" = load i32, i32* %".322"
  %".325" = call i32 (i8*, ...) @"printf"(i8* %".321", i32 %".324")
  %".326" = load i32, i32* %".3", align 4
  ; h = a - b < d && ! e > g
  %".328" = load i32, i32* %".6", align 4
  %".329" = sub i32 %".326", %".328"
  %".330" = load i32, i32* %".12", align 4
  %".331" = icmp slt i32 %".329", %".330"
  br i1 %".331", label %".332", label %".338"
.332:
  %".333" = load i32, i32* %".15", align 4
  %".334" = load i32, i32* %".21", align 4
  %".335" = icmp sgt i32 %".333", %".334"
  %".336" = icmp ne i1 %".335", 0
  %".337" = xor i1 %".336", 1
  br label %".338"
.338:
  %".341" = phi  i1 [0, %".313"], [%".337", %".332"]
  %".342" = zext i1 %".341" to i32
  store i32 %".342", i32* %".24", align 4
  %".344" = load i32, i32* %".24", align 4
  ; printf " %d " , h
  %".346" = bitcast [3 x i8]* @".str.d" to i8*
  %".347" = alloca i32
  store i32 %".344", i32* %".347"
  %".349" = load i32, i32* %".347"
  %".350" = call i32 (i8*, ...) @"printf"(i8* %".346", i32 %".349")
  ret i32 0
  ; INT main
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"
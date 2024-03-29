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
  br i1 %".39", label %".40", label %".54"
.40:
  %".41" = load i32, i32* %".6", align 4
  %".42" = icmp ne i32 %".41", 0
  br i1 %".42", label %".43", label %".47"
.43:
  %".44" = load i32, i32* %".12", align 4
  %".45" = icmp ne i32 %".44", 0
  %".46" = xor i1 %".45", 1
  br i1 %".46", label %".54", label %".47"
.47:
  %".48" = load i32, i32* %".15", align 4
  %".49" = icmp ne i32 %".48", 0
  br i1 %".49", label %".50", label %".54"
.50:
  %".51" = load i32, i32* %".3", align 4
  %".52" = icmp ne i32 %".51", 0
  %".53" = xor i1 %".52", 1
  %".61" = xor i1 %".53", 1
  br label %".54"
.54:
  %".63" = phi  i1 [0, %".43"], [%".61", %".50"], [1, %".37"], [1, %".47"]
  %".64" = zext i1 %".63" to i32
  store i32 %".64", i32* %".18", align 4
  %".66" = load i32, i32* %".18", align 4
  ; printf " %d " , f
  %".68" = bitcast [3 x i8]* @".str.d" to i8*
  %".69" = alloca i32
  store i32 %".66", i32* %".69"
  %".71" = load i32, i32* %".69"
  %".72" = call i32 (i8*, ...) @"printf"(i8* %".68", i32 %".71")
  store i32 1, i32* %".3", align 4
  ; a = 1
  %".75" = load i32, i32* %".3", align 4
  ; f = a && ! b || c
  %".77" = icmp ne i32 %".75", 0
  br i1 %".77", label %".78", label %".84"
.78:
  %".79" = load i32, i32* %".6", align 4
  %".80" = icmp ne i32 %".79", 0
  br i1 %".80", label %".84", label %".81"
.81:
  %".82" = load i32, i32* %".9", align 4
  %".83" = icmp ne i32 %".82", 0
  %".87" = xor i1 %".83", 1
  br label %".84"
.84:
  %".89" = phi  i1 [0, %".54"], [0, %".78"], [%".87", %".81"]
  %".90" = zext i1 %".89" to i32
  store i32 %".90", i32* %".18", align 4
  %".92" = load i32, i32* %".18", align 4
  ; printf " %d " , f
  %".94" = bitcast [3 x i8]* @".str.d" to i8*
  %".95" = alloca i32
  store i32 %".92", i32* %".95"
  %".97" = load i32, i32* %".95"
  %".98" = call i32 (i8*, ...) @"printf"(i8* %".94", i32 %".97")
  %".99" = load i32, i32* %".3", align 4
  ; f = a && ! b || c || ! b && ! d
  %".101" = icmp ne i32 %".99", 0
  br i1 %".101", label %".102", label %".108"
.102:
  %".103" = load i32, i32* %".6", align 4
  %".104" = icmp ne i32 %".103", 0
  br i1 %".104", label %".108", label %".105"
.105:
  %".106" = load i32, i32* %".9", align 4
  %".107" = icmp ne i32 %".106", 0
  br i1 %".107", label %".108", label %".115"
.108:
  %".109" = load i32, i32* %".6", align 4
  %".110" = icmp ne i32 %".109", 0
  br i1 %".110", label %".111", label %".115"
.111:
  %".112" = load i32, i32* %".12", align 4
  %".113" = icmp ne i32 %".112", 0
  %".114" = xor i1 %".113", 1
  %".118" = xor i1 %".114", 1
  br label %".115"
.115:
  %".122" = phi  i1 [1, %".105"], [1, %".108"], [%".118", %".111"]
  %".123" = zext i1 %".122" to i32
  store i32 %".123", i32* %".18", align 4
  %".125" = load i32, i32* %".18", align 4
  ; printf " %d " , f
  %".127" = bitcast [3 x i8]* @".str.d" to i8*
  %".128" = alloca i32
  store i32 %".125", i32* %".128"
  %".130" = load i32, i32* %".128"
  %".131" = call i32 (i8*, ...) @"printf"(i8* %".127", i32 %".130")
  store i32 0, i32* %".3", align 4
  ; a = 0
  store i32 1, i32* %".6", align 4
  ; b = 1
  %".136" = load i32, i32* %".3", align 4
  ; f = a && ! b || c || ! b && ! d
  %".138" = icmp ne i32 %".136", 0
  br i1 %".138", label %".139", label %".145"
.139:
  %".140" = load i32, i32* %".6", align 4
  %".141" = icmp ne i32 %".140", 0
  br i1 %".141", label %".145", label %".142"
.142:
  %".143" = load i32, i32* %".9", align 4
  %".144" = icmp ne i32 %".143", 0
  br i1 %".144", label %".145", label %".152"
.145:
  %".146" = load i32, i32* %".6", align 4
  %".147" = icmp ne i32 %".146", 0
  br i1 %".147", label %".148", label %".152"
.148:
  %".149" = load i32, i32* %".12", align 4
  %".150" = icmp ne i32 %".149", 0
  %".151" = xor i1 %".150", 1
  %".155" = xor i1 %".151", 1
  br label %".152"
.152:
  %".159" = phi  i1 [1, %".142"], [1, %".145"], [%".155", %".148"]
  %".160" = zext i1 %".159" to i32
  store i32 %".160", i32* %".18", align 4
  %".162" = load i32, i32* %".18", align 4
  ; printf " %d " , f
  %".164" = bitcast [3 x i8]* @".str.d" to i8*
  %".165" = alloca i32
  store i32 %".162", i32* %".165"
  %".167" = load i32, i32* %".165"
  %".168" = call i32 (i8*, ...) @"printf"(i8* %".164", i32 %".167")
  store i32 1, i32* %".3", align 4
  ; a = 1
  store i32 1, i32* %".6", align 4
  ; b = 1
  %".173" = load i32, i32* %".3", align 4
  ; f = a && ! b || c || ! b && ! d
  %".175" = icmp ne i32 %".173", 0
  br i1 %".175", label %".176", label %".182"
.176:
  %".177" = load i32, i32* %".6", align 4
  %".178" = icmp ne i32 %".177", 0
  br i1 %".178", label %".182", label %".179"
.179:
  %".180" = load i32, i32* %".9", align 4
  %".181" = icmp ne i32 %".180", 0
  br i1 %".181", label %".182", label %".189"
.182:
  %".183" = load i32, i32* %".6", align 4
  %".184" = icmp ne i32 %".183", 0
  br i1 %".184", label %".185", label %".189"
.185:
  %".186" = load i32, i32* %".12", align 4
  %".187" = icmp ne i32 %".186", 0
  %".188" = xor i1 %".187", 1
  %".193" = xor i1 %".188", 1
  br label %".189"
.189:
  %".196" = phi  i1 [1, %".182"], [%".193", %".185"], [1, %".179"]
  %".197" = zext i1 %".196" to i32
  store i32 %".197", i32* %".18", align 4
  %".199" = load i32, i32* %".18", align 4
  ; printf " %d " , f
  %".201" = bitcast [3 x i8]* @".str.d" to i8*
  %".202" = alloca i32
  store i32 %".199", i32* %".202"
  %".204" = load i32, i32* %".202"
  %".205" = call i32 (i8*, ...) @"printf"(i8* %".201", i32 %".204")
  store i32 0, i32* %".3", align 4
  ; a = 0
  store i32 0, i32* %".6", align 4
  ; b = 0
  store i32 1, i32* %".9", align 4
  ; c = 1
  %".212" = load i32, i32* %".3", align 4
  ; f = a && ! b || c || ! b && ! d
  %".214" = icmp ne i32 %".212", 0
  br i1 %".214", label %".215", label %".221"
.215:
  %".216" = load i32, i32* %".6", align 4
  %".217" = icmp ne i32 %".216", 0
  br i1 %".217", label %".221", label %".218"
.218:
  %".219" = load i32, i32* %".9", align 4
  %".220" = icmp ne i32 %".219", 0
  br i1 %".220", label %".221", label %".228"
.221:
  %".222" = load i32, i32* %".6", align 4
  %".223" = icmp ne i32 %".222", 0
  br i1 %".223", label %".224", label %".228"
.224:
  %".225" = load i32, i32* %".12", align 4
  %".226" = icmp ne i32 %".225", 0
  %".227" = xor i1 %".226", 1
  %".232" = xor i1 %".227", 1
  br label %".228"
.228:
  %".235" = phi  i1 [1, %".221"], [1, %".218"], [%".232", %".224"]
  %".236" = zext i1 %".235" to i32
  store i32 %".236", i32* %".18", align 4
  %".238" = load i32, i32* %".18", align 4
  ; printf " %d " , f
  %".240" = bitcast [3 x i8]* @".str.d" to i8*
  %".241" = alloca i32
  store i32 %".238", i32* %".241"
  %".243" = load i32, i32* %".241"
  %".244" = call i32 (i8*, ...) @"printf"(i8* %".240", i32 %".243")
  store i32 1, i32* %".3", align 4
  ; a = 1
  store i32 0, i32* %".6", align 4
  ; b = 0
  store i32 1, i32* %".9", align 4
  ; c = 1
  %".251" = load i32, i32* %".3", align 4
  ; f = a && ! b || c || ! b && ! d
  %".253" = icmp ne i32 %".251", 0
  br i1 %".253", label %".254", label %".260"
.254:
  %".255" = load i32, i32* %".6", align 4
  %".256" = icmp ne i32 %".255", 0
  br i1 %".256", label %".260", label %".257"
.257:
  %".258" = load i32, i32* %".9", align 4
  %".259" = icmp ne i32 %".258", 0
  br i1 %".259", label %".260", label %".267"
.260:
  %".261" = load i32, i32* %".6", align 4
  %".262" = icmp ne i32 %".261", 0
  br i1 %".262", label %".263", label %".267"
.263:
  %".264" = load i32, i32* %".12", align 4
  %".265" = icmp ne i32 %".264", 0
  %".266" = xor i1 %".265", 1
  %".272" = xor i1 %".266", 1
  br label %".267"
.267:
  %".274" = phi  i1 [1, %".260"], [1, %".257"], [%".272", %".263"]
  %".275" = zext i1 %".274" to i32
  store i32 %".275", i32* %".18", align 4
  %".277" = load i32, i32* %".18", align 4
  ; printf " %d " , f
  %".279" = bitcast [3 x i8]* @".str.d" to i8*
  %".280" = alloca i32
  store i32 %".277", i32* %".280"
  %".282" = load i32, i32* %".280"
  %".283" = call i32 (i8*, ...) @"printf"(i8* %".279", i32 %".282")
  store i32 0, i32* %".3", align 4
  ; a = 0
  store i32 1, i32* %".6", align 4
  ; b = 1
  store i32 1, i32* %".9", align 4
  ; c = 1
  %".290" = load i32, i32* %".3", align 4
  ; f = a && ! b || c || ! b && ! d
  %".292" = icmp ne i32 %".290", 0
  br i1 %".292", label %".293", label %".299"
.293:
  %".294" = load i32, i32* %".6", align 4
  %".295" = icmp ne i32 %".294", 0
  br i1 %".295", label %".299", label %".296"
.296:
  %".297" = load i32, i32* %".9", align 4
  %".298" = icmp ne i32 %".297", 0
  br i1 %".298", label %".299", label %".306"
.299:
  %".300" = load i32, i32* %".6", align 4
  %".301" = icmp ne i32 %".300", 0
  br i1 %".301", label %".302", label %".306"
.302:
  %".303" = load i32, i32* %".12", align 4
  %".304" = icmp ne i32 %".303", 0
  %".305" = xor i1 %".304", 1
  %".310" = xor i1 %".305", 1
  br label %".306"
.306:
  %".313" = phi  i1 [1, %".299"], [1, %".296"], [%".310", %".302"]
  %".314" = zext i1 %".313" to i32
  store i32 %".314", i32* %".18", align 4
  %".316" = load i32, i32* %".18", align 4
  ; printf " %d " , f
  %".318" = bitcast [3 x i8]* @".str.d" to i8*
  %".319" = alloca i32
  store i32 %".316", i32* %".319"
  %".321" = load i32, i32* %".319"
  %".322" = call i32 (i8*, ...) @"printf"(i8* %".318", i32 %".321")
  store i32 1, i32* %".3", align 4
  ; a = 1
  store i32 1, i32* %".6", align 4
  ; b = 1
  store i32 1, i32* %".9", align 4
  ; c = 1
  %".329" = load i32, i32* %".3", align 4
  ; f = a && ! b || c || ! b && ! d
  %".331" = icmp ne i32 %".329", 0
  br i1 %".331", label %".332", label %".338"
.332:
  %".333" = load i32, i32* %".6", align 4
  %".334" = icmp ne i32 %".333", 0
  br i1 %".334", label %".338", label %".335"
.335:
  %".336" = load i32, i32* %".9", align 4
  %".337" = icmp ne i32 %".336", 0
  br i1 %".337", label %".338", label %".345"
.338:
  %".339" = load i32, i32* %".6", align 4
  %".340" = icmp ne i32 %".339", 0
  br i1 %".340", label %".341", label %".345"
.341:
  %".342" = load i32, i32* %".12", align 4
  %".343" = icmp ne i32 %".342", 0
  %".344" = xor i1 %".343", 1
  %".349" = xor i1 %".344", 1
  br label %".345"
.345:
  %".352" = phi  i1 [1, %".338"], [1, %".335"], [%".349", %".341"]
  %".353" = zext i1 %".352" to i32
  store i32 %".353", i32* %".18", align 4
  %".355" = load i32, i32* %".18", align 4
  ; printf " %d " , f
  %".357" = bitcast [3 x i8]* @".str.d" to i8*
  %".358" = alloca i32
  store i32 %".355", i32* %".358"
  %".360" = load i32, i32* %".358"
  %".361" = call i32 (i8*, ...) @"printf"(i8* %".357", i32 %".360")
  ret i32 0
  ; INT main
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"
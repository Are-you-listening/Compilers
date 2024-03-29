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
  %".63" = phi  i1 [1, %".47"], [%".61", %".50"], [0, %".43"], [1, %".37"]
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
  %".89" = phi  i1 [%".87", %".81"], [0, %".78"], [0, %".54"]
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
  %".119" = xor i1 %".114", 1
  br label %".115"
.115:
  %".122" = phi  i1 [1, %".108"], [1, %".105"], [%".119", %".111"]
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
  store i32 1, i32* %".12", align 4
  ; d = 1
  %".138" = load i32, i32* %".3", align 4
  ; f = a && ! b || c || ! b && ! d
  %".140" = icmp ne i32 %".138", 0
  br i1 %".140", label %".141", label %".147"
.141:
  %".142" = load i32, i32* %".6", align 4
  %".143" = icmp ne i32 %".142", 0
  br i1 %".143", label %".147", label %".144"
.144:
  %".145" = load i32, i32* %".9", align 4
  %".146" = icmp ne i32 %".145", 0
  br i1 %".146", label %".147", label %".154"
.147:
  %".148" = load i32, i32* %".6", align 4
  %".149" = icmp ne i32 %".148", 0
  br i1 %".149", label %".150", label %".154"
.150:
  %".151" = load i32, i32* %".12", align 4
  %".152" = icmp ne i32 %".151", 0
  %".153" = xor i1 %".152", 1
  %".159" = xor i1 %".153", 1
  br label %".154"
.154:
  %".161" = phi  i1 [1, %".144"], [%".159", %".150"], [1, %".147"]
  %".162" = zext i1 %".161" to i32
  store i32 %".162", i32* %".18", align 4
  %".164" = load i32, i32* %".18", align 4
  ; printf " %d " , f
  %".166" = bitcast [3 x i8]* @".str.d" to i8*
  %".167" = alloca i32
  store i32 %".164", i32* %".167"
  %".169" = load i32, i32* %".167"
  %".170" = call i32 (i8*, ...) @"printf"(i8* %".166", i32 %".169")
  store i32 1, i32* %".3", align 4
  ; a = 1
  store i32 1, i32* %".6", align 4
  ; b = 1
  %".175" = load i32, i32* %".3", align 4
  ; f = a && ! b || c || ! b && ! d
  %".177" = icmp ne i32 %".175", 0
  br i1 %".177", label %".178", label %".184"
.178:
  %".179" = load i32, i32* %".6", align 4
  %".180" = icmp ne i32 %".179", 0
  br i1 %".180", label %".184", label %".181"
.181:
  %".182" = load i32, i32* %".9", align 4
  %".183" = icmp ne i32 %".182", 0
  br i1 %".183", label %".184", label %".191"
.184:
  %".185" = load i32, i32* %".6", align 4
  %".186" = icmp ne i32 %".185", 0
  br i1 %".186", label %".187", label %".191"
.187:
  %".188" = load i32, i32* %".12", align 4
  %".189" = icmp ne i32 %".188", 0
  %".190" = xor i1 %".189", 1
  %".195" = xor i1 %".190", 1
  br label %".191"
.191:
  %".198" = phi  i1 [1, %".184"], [%".195", %".187"], [1, %".181"]
  %".199" = zext i1 %".198" to i32
  store i32 %".199", i32* %".18", align 4
  %".201" = load i32, i32* %".18", align 4
  ; printf " %d " , f
  %".203" = bitcast [3 x i8]* @".str.d" to i8*
  %".204" = alloca i32
  store i32 %".201", i32* %".204"
  %".206" = load i32, i32* %".204"
  %".207" = call i32 (i8*, ...) @"printf"(i8* %".203", i32 %".206")
  store i32 0, i32* %".3", align 4
  ; a = 0
  store i32 0, i32* %".6", align 4
  ; b = 0
  store i32 1, i32* %".9", align 4
  ; c = 1
  %".214" = load i32, i32* %".3", align 4
  ; f = a && ! b || c || ! b && ! d
  %".216" = icmp ne i32 %".214", 0
  br i1 %".216", label %".217", label %".223"
.217:
  %".218" = load i32, i32* %".6", align 4
  %".219" = icmp ne i32 %".218", 0
  br i1 %".219", label %".223", label %".220"
.220:
  %".221" = load i32, i32* %".9", align 4
  %".222" = icmp ne i32 %".221", 0
  br i1 %".222", label %".223", label %".230"
.223:
  %".224" = load i32, i32* %".6", align 4
  %".225" = icmp ne i32 %".224", 0
  br i1 %".225", label %".226", label %".230"
.226:
  %".227" = load i32, i32* %".12", align 4
  %".228" = icmp ne i32 %".227", 0
  %".229" = xor i1 %".228", 1
  %".233" = xor i1 %".229", 1
  br label %".230"
.230:
  %".237" = phi  i1 [%".233", %".226"], [1, %".223"], [1, %".220"]
  %".238" = zext i1 %".237" to i32
  store i32 %".238", i32* %".18", align 4
  %".240" = load i32, i32* %".18", align 4
  ; printf " %d " , f
  %".242" = bitcast [3 x i8]* @".str.d" to i8*
  %".243" = alloca i32
  store i32 %".240", i32* %".243"
  %".245" = load i32, i32* %".243"
  %".246" = call i32 (i8*, ...) @"printf"(i8* %".242", i32 %".245")
  store i32 1, i32* %".3", align 4
  ; a = 1
  store i32 0, i32* %".6", align 4
  ; b = 0
  store i32 1, i32* %".9", align 4
  ; c = 1
  %".253" = load i32, i32* %".3", align 4
  ; f = a && ! b || c || ! b && ! d
  %".255" = icmp ne i32 %".253", 0
  br i1 %".255", label %".256", label %".262"
.256:
  %".257" = load i32, i32* %".6", align 4
  %".258" = icmp ne i32 %".257", 0
  br i1 %".258", label %".262", label %".259"
.259:
  %".260" = load i32, i32* %".9", align 4
  %".261" = icmp ne i32 %".260", 0
  br i1 %".261", label %".262", label %".269"
.262:
  %".263" = load i32, i32* %".6", align 4
  %".264" = icmp ne i32 %".263", 0
  br i1 %".264", label %".265", label %".269"
.265:
  %".266" = load i32, i32* %".12", align 4
  %".267" = icmp ne i32 %".266", 0
  %".268" = xor i1 %".267", 1
  %".274" = xor i1 %".268", 1
  br label %".269"
.269:
  %".276" = phi  i1 [%".274", %".265"], [1, %".262"], [1, %".259"]
  %".277" = zext i1 %".276" to i32
  store i32 %".277", i32* %".18", align 4
  %".279" = load i32, i32* %".18", align 4
  ; printf " %d " , f
  %".281" = bitcast [3 x i8]* @".str.d" to i8*
  %".282" = alloca i32
  store i32 %".279", i32* %".282"
  %".284" = load i32, i32* %".282"
  %".285" = call i32 (i8*, ...) @"printf"(i8* %".281", i32 %".284")
  store i32 0, i32* %".3", align 4
  ; a = 0
  store i32 1, i32* %".6", align 4
  ; b = 1
  store i32 1, i32* %".9", align 4
  ; c = 1
  %".292" = load i32, i32* %".3", align 4
  ; f = a && ! b || c || ! b && ! d
  %".294" = icmp ne i32 %".292", 0
  br i1 %".294", label %".295", label %".301"
.295:
  %".296" = load i32, i32* %".6", align 4
  %".297" = icmp ne i32 %".296", 0
  br i1 %".297", label %".301", label %".298"
.298:
  %".299" = load i32, i32* %".9", align 4
  %".300" = icmp ne i32 %".299", 0
  br i1 %".300", label %".301", label %".308"
.301:
  %".302" = load i32, i32* %".6", align 4
  %".303" = icmp ne i32 %".302", 0
  br i1 %".303", label %".304", label %".308"
.304:
  %".305" = load i32, i32* %".12", align 4
  %".306" = icmp ne i32 %".305", 0
  %".307" = xor i1 %".306", 1
  %".312" = xor i1 %".307", 1
  br label %".308"
.308:
  %".315" = phi  i1 [%".312", %".304"], [1, %".298"], [1, %".301"]
  %".316" = zext i1 %".315" to i32
  store i32 %".316", i32* %".18", align 4
  %".318" = load i32, i32* %".18", align 4
  ; printf " %d " , f
  %".320" = bitcast [3 x i8]* @".str.d" to i8*
  %".321" = alloca i32
  store i32 %".318", i32* %".321"
  %".323" = load i32, i32* %".321"
  %".324" = call i32 (i8*, ...) @"printf"(i8* %".320", i32 %".323")
  store i32 1, i32* %".3", align 4
  ; a = 1
  store i32 1, i32* %".6", align 4
  ; b = 1
  store i32 1, i32* %".9", align 4
  ; c = 1
  %".331" = load i32, i32* %".3", align 4
  ; f = a && ! b || c || ! b && ! d
  %".333" = icmp ne i32 %".331", 0
  br i1 %".333", label %".334", label %".340"
.334:
  %".335" = load i32, i32* %".6", align 4
  %".336" = icmp ne i32 %".335", 0
  br i1 %".336", label %".340", label %".337"
.337:
  %".338" = load i32, i32* %".9", align 4
  %".339" = icmp ne i32 %".338", 0
  br i1 %".339", label %".340", label %".347"
.340:
  %".341" = load i32, i32* %".6", align 4
  %".342" = icmp ne i32 %".341", 0
  br i1 %".342", label %".343", label %".347"
.343:
  %".344" = load i32, i32* %".12", align 4
  %".345" = icmp ne i32 %".344", 0
  %".346" = xor i1 %".345", 1
  %".352" = xor i1 %".346", 1
  br label %".347"
.347:
  %".354" = phi  i1 [%".352", %".343"], [1, %".337"], [1, %".340"]
  %".355" = zext i1 %".354" to i32
  store i32 %".355", i32* %".18", align 4
  %".357" = load i32, i32* %".18", align 4
  ; printf " %d " , f
  %".359" = bitcast [3 x i8]* @".str.d" to i8*
  %".360" = alloca i32
  store i32 %".357", i32* %".360"
  %".362" = load i32, i32* %".360"
  %".363" = call i32 (i8*, ...) @"printf"(i8* %".359", i32 %".362")
  ret i32 0
  ; INT main
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"
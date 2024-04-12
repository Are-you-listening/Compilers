; ModuleID = "tests/test10.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 1, i32* %".3", align 4
  ; INT a = 1
  %".6" = alloca i32, align 4
  store i32 1, i32* %".6", align 4
  ; INT b = 1
  %".9" = alloca i32, align 4
  store i32 1, i32* %".9", align 4
  ; INT c = 1
  %".12" = alloca i32, align 4
  store i32 1, i32* %".12", align 4
  ; INT d = 1
  store i32 1, i32* %".3", align 4
  ; a = 1
  store i32 1, i32* %".6", align 4
  ; b = 1
  store i32 1, i32* %".9", align 4
  ; c = 1
  store i32 1, i32* %".12", align 4
  ; d = 1
  %".23" = load i32, i32* %".3", align 4
  ; if a
  %".25" = icmp ne i32 %".23", 0
  br i1 %".25", label %".26", label %".58"
.26:
  %".27" = bitcast [3 x i8]* @".str.d" to i8*
  %".28" = alloca i32
  store i32 1, i32* %".28"
  %".30" = load i32, i32* %".28"
  %".31" = call i32 (i8*, ...) @"printf"(i8* %".27", i32 %".30")
  ; printf "%d" 1
  %".33" = load i32, i32* %".6", align 4
  ; if b < c
  %".35" = load i32, i32* %".9", align 4
  %".36" = icmp slt i32 %".33", %".35"
  br i1 %".36", label %".37", label %".44"
.37:
  %".38" = bitcast [3 x i8]* @".str.d" to i8*
  %".39" = alloca i32
  store i32 2, i32* %".39"
  %".41" = load i32, i32* %".39"
  %".42" = call i32 (i8*, ...) @"printf"(i8* %".38", i32 %".41")
  ; printf "%d" 2
  br label %".56"
.44:
  %".45" = load i32, i32* %".6", align 4
  ; else if b > d
  %".47" = load i32, i32* %".12", align 4
  %".48" = icmp sgt i32 %".45", %".47"
  br i1 %".48", label %".49", label %".57"
.49:
  %".50" = bitcast [3 x i8]* @".str.d" to i8*
  %".51" = alloca i32
  store i32 3, i32* %".51"
  %".53" = load i32, i32* %".51"
  %".54" = call i32 (i8*, ...) @"printf"(i8* %".50", i32 %".53")
  ; printf "%d" 3
  br label %".57"
.56:
  br label %".132"
.57:
  br label %".56"
.58:
  %".59" = load i32, i32* %".6", align 4
  ; else if b
  %".61" = icmp ne i32 %".59", 0
  br i1 %".61", label %".62", label %".92"
.62:
  %".63" = bitcast [3 x i8]* @".str.d" to i8*
  %".64" = alloca i32
  store i32 4, i32* %".64"
  %".66" = load i32, i32* %".64"
  %".67" = call i32 (i8*, ...) @"printf"(i8* %".63", i32 %".66")
  ; printf "%d" 4
  %".69" = load i32, i32* %".9", align 4
  ; if ! c
  %".71" = icmp ne i32 %".69", 0
  %".72" = xor i1 %".71", 1
  br i1 %".72", label %".73", label %".80"
.73:
  %".74" = bitcast [3 x i8]* @".str.d" to i8*
  %".75" = alloca i32
  store i32 5, i32* %".75"
  %".77" = load i32, i32* %".75"
  %".78" = call i32 (i8*, ...) @"printf"(i8* %".74", i32 %".77")
  ; printf "%d" 5
  br label %".85"
.80:
  %".81" = load i32, i32* %".12", align 4
  ; else if d
  %".83" = icmp ne i32 %".81", 0
  br i1 %".83", label %".84", label %".85"
.84:
  br label %".85"
.85:
  %".86" = bitcast [3 x i8]* @".str.d" to i8*
  %".87" = alloca i32
  store i32 6, i32* %".87"
  %".89" = load i32, i32* %".87"
  %".90" = call i32 (i8*, ...) @"printf"(i8* %".86", i32 %".89")
  ; printf "%d" 6
  br label %".132"
.92:
  %".93" = load i32, i32* %".9", align 4
  ; else if c
  %".95" = icmp ne i32 %".93", 0
  br i1 %".95", label %".96", label %".110"
.96:
  %".97" = load i32, i32* %".3", align 4
  ; if a < b
  %".99" = load i32, i32* %".6", align 4
  %".100" = icmp slt i32 %".97", %".99"
  br i1 %".100", label %".101", label %".108"
.101:
  %".102" = bitcast [3 x i8]* @".str.d" to i8*
  %".103" = alloca i32
  store i32 7, i32* %".103"
  %".105" = load i32, i32* %".103"
  %".106" = call i32 (i8*, ...) @"printf"(i8* %".102", i32 %".105")
  ; printf "%d" 7
  br label %".109"
.108:
  br label %".109"
.109:
  br label %".132"
.110:
  %".111" = load i32, i32* %".12", align 4
  ; else if d
  %".113" = icmp ne i32 %".111", 0
  br i1 %".113", label %".114", label %".132"
.114:
  %".115" = bitcast [3 x i8]* @".str.d" to i8*
  %".116" = alloca i32
  store i32 8, i32* %".116"
  %".118" = load i32, i32* %".116"
  %".119" = call i32 (i8*, ...) @"printf"(i8* %".115", i32 %".118")
  ; printf "%d" 8
  %".121" = load i32, i32* %".12", align 4
  ; if d
  %".123" = icmp ne i32 %".121", 0
  br i1 %".123", label %".124", label %".131"
.124:
  %".125" = bitcast [3 x i8]* @".str.d" to i8*
  %".126" = alloca i32
  store i32 9, i32* %".126"
  %".128" = load i32, i32* %".126"
  %".129" = call i32 (i8*, ...) @"printf"(i8* %".125", i32 %".128")
  ; printf "%d" 9
  br label %".131"
.131:
  br label %".132"
.132:
  %".133" = bitcast [3 x i8]* @".str.d" to i8*
  %".134" = alloca i32
  store i32 10, i32* %".134"
  %".136" = load i32, i32* %".134"
  %".137" = call i32 (i8*, ...) @"printf"(i8* %".133", i32 %".136")
  ; printf "%d" 10
  store i32 1, i32* %".3", align 4
  ; a = 1
  store i32 1, i32* %".6", align 4
  ; b = 1
  store i32 1, i32* %".9", align 4
  ; c = 1
  store i32 0, i32* %".12", align 4
  ; d = 0
  %".147" = load i32, i32* %".3", align 4
  ; if a
  %".149" = icmp ne i32 %".147", 0
  br i1 %".149", label %".150", label %".182"
.150:
  %".151" = bitcast [3 x i8]* @".str.d" to i8*
  %".152" = alloca i32
  store i32 1, i32* %".152"
  %".154" = load i32, i32* %".152"
  %".155" = call i32 (i8*, ...) @"printf"(i8* %".151", i32 %".154")
  ; printf "%d" 1
  %".157" = load i32, i32* %".6", align 4
  ; if b < c
  %".159" = load i32, i32* %".9", align 4
  %".160" = icmp slt i32 %".157", %".159"
  br i1 %".160", label %".161", label %".168"
.161:
  %".162" = bitcast [3 x i8]* @".str.d" to i8*
  %".163" = alloca i32
  store i32 2, i32* %".163"
  %".165" = load i32, i32* %".163"
  %".166" = call i32 (i8*, ...) @"printf"(i8* %".162", i32 %".165")
  ; printf "%d" 2
  br label %".180"
.168:
  %".169" = load i32, i32* %".6", align 4
  ; else if b > d
  %".171" = load i32, i32* %".12", align 4
  %".172" = icmp sgt i32 %".169", %".171"
  br i1 %".172", label %".173", label %".181"
.173:
  %".174" = bitcast [3 x i8]* @".str.d" to i8*
  %".175" = alloca i32
  store i32 3, i32* %".175"
  %".177" = load i32, i32* %".175"
  %".178" = call i32 (i8*, ...) @"printf"(i8* %".174", i32 %".177")
  ; printf "%d" 3
  br label %".181"
.180:
  br label %".256"
.181:
  br label %".180"
.182:
  %".183" = load i32, i32* %".6", align 4
  ; else if b
  %".185" = icmp ne i32 %".183", 0
  br i1 %".185", label %".186", label %".216"
.186:
  %".187" = bitcast [3 x i8]* @".str.d" to i8*
  %".188" = alloca i32
  store i32 4, i32* %".188"
  %".190" = load i32, i32* %".188"
  %".191" = call i32 (i8*, ...) @"printf"(i8* %".187", i32 %".190")
  ; printf "%d" 4
  %".193" = load i32, i32* %".9", align 4
  ; if ! c
  %".195" = icmp ne i32 %".193", 0
  %".196" = xor i1 %".195", 1
  br i1 %".196", label %".197", label %".204"
.197:
  %".198" = bitcast [3 x i8]* @".str.d" to i8*
  %".199" = alloca i32
  store i32 5, i32* %".199"
  %".201" = load i32, i32* %".199"
  %".202" = call i32 (i8*, ...) @"printf"(i8* %".198", i32 %".201")
  ; printf "%d" 5
  br label %".209"
.204:
  %".205" = load i32, i32* %".12", align 4
  ; else if d
  %".207" = icmp ne i32 %".205", 0
  br i1 %".207", label %".208", label %".209"
.208:
  br label %".209"
.209:
  %".210" = bitcast [3 x i8]* @".str.d" to i8*
  %".211" = alloca i32
  store i32 6, i32* %".211"
  %".213" = load i32, i32* %".211"
  %".214" = call i32 (i8*, ...) @"printf"(i8* %".210", i32 %".213")
  ; printf "%d" 6
  br label %".256"
.216:
  %".217" = load i32, i32* %".9", align 4
  ; else if c
  %".219" = icmp ne i32 %".217", 0
  br i1 %".219", label %".220", label %".234"
.220:
  %".221" = load i32, i32* %".3", align 4
  ; if a < b
  %".223" = load i32, i32* %".6", align 4
  %".224" = icmp slt i32 %".221", %".223"
  br i1 %".224", label %".225", label %".232"
.225:
  %".226" = bitcast [3 x i8]* @".str.d" to i8*
  %".227" = alloca i32
  store i32 7, i32* %".227"
  %".229" = load i32, i32* %".227"
  %".230" = call i32 (i8*, ...) @"printf"(i8* %".226", i32 %".229")
  ; printf "%d" 7
  br label %".233"
.232:
  br label %".233"
.233:
  br label %".256"
.234:
  %".235" = load i32, i32* %".12", align 4
  ; else if d
  %".237" = icmp ne i32 %".235", 0
  br i1 %".237", label %".238", label %".256"
.238:
  %".239" = bitcast [3 x i8]* @".str.d" to i8*
  %".240" = alloca i32
  store i32 8, i32* %".240"
  %".242" = load i32, i32* %".240"
  %".243" = call i32 (i8*, ...) @"printf"(i8* %".239", i32 %".242")
  ; printf "%d" 8
  %".245" = load i32, i32* %".12", align 4
  ; if d
  %".247" = icmp ne i32 %".245", 0
  br i1 %".247", label %".248", label %".255"
.248:
  %".249" = bitcast [3 x i8]* @".str.d" to i8*
  %".250" = alloca i32
  store i32 9, i32* %".250"
  %".252" = load i32, i32* %".250"
  %".253" = call i32 (i8*, ...) @"printf"(i8* %".249", i32 %".252")
  ; printf "%d" 9
  br label %".255"
.255:
  br label %".256"
.256:
  %".257" = bitcast [3 x i8]* @".str.d" to i8*
  %".258" = alloca i32
  store i32 10, i32* %".258"
  %".260" = load i32, i32* %".258"
  %".261" = call i32 (i8*, ...) @"printf"(i8* %".257", i32 %".260")
  ; printf "%d" 10
  store i32 0, i32* %".3", align 4
  ; a = 0
  store i32 1, i32* %".6", align 4
  ; b = 1
  store i32 1, i32* %".9", align 4
  ; c = 1
  store i32 0, i32* %".12", align 4
  ; d = 0
  %".271" = load i32, i32* %".3", align 4
  ; if a
  %".273" = icmp ne i32 %".271", 0
  br i1 %".273", label %".274", label %".306"
.274:
  %".275" = bitcast [3 x i8]* @".str.d" to i8*
  %".276" = alloca i32
  store i32 1, i32* %".276"
  %".278" = load i32, i32* %".276"
  %".279" = call i32 (i8*, ...) @"printf"(i8* %".275", i32 %".278")
  ; printf "%d" 1
  %".281" = load i32, i32* %".6", align 4
  ; if b < c
  %".283" = load i32, i32* %".9", align 4
  %".284" = icmp slt i32 %".281", %".283"
  br i1 %".284", label %".285", label %".292"
.285:
  %".286" = bitcast [3 x i8]* @".str.d" to i8*
  %".287" = alloca i32
  store i32 2, i32* %".287"
  %".289" = load i32, i32* %".287"
  %".290" = call i32 (i8*, ...) @"printf"(i8* %".286", i32 %".289")
  ; printf "%d" 2
  br label %".304"
.292:
  %".293" = load i32, i32* %".6", align 4
  ; else if b > d
  %".295" = load i32, i32* %".12", align 4
  %".296" = icmp sgt i32 %".293", %".295"
  br i1 %".296", label %".297", label %".305"
.297:
  %".298" = bitcast [3 x i8]* @".str.d" to i8*
  %".299" = alloca i32
  store i32 3, i32* %".299"
  %".301" = load i32, i32* %".299"
  %".302" = call i32 (i8*, ...) @"printf"(i8* %".298", i32 %".301")
  ; printf "%d" 3
  br label %".305"
.304:
  br label %".380"
.305:
  br label %".304"
.306:
  %".307" = load i32, i32* %".6", align 4
  ; else if b
  %".309" = icmp ne i32 %".307", 0
  br i1 %".309", label %".310", label %".340"
.310:
  %".311" = bitcast [3 x i8]* @".str.d" to i8*
  %".312" = alloca i32
  store i32 4, i32* %".312"
  %".314" = load i32, i32* %".312"
  %".315" = call i32 (i8*, ...) @"printf"(i8* %".311", i32 %".314")
  ; printf "%d" 4
  %".317" = load i32, i32* %".9", align 4
  ; if ! c
  %".319" = icmp ne i32 %".317", 0
  %".320" = xor i1 %".319", 1
  br i1 %".320", label %".321", label %".328"
.321:
  %".322" = bitcast [3 x i8]* @".str.d" to i8*
  %".323" = alloca i32
  store i32 5, i32* %".323"
  %".325" = load i32, i32* %".323"
  %".326" = call i32 (i8*, ...) @"printf"(i8* %".322", i32 %".325")
  ; printf "%d" 5
  br label %".333"
.328:
  %".329" = load i32, i32* %".12", align 4
  ; else if d
  %".331" = icmp ne i32 %".329", 0
  br i1 %".331", label %".332", label %".333"
.332:
  br label %".333"
.333:
  %".334" = bitcast [3 x i8]* @".str.d" to i8*
  %".335" = alloca i32
  store i32 6, i32* %".335"
  %".337" = load i32, i32* %".335"
  %".338" = call i32 (i8*, ...) @"printf"(i8* %".334", i32 %".337")
  ; printf "%d" 6
  br label %".380"
.340:
  %".341" = load i32, i32* %".9", align 4
  ; else if c
  %".343" = icmp ne i32 %".341", 0
  br i1 %".343", label %".344", label %".358"
.344:
  %".345" = load i32, i32* %".3", align 4
  ; if a < b
  %".347" = load i32, i32* %".6", align 4
  %".348" = icmp slt i32 %".345", %".347"
  br i1 %".348", label %".349", label %".356"
.349:
  %".350" = bitcast [3 x i8]* @".str.d" to i8*
  %".351" = alloca i32
  store i32 7, i32* %".351"
  %".353" = load i32, i32* %".351"
  %".354" = call i32 (i8*, ...) @"printf"(i8* %".350", i32 %".353")
  ; printf "%d" 7
  br label %".357"
.356:
  br label %".357"
.357:
  br label %".380"
.358:
  %".359" = load i32, i32* %".12", align 4
  ; else if d
  %".361" = icmp ne i32 %".359", 0
  br i1 %".361", label %".362", label %".380"
.362:
  %".363" = bitcast [3 x i8]* @".str.d" to i8*
  %".364" = alloca i32
  store i32 8, i32* %".364"
  %".366" = load i32, i32* %".364"
  %".367" = call i32 (i8*, ...) @"printf"(i8* %".363", i32 %".366")
  ; printf "%d" 8
  %".369" = load i32, i32* %".12", align 4
  ; if d
  %".371" = icmp ne i32 %".369", 0
  br i1 %".371", label %".372", label %".379"
.372:
  %".373" = bitcast [3 x i8]* @".str.d" to i8*
  %".374" = alloca i32
  store i32 9, i32* %".374"
  %".376" = load i32, i32* %".374"
  %".377" = call i32 (i8*, ...) @"printf"(i8* %".373", i32 %".376")
  ; printf "%d" 9
  br label %".379"
.379:
  br label %".380"
.380:
  %".381" = bitcast [3 x i8]* @".str.d" to i8*
  %".382" = alloca i32
  store i32 10, i32* %".382"
  %".384" = load i32, i32* %".382"
  %".385" = call i32 (i8*, ...) @"printf"(i8* %".381", i32 %".384")
  ; printf "%d" 10
  store i32 0, i32* %".3", align 4
  ; a = 0
  store i32 0, i32* %".6", align 4
  ; b = 0
  store i32 1, i32* %".9", align 4
  ; c = 1
  store i32 0, i32* %".12", align 4
  ; d = 0
  %".395" = load i32, i32* %".3", align 4
  ; if a
  %".397" = icmp ne i32 %".395", 0
  br i1 %".397", label %".398", label %".430"
.398:
  %".399" = bitcast [3 x i8]* @".str.d" to i8*
  %".400" = alloca i32
  store i32 1, i32* %".400"
  %".402" = load i32, i32* %".400"
  %".403" = call i32 (i8*, ...) @"printf"(i8* %".399", i32 %".402")
  ; printf "%d" 1
  %".405" = load i32, i32* %".6", align 4
  ; if b < c
  %".407" = load i32, i32* %".9", align 4
  %".408" = icmp slt i32 %".405", %".407"
  br i1 %".408", label %".409", label %".416"
.409:
  %".410" = bitcast [3 x i8]* @".str.d" to i8*
  %".411" = alloca i32
  store i32 2, i32* %".411"
  %".413" = load i32, i32* %".411"
  %".414" = call i32 (i8*, ...) @"printf"(i8* %".410", i32 %".413")
  ; printf "%d" 2
  br label %".428"
.416:
  %".417" = load i32, i32* %".6", align 4
  ; else if b > d
  %".419" = load i32, i32* %".12", align 4
  %".420" = icmp sgt i32 %".417", %".419"
  br i1 %".420", label %".421", label %".429"
.421:
  %".422" = bitcast [3 x i8]* @".str.d" to i8*
  %".423" = alloca i32
  store i32 3, i32* %".423"
  %".425" = load i32, i32* %".423"
  %".426" = call i32 (i8*, ...) @"printf"(i8* %".422", i32 %".425")
  ; printf "%d" 3
  br label %".429"
.428:
  br label %".504"
.429:
  br label %".428"
.430:
  %".431" = load i32, i32* %".6", align 4
  ; else if b
  %".433" = icmp ne i32 %".431", 0
  br i1 %".433", label %".434", label %".464"
.434:
  %".435" = bitcast [3 x i8]* @".str.d" to i8*
  %".436" = alloca i32
  store i32 4, i32* %".436"
  %".438" = load i32, i32* %".436"
  %".439" = call i32 (i8*, ...) @"printf"(i8* %".435", i32 %".438")
  ; printf "%d" 4
  %".441" = load i32, i32* %".9", align 4
  ; if ! c
  %".443" = icmp ne i32 %".441", 0
  %".444" = xor i1 %".443", 1
  br i1 %".444", label %".445", label %".452"
.445:
  %".446" = bitcast [3 x i8]* @".str.d" to i8*
  %".447" = alloca i32
  store i32 5, i32* %".447"
  %".449" = load i32, i32* %".447"
  %".450" = call i32 (i8*, ...) @"printf"(i8* %".446", i32 %".449")
  ; printf "%d" 5
  br label %".457"
.452:
  %".453" = load i32, i32* %".12", align 4
  ; else if d
  %".455" = icmp ne i32 %".453", 0
  br i1 %".455", label %".456", label %".457"
.456:
  br label %".457"
.457:
  %".458" = bitcast [3 x i8]* @".str.d" to i8*
  %".459" = alloca i32
  store i32 6, i32* %".459"
  %".461" = load i32, i32* %".459"
  %".462" = call i32 (i8*, ...) @"printf"(i8* %".458", i32 %".461")
  ; printf "%d" 6
  br label %".504"
.464:
  %".465" = load i32, i32* %".9", align 4
  ; else if c
  %".467" = icmp ne i32 %".465", 0
  br i1 %".467", label %".468", label %".482"
.468:
  %".469" = load i32, i32* %".3", align 4
  ; if a < b
  %".471" = load i32, i32* %".6", align 4
  %".472" = icmp slt i32 %".469", %".471"
  br i1 %".472", label %".473", label %".480"
.473:
  %".474" = bitcast [3 x i8]* @".str.d" to i8*
  %".475" = alloca i32
  store i32 7, i32* %".475"
  %".477" = load i32, i32* %".475"
  %".478" = call i32 (i8*, ...) @"printf"(i8* %".474", i32 %".477")
  ; printf "%d" 7
  br label %".481"
.480:
  br label %".481"
.481:
  br label %".504"
.482:
  %".483" = load i32, i32* %".12", align 4
  ; else if d
  %".485" = icmp ne i32 %".483", 0
  br i1 %".485", label %".486", label %".504"
.486:
  %".487" = bitcast [3 x i8]* @".str.d" to i8*
  %".488" = alloca i32
  store i32 8, i32* %".488"
  %".490" = load i32, i32* %".488"
  %".491" = call i32 (i8*, ...) @"printf"(i8* %".487", i32 %".490")
  ; printf "%d" 8
  %".493" = load i32, i32* %".12", align 4
  ; if d
  %".495" = icmp ne i32 %".493", 0
  br i1 %".495", label %".496", label %".503"
.496:
  %".497" = bitcast [3 x i8]* @".str.d" to i8*
  %".498" = alloca i32
  store i32 9, i32* %".498"
  %".500" = load i32, i32* %".498"
  %".501" = call i32 (i8*, ...) @"printf"(i8* %".497", i32 %".500")
  ; printf "%d" 9
  br label %".503"
.503:
  br label %".504"
.504:
  %".505" = bitcast [3 x i8]* @".str.d" to i8*
  %".506" = alloca i32
  store i32 10, i32* %".506"
  %".508" = load i32, i32* %".506"
  %".509" = call i32 (i8*, ...) @"printf"(i8* %".505", i32 %".508")
  ; printf "%d" 10
  store i32 0, i32* %".3", align 4
  ; a = 0
  store i32 1, i32* %".6", align 4
  ; b = 1
  store i32 1, i32* %".9", align 4
  ; c = 1
  store i32 0, i32* %".12", align 4
  ; d = 0
  %".519" = load i32, i32* %".3", align 4
  ; if a
  %".521" = icmp ne i32 %".519", 0
  br i1 %".521", label %".522", label %".554"
.522:
  %".523" = bitcast [3 x i8]* @".str.d" to i8*
  %".524" = alloca i32
  store i32 1, i32* %".524"
  %".526" = load i32, i32* %".524"
  %".527" = call i32 (i8*, ...) @"printf"(i8* %".523", i32 %".526")
  ; printf "%d" 1
  %".529" = load i32, i32* %".6", align 4
  ; if b < c
  %".531" = load i32, i32* %".9", align 4
  %".532" = icmp slt i32 %".529", %".531"
  br i1 %".532", label %".533", label %".540"
.533:
  %".534" = bitcast [3 x i8]* @".str.d" to i8*
  %".535" = alloca i32
  store i32 2, i32* %".535"
  %".537" = load i32, i32* %".535"
  %".538" = call i32 (i8*, ...) @"printf"(i8* %".534", i32 %".537")
  ; printf "%d" 2
  br label %".552"
.540:
  %".541" = load i32, i32* %".6", align 4
  ; else if b > d
  %".543" = load i32, i32* %".12", align 4
  %".544" = icmp sgt i32 %".541", %".543"
  br i1 %".544", label %".545", label %".553"
.545:
  %".546" = bitcast [3 x i8]* @".str.d" to i8*
  %".547" = alloca i32
  store i32 3, i32* %".547"
  %".549" = load i32, i32* %".547"
  %".550" = call i32 (i8*, ...) @"printf"(i8* %".546", i32 %".549")
  ; printf "%d" 3
  br label %".553"
.552:
  br label %".628"
.553:
  br label %".552"
.554:
  %".555" = load i32, i32* %".6", align 4
  ; else if b
  %".557" = icmp ne i32 %".555", 0
  br i1 %".557", label %".558", label %".588"
.558:
  %".559" = bitcast [3 x i8]* @".str.d" to i8*
  %".560" = alloca i32
  store i32 4, i32* %".560"
  %".562" = load i32, i32* %".560"
  %".563" = call i32 (i8*, ...) @"printf"(i8* %".559", i32 %".562")
  ; printf "%d" 4
  %".565" = load i32, i32* %".9", align 4
  ; if ! c
  %".567" = icmp ne i32 %".565", 0
  %".568" = xor i1 %".567", 1
  br i1 %".568", label %".569", label %".576"
.569:
  %".570" = bitcast [3 x i8]* @".str.d" to i8*
  %".571" = alloca i32
  store i32 5, i32* %".571"
  %".573" = load i32, i32* %".571"
  %".574" = call i32 (i8*, ...) @"printf"(i8* %".570", i32 %".573")
  ; printf "%d" 5
  br label %".581"
.576:
  %".577" = load i32, i32* %".12", align 4
  ; else if d
  %".579" = icmp ne i32 %".577", 0
  br i1 %".579", label %".580", label %".581"
.580:
  br label %".581"
.581:
  %".582" = bitcast [3 x i8]* @".str.d" to i8*
  %".583" = alloca i32
  store i32 6, i32* %".583"
  %".585" = load i32, i32* %".583"
  %".586" = call i32 (i8*, ...) @"printf"(i8* %".582", i32 %".585")
  ; printf "%d" 6
  br label %".628"
.588:
  %".589" = load i32, i32* %".9", align 4
  ; else if c
  %".591" = icmp ne i32 %".589", 0
  br i1 %".591", label %".592", label %".606"
.592:
  %".593" = load i32, i32* %".3", align 4
  ; if a < b
  %".595" = load i32, i32* %".6", align 4
  %".596" = icmp slt i32 %".593", %".595"
  br i1 %".596", label %".597", label %".604"
.597:
  %".598" = bitcast [3 x i8]* @".str.d" to i8*
  %".599" = alloca i32
  store i32 7, i32* %".599"
  %".601" = load i32, i32* %".599"
  %".602" = call i32 (i8*, ...) @"printf"(i8* %".598", i32 %".601")
  ; printf "%d" 7
  br label %".605"
.604:
  br label %".605"
.605:
  br label %".628"
.606:
  %".607" = load i32, i32* %".12", align 4
  ; else if d
  %".609" = icmp ne i32 %".607", 0
  br i1 %".609", label %".610", label %".628"
.610:
  %".611" = bitcast [3 x i8]* @".str.d" to i8*
  %".612" = alloca i32
  store i32 8, i32* %".612"
  %".614" = load i32, i32* %".612"
  %".615" = call i32 (i8*, ...) @"printf"(i8* %".611", i32 %".614")
  ; printf "%d" 8
  %".617" = load i32, i32* %".12", align 4
  ; if d
  %".619" = icmp ne i32 %".617", 0
  br i1 %".619", label %".620", label %".627"
.620:
  %".621" = bitcast [3 x i8]* @".str.d" to i8*
  %".622" = alloca i32
  store i32 9, i32* %".622"
  %".624" = load i32, i32* %".622"
  %".625" = call i32 (i8*, ...) @"printf"(i8* %".621", i32 %".624")
  ; printf "%d" 9
  br label %".627"
.627:
  br label %".628"
.628:
  %".629" = bitcast [3 x i8]* @".str.d" to i8*
  %".630" = alloca i32
  store i32 10, i32* %".630"
  %".632" = load i32, i32* %".630"
  %".633" = call i32 (i8*, ...) @"printf"(i8* %".629", i32 %".632")
  ; printf "%d" 10
  ret i32 0
  ; INT main
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"
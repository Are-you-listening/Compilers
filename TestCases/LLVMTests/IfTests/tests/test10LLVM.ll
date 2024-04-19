; ModuleID = "tests/test10.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;    INT main
  %".4" = alloca i32, align 4
  store i32 1, i32* %".4", align 4
  ;  INT a = 1
  %".7" = alloca i32, align 4
  store i32 1, i32* %".7", align 4
  ; INT b = 1
  %".10" = alloca i32, align 4
  store i32 1, i32* %".10", align 4
  ; INT c = 1
  %".13" = alloca i32, align 4
  store i32 1, i32* %".13", align 4
  ; INT d = 1
  store i32 1, i32* %".4", align 4
  ;  a = 1
  store i32 1, i32* %".7", align 4
  ; b = 1
  store i32 1, i32* %".10", align 4
  ; c = 1
  store i32 1, i32* %".13", align 4
  ; d = 1
  ;   if a
  %".25" = load i32, i32* %".4", align 4
  %".26" = icmp ne i32 %".25", 0
  br i1 %".26", label %".27", label %".59"
.27:
  %".28" = bitcast [3 x i8]* @".str.d" to i8*
  %".29" = alloca i32
  store i32 1, i32* %".29"
  %".31" = load i32, i32* %".29"
  %".32" = call i32 (i8*, ...) @"printf"(i8* %".28", i32 %".31")
  ; printf "%d" 1
  %".34" = load i32, i32* %".7", align 4
  ; if b < c
  %".36" = load i32, i32* %".10", align 4
  %".37" = icmp slt i32 %".34", %".36"
  br i1 %".37", label %".38", label %".45"
.38:
  %".39" = bitcast [3 x i8]* @".str.d" to i8*
  %".40" = alloca i32
  store i32 2, i32* %".40"
  %".42" = load i32, i32* %".40"
  %".43" = call i32 (i8*, ...) @"printf"(i8* %".39", i32 %".42")
  ; printf "%d" 2
  br label %".57"
.45:
  %".46" = load i32, i32* %".7", align 4
  ;  else if b > d
  %".48" = load i32, i32* %".13", align 4
  %".49" = icmp sgt i32 %".46", %".48"
  br i1 %".49", label %".50", label %".58"
.50:
  %".51" = bitcast [3 x i8]* @".str.d" to i8*
  %".52" = alloca i32
  store i32 3, i32* %".52"
  %".54" = load i32, i32* %".52"
  %".55" = call i32 (i8*, ...) @"printf"(i8* %".51", i32 %".54")
  ; printf "%d" 3
  br label %".58"
.57:
  br label %".135"
.58:
  br label %".57"
.59:
  ;  else if b
  %".61" = load i32, i32* %".7", align 4
  %".62" = icmp ne i32 %".61", 0
  br i1 %".62", label %".63", label %".94"
.63:
  %".64" = bitcast [3 x i8]* @".str.d" to i8*
  %".65" = alloca i32
  store i32 4, i32* %".65"
  %".67" = load i32, i32* %".65"
  %".68" = call i32 (i8*, ...) @"printf"(i8* %".64", i32 %".67")
  ; printf "%d" 4
  %".70" = load i32, i32* %".10", align 4
  ; if ! c
  %".72" = icmp ne i32 %".70", 0
  %".73" = xor i1 %".72", 1
  br i1 %".73", label %".74", label %".81"
.74:
  %".75" = bitcast [3 x i8]* @".str.d" to i8*
  %".76" = alloca i32
  store i32 5, i32* %".76"
  %".78" = load i32, i32* %".76"
  %".79" = call i32 (i8*, ...) @"printf"(i8* %".75", i32 %".78")
  ; printf "%d" 5
  br label %".87"
.81:
  ; else if d
  %".83" = load i32, i32* %".13", align 4
  %".84" = icmp ne i32 %".83", 0
  br i1 %".84", label %".85", label %".87"
.85:
  ;
  br label %".87"
.87:
  %".88" = bitcast [3 x i8]* @".str.d" to i8*
  %".89" = alloca i32
  store i32 6, i32* %".89"
  %".91" = load i32, i32* %".89"
  %".92" = call i32 (i8*, ...) @"printf"(i8* %".88", i32 %".91")
  ; printf "%d" 6
  br label %".135"
.94:
  ;  else if c
  %".96" = load i32, i32* %".10", align 4
  %".97" = icmp ne i32 %".96", 0
  br i1 %".97", label %".98", label %".113"
.98:
  %".99" = load i32, i32* %".4", align 4
  ; if a < b
  %".101" = load i32, i32* %".7", align 4
  %".102" = icmp slt i32 %".99", %".101"
  br i1 %".102", label %".103", label %".110"
.103:
  %".104" = bitcast [3 x i8]* @".str.d" to i8*
  %".105" = alloca i32
  store i32 7, i32* %".105"
  %".107" = load i32, i32* %".105"
  %".108" = call i32 (i8*, ...) @"printf"(i8* %".104", i32 %".107")
  ; printf "%d" 7
  br label %".112"
.110:
  ; else
  br label %".112"
.112:
  br label %".135"
.113:
  ; else if d
  %".115" = load i32, i32* %".13", align 4
  %".116" = icmp ne i32 %".115", 0
  br i1 %".116", label %".117", label %".135"
.117:
  %".118" = bitcast [3 x i8]* @".str.d" to i8*
  %".119" = alloca i32
  store i32 8, i32* %".119"
  %".121" = load i32, i32* %".119"
  %".122" = call i32 (i8*, ...) @"printf"(i8* %".118", i32 %".121")
  ; printf "%d" 8
  ; if d
  %".125" = load i32, i32* %".13", align 4
  %".126" = icmp ne i32 %".125", 0
  br i1 %".126", label %".127", label %".134"
.127:
  %".128" = bitcast [3 x i8]* @".str.d" to i8*
  %".129" = alloca i32
  store i32 9, i32* %".129"
  %".131" = load i32, i32* %".129"
  %".132" = call i32 (i8*, ...) @"printf"(i8* %".128", i32 %".131")
  ; printf "%d" 9
  br label %".134"
.134:
  br label %".135"
.135:
  %".136" = bitcast [3 x i8]* @".str.d" to i8*
  %".137" = alloca i32
  store i32 10, i32* %".137"
  %".139" = load i32, i32* %".137"
  %".140" = call i32 (i8*, ...) @"printf"(i8* %".136", i32 %".139")
  ;    printf "%d" 10
  store i32 1, i32* %".4", align 4
  ;  a = 1
  store i32 1, i32* %".7", align 4
  ; b = 1
  store i32 1, i32* %".10", align 4
  ; c = 1
  store i32 0, i32* %".13", align 4
  ; d = 0
  ;   if a
  %".151" = load i32, i32* %".4", align 4
  %".152" = icmp ne i32 %".151", 0
  br i1 %".152", label %".153", label %".185"
.153:
  %".154" = bitcast [3 x i8]* @".str.d" to i8*
  %".155" = alloca i32
  store i32 1, i32* %".155"
  %".157" = load i32, i32* %".155"
  %".158" = call i32 (i8*, ...) @"printf"(i8* %".154", i32 %".157")
  ; printf "%d" 1
  %".160" = load i32, i32* %".7", align 4
  ; if b < c
  %".162" = load i32, i32* %".10", align 4
  %".163" = icmp slt i32 %".160", %".162"
  br i1 %".163", label %".164", label %".171"
.164:
  %".165" = bitcast [3 x i8]* @".str.d" to i8*
  %".166" = alloca i32
  store i32 2, i32* %".166"
  %".168" = load i32, i32* %".166"
  %".169" = call i32 (i8*, ...) @"printf"(i8* %".165", i32 %".168")
  ; printf "%d" 2
  br label %".183"
.171:
  %".172" = load i32, i32* %".7", align 4
  ;  else if b > d
  %".174" = load i32, i32* %".13", align 4
  %".175" = icmp sgt i32 %".172", %".174"
  br i1 %".175", label %".176", label %".184"
.176:
  %".177" = bitcast [3 x i8]* @".str.d" to i8*
  %".178" = alloca i32
  store i32 3, i32* %".178"
  %".180" = load i32, i32* %".178"
  %".181" = call i32 (i8*, ...) @"printf"(i8* %".177", i32 %".180")
  ; printf "%d" 3
  br label %".184"
.183:
  br label %".261"
.184:
  br label %".183"
.185:
  ;  else if b
  %".187" = load i32, i32* %".7", align 4
  %".188" = icmp ne i32 %".187", 0
  br i1 %".188", label %".189", label %".220"
.189:
  %".190" = bitcast [3 x i8]* @".str.d" to i8*
  %".191" = alloca i32
  store i32 4, i32* %".191"
  %".193" = load i32, i32* %".191"
  %".194" = call i32 (i8*, ...) @"printf"(i8* %".190", i32 %".193")
  ; printf "%d" 4
  %".196" = load i32, i32* %".10", align 4
  ; if ! c
  %".198" = icmp ne i32 %".196", 0
  %".199" = xor i1 %".198", 1
  br i1 %".199", label %".200", label %".207"
.200:
  %".201" = bitcast [3 x i8]* @".str.d" to i8*
  %".202" = alloca i32
  store i32 5, i32* %".202"
  %".204" = load i32, i32* %".202"
  %".205" = call i32 (i8*, ...) @"printf"(i8* %".201", i32 %".204")
  ; printf "%d" 5
  br label %".213"
.207:
  ; else if d
  %".209" = load i32, i32* %".13", align 4
  %".210" = icmp ne i32 %".209", 0
  br i1 %".210", label %".211", label %".213"
.211:
  ;
  br label %".213"
.213:
  %".214" = bitcast [3 x i8]* @".str.d" to i8*
  %".215" = alloca i32
  store i32 6, i32* %".215"
  %".217" = load i32, i32* %".215"
  %".218" = call i32 (i8*, ...) @"printf"(i8* %".214", i32 %".217")
  ; printf "%d" 6
  br label %".261"
.220:
  ;  else if c
  %".222" = load i32, i32* %".10", align 4
  %".223" = icmp ne i32 %".222", 0
  br i1 %".223", label %".224", label %".239"
.224:
  %".225" = load i32, i32* %".4", align 4
  ; if a < b
  %".227" = load i32, i32* %".7", align 4
  %".228" = icmp slt i32 %".225", %".227"
  br i1 %".228", label %".229", label %".236"
.229:
  %".230" = bitcast [3 x i8]* @".str.d" to i8*
  %".231" = alloca i32
  store i32 7, i32* %".231"
  %".233" = load i32, i32* %".231"
  %".234" = call i32 (i8*, ...) @"printf"(i8* %".230", i32 %".233")
  ; printf "%d" 7
  br label %".238"
.236:
  ; else
  br label %".238"
.238:
  br label %".261"
.239:
  ; else if d
  %".241" = load i32, i32* %".13", align 4
  %".242" = icmp ne i32 %".241", 0
  br i1 %".242", label %".243", label %".261"
.243:
  %".244" = bitcast [3 x i8]* @".str.d" to i8*
  %".245" = alloca i32
  store i32 8, i32* %".245"
  %".247" = load i32, i32* %".245"
  %".248" = call i32 (i8*, ...) @"printf"(i8* %".244", i32 %".247")
  ; printf "%d" 8
  ; if d
  %".251" = load i32, i32* %".13", align 4
  %".252" = icmp ne i32 %".251", 0
  br i1 %".252", label %".253", label %".260"
.253:
  %".254" = bitcast [3 x i8]* @".str.d" to i8*
  %".255" = alloca i32
  store i32 9, i32* %".255"
  %".257" = load i32, i32* %".255"
  %".258" = call i32 (i8*, ...) @"printf"(i8* %".254", i32 %".257")
  ; printf "%d" 9
  br label %".260"
.260:
  br label %".261"
.261:
  %".262" = bitcast [3 x i8]* @".str.d" to i8*
  %".263" = alloca i32
  store i32 10, i32* %".263"
  %".265" = load i32, i32* %".263"
  %".266" = call i32 (i8*, ...) @"printf"(i8* %".262", i32 %".265")
  ;    printf "%d" 10
  store i32 0, i32* %".4", align 4
  ;  a = 0
  store i32 1, i32* %".7", align 4
  ; b = 1
  store i32 1, i32* %".10", align 4
  ; c = 1
  store i32 0, i32* %".13", align 4
  ; d = 0
  ;   if a
  %".277" = load i32, i32* %".4", align 4
  %".278" = icmp ne i32 %".277", 0
  br i1 %".278", label %".279", label %".311"
.279:
  %".280" = bitcast [3 x i8]* @".str.d" to i8*
  %".281" = alloca i32
  store i32 1, i32* %".281"
  %".283" = load i32, i32* %".281"
  %".284" = call i32 (i8*, ...) @"printf"(i8* %".280", i32 %".283")
  ; printf "%d" 1
  %".286" = load i32, i32* %".7", align 4
  ; if b < c
  %".288" = load i32, i32* %".10", align 4
  %".289" = icmp slt i32 %".286", %".288"
  br i1 %".289", label %".290", label %".297"
.290:
  %".291" = bitcast [3 x i8]* @".str.d" to i8*
  %".292" = alloca i32
  store i32 2, i32* %".292"
  %".294" = load i32, i32* %".292"
  %".295" = call i32 (i8*, ...) @"printf"(i8* %".291", i32 %".294")
  ; printf "%d" 2
  br label %".309"
.297:
  %".298" = load i32, i32* %".7", align 4
  ;  else if b > d
  %".300" = load i32, i32* %".13", align 4
  %".301" = icmp sgt i32 %".298", %".300"
  br i1 %".301", label %".302", label %".310"
.302:
  %".303" = bitcast [3 x i8]* @".str.d" to i8*
  %".304" = alloca i32
  store i32 3, i32* %".304"
  %".306" = load i32, i32* %".304"
  %".307" = call i32 (i8*, ...) @"printf"(i8* %".303", i32 %".306")
  ; printf "%d" 3
  br label %".310"
.309:
  br label %".387"
.310:
  br label %".309"
.311:
  ;  else if b
  %".313" = load i32, i32* %".7", align 4
  %".314" = icmp ne i32 %".313", 0
  br i1 %".314", label %".315", label %".346"
.315:
  %".316" = bitcast [3 x i8]* @".str.d" to i8*
  %".317" = alloca i32
  store i32 4, i32* %".317"
  %".319" = load i32, i32* %".317"
  %".320" = call i32 (i8*, ...) @"printf"(i8* %".316", i32 %".319")
  ; printf "%d" 4
  %".322" = load i32, i32* %".10", align 4
  ; if ! c
  %".324" = icmp ne i32 %".322", 0
  %".325" = xor i1 %".324", 1
  br i1 %".325", label %".326", label %".333"
.326:
  %".327" = bitcast [3 x i8]* @".str.d" to i8*
  %".328" = alloca i32
  store i32 5, i32* %".328"
  %".330" = load i32, i32* %".328"
  %".331" = call i32 (i8*, ...) @"printf"(i8* %".327", i32 %".330")
  ; printf "%d" 5
  br label %".339"
.333:
  ; else if d
  %".335" = load i32, i32* %".13", align 4
  %".336" = icmp ne i32 %".335", 0
  br i1 %".336", label %".337", label %".339"
.337:
  ;
  br label %".339"
.339:
  %".340" = bitcast [3 x i8]* @".str.d" to i8*
  %".341" = alloca i32
  store i32 6, i32* %".341"
  %".343" = load i32, i32* %".341"
  %".344" = call i32 (i8*, ...) @"printf"(i8* %".340", i32 %".343")
  ; printf "%d" 6
  br label %".387"
.346:
  ;  else if c
  %".348" = load i32, i32* %".10", align 4
  %".349" = icmp ne i32 %".348", 0
  br i1 %".349", label %".350", label %".365"
.350:
  %".351" = load i32, i32* %".4", align 4
  ; if a < b
  %".353" = load i32, i32* %".7", align 4
  %".354" = icmp slt i32 %".351", %".353"
  br i1 %".354", label %".355", label %".362"
.355:
  %".356" = bitcast [3 x i8]* @".str.d" to i8*
  %".357" = alloca i32
  store i32 7, i32* %".357"
  %".359" = load i32, i32* %".357"
  %".360" = call i32 (i8*, ...) @"printf"(i8* %".356", i32 %".359")
  ; printf "%d" 7
  br label %".364"
.362:
  ; else
  br label %".364"
.364:
  br label %".387"
.365:
  ; else if d
  %".367" = load i32, i32* %".13", align 4
  %".368" = icmp ne i32 %".367", 0
  br i1 %".368", label %".369", label %".387"
.369:
  %".370" = bitcast [3 x i8]* @".str.d" to i8*
  %".371" = alloca i32
  store i32 8, i32* %".371"
  %".373" = load i32, i32* %".371"
  %".374" = call i32 (i8*, ...) @"printf"(i8* %".370", i32 %".373")
  ; printf "%d" 8
  ; if d
  %".377" = load i32, i32* %".13", align 4
  %".378" = icmp ne i32 %".377", 0
  br i1 %".378", label %".379", label %".386"
.379:
  %".380" = bitcast [3 x i8]* @".str.d" to i8*
  %".381" = alloca i32
  store i32 9, i32* %".381"
  %".383" = load i32, i32* %".381"
  %".384" = call i32 (i8*, ...) @"printf"(i8* %".380", i32 %".383")
  ; printf "%d" 9
  br label %".386"
.386:
  br label %".387"
.387:
  %".388" = bitcast [3 x i8]* @".str.d" to i8*
  %".389" = alloca i32
  store i32 10, i32* %".389"
  %".391" = load i32, i32* %".389"
  %".392" = call i32 (i8*, ...) @"printf"(i8* %".388", i32 %".391")
  ;    printf "%d" 10
  store i32 0, i32* %".4", align 4
  ;  a = 0
  store i32 0, i32* %".7", align 4
  ; b = 0
  store i32 1, i32* %".10", align 4
  ; c = 1
  store i32 0, i32* %".13", align 4
  ; d = 0
  ;   if a
  %".403" = load i32, i32* %".4", align 4
  %".404" = icmp ne i32 %".403", 0
  br i1 %".404", label %".405", label %".437"
.405:
  %".406" = bitcast [3 x i8]* @".str.d" to i8*
  %".407" = alloca i32
  store i32 1, i32* %".407"
  %".409" = load i32, i32* %".407"
  %".410" = call i32 (i8*, ...) @"printf"(i8* %".406", i32 %".409")
  ; printf "%d" 1
  %".412" = load i32, i32* %".7", align 4
  ; if b < c
  %".414" = load i32, i32* %".10", align 4
  %".415" = icmp slt i32 %".412", %".414"
  br i1 %".415", label %".416", label %".423"
.416:
  %".417" = bitcast [3 x i8]* @".str.d" to i8*
  %".418" = alloca i32
  store i32 2, i32* %".418"
  %".420" = load i32, i32* %".418"
  %".421" = call i32 (i8*, ...) @"printf"(i8* %".417", i32 %".420")
  ; printf "%d" 2
  br label %".435"
.423:
  %".424" = load i32, i32* %".7", align 4
  ;  else if b > d
  %".426" = load i32, i32* %".13", align 4
  %".427" = icmp sgt i32 %".424", %".426"
  br i1 %".427", label %".428", label %".436"
.428:
  %".429" = bitcast [3 x i8]* @".str.d" to i8*
  %".430" = alloca i32
  store i32 3, i32* %".430"
  %".432" = load i32, i32* %".430"
  %".433" = call i32 (i8*, ...) @"printf"(i8* %".429", i32 %".432")
  ; printf "%d" 3
  br label %".436"
.435:
  br label %".513"
.436:
  br label %".435"
.437:
  ;  else if b
  %".439" = load i32, i32* %".7", align 4
  %".440" = icmp ne i32 %".439", 0
  br i1 %".440", label %".441", label %".472"
.441:
  %".442" = bitcast [3 x i8]* @".str.d" to i8*
  %".443" = alloca i32
  store i32 4, i32* %".443"
  %".445" = load i32, i32* %".443"
  %".446" = call i32 (i8*, ...) @"printf"(i8* %".442", i32 %".445")
  ; printf "%d" 4
  %".448" = load i32, i32* %".10", align 4
  ; if ! c
  %".450" = icmp ne i32 %".448", 0
  %".451" = xor i1 %".450", 1
  br i1 %".451", label %".452", label %".459"
.452:
  %".453" = bitcast [3 x i8]* @".str.d" to i8*
  %".454" = alloca i32
  store i32 5, i32* %".454"
  %".456" = load i32, i32* %".454"
  %".457" = call i32 (i8*, ...) @"printf"(i8* %".453", i32 %".456")
  ; printf "%d" 5
  br label %".465"
.459:
  ; else if d
  %".461" = load i32, i32* %".13", align 4
  %".462" = icmp ne i32 %".461", 0
  br i1 %".462", label %".463", label %".465"
.463:
  ;
  br label %".465"
.465:
  %".466" = bitcast [3 x i8]* @".str.d" to i8*
  %".467" = alloca i32
  store i32 6, i32* %".467"
  %".469" = load i32, i32* %".467"
  %".470" = call i32 (i8*, ...) @"printf"(i8* %".466", i32 %".469")
  ; printf "%d" 6
  br label %".513"
.472:
  ;  else if c
  %".474" = load i32, i32* %".10", align 4
  %".475" = icmp ne i32 %".474", 0
  br i1 %".475", label %".476", label %".491"
.476:
  %".477" = load i32, i32* %".4", align 4
  ; if a < b
  %".479" = load i32, i32* %".7", align 4
  %".480" = icmp slt i32 %".477", %".479"
  br i1 %".480", label %".481", label %".488"
.481:
  %".482" = bitcast [3 x i8]* @".str.d" to i8*
  %".483" = alloca i32
  store i32 7, i32* %".483"
  %".485" = load i32, i32* %".483"
  %".486" = call i32 (i8*, ...) @"printf"(i8* %".482", i32 %".485")
  ; printf "%d" 7
  br label %".490"
.488:
  ; else
  br label %".490"
.490:
  br label %".513"
.491:
  ; else if d
  %".493" = load i32, i32* %".13", align 4
  %".494" = icmp ne i32 %".493", 0
  br i1 %".494", label %".495", label %".513"
.495:
  %".496" = bitcast [3 x i8]* @".str.d" to i8*
  %".497" = alloca i32
  store i32 8, i32* %".497"
  %".499" = load i32, i32* %".497"
  %".500" = call i32 (i8*, ...) @"printf"(i8* %".496", i32 %".499")
  ; printf "%d" 8
  ; if d
  %".503" = load i32, i32* %".13", align 4
  %".504" = icmp ne i32 %".503", 0
  br i1 %".504", label %".505", label %".512"
.505:
  %".506" = bitcast [3 x i8]* @".str.d" to i8*
  %".507" = alloca i32
  store i32 9, i32* %".507"
  %".509" = load i32, i32* %".507"
  %".510" = call i32 (i8*, ...) @"printf"(i8* %".506", i32 %".509")
  ; printf "%d" 9
  br label %".512"
.512:
  br label %".513"
.513:
  %".514" = bitcast [3 x i8]* @".str.d" to i8*
  %".515" = alloca i32
  store i32 10, i32* %".515"
  %".517" = load i32, i32* %".515"
  %".518" = call i32 (i8*, ...) @"printf"(i8* %".514", i32 %".517")
  ;    printf "%d" 10
  store i32 0, i32* %".4", align 4
  ;  a = 0
  store i32 1, i32* %".7", align 4
  ; b = 1
  store i32 1, i32* %".10", align 4
  ; c = 1
  store i32 0, i32* %".13", align 4
  ; d = 0
  ;   if a
  %".529" = load i32, i32* %".4", align 4
  %".530" = icmp ne i32 %".529", 0
  br i1 %".530", label %".531", label %".563"
.531:
  %".532" = bitcast [3 x i8]* @".str.d" to i8*
  %".533" = alloca i32
  store i32 1, i32* %".533"
  %".535" = load i32, i32* %".533"
  %".536" = call i32 (i8*, ...) @"printf"(i8* %".532", i32 %".535")
  ; printf "%d" 1
  %".538" = load i32, i32* %".7", align 4
  ; if b < c
  %".540" = load i32, i32* %".10", align 4
  %".541" = icmp slt i32 %".538", %".540"
  br i1 %".541", label %".542", label %".549"
.542:
  %".543" = bitcast [3 x i8]* @".str.d" to i8*
  %".544" = alloca i32
  store i32 2, i32* %".544"
  %".546" = load i32, i32* %".544"
  %".547" = call i32 (i8*, ...) @"printf"(i8* %".543", i32 %".546")
  ; printf "%d" 2
  br label %".561"
.549:
  %".550" = load i32, i32* %".7", align 4
  ;  else if b > d
  %".552" = load i32, i32* %".13", align 4
  %".553" = icmp sgt i32 %".550", %".552"
  br i1 %".553", label %".554", label %".562"
.554:
  %".555" = bitcast [3 x i8]* @".str.d" to i8*
  %".556" = alloca i32
  store i32 3, i32* %".556"
  %".558" = load i32, i32* %".556"
  %".559" = call i32 (i8*, ...) @"printf"(i8* %".555", i32 %".558")
  ; printf "%d" 3
  br label %".562"
.561:
  br label %".639"
.562:
  br label %".561"
.563:
  ;  else if b
  %".565" = load i32, i32* %".7", align 4
  %".566" = icmp ne i32 %".565", 0
  br i1 %".566", label %".567", label %".598"
.567:
  %".568" = bitcast [3 x i8]* @".str.d" to i8*
  %".569" = alloca i32
  store i32 4, i32* %".569"
  %".571" = load i32, i32* %".569"
  %".572" = call i32 (i8*, ...) @"printf"(i8* %".568", i32 %".571")
  ; printf "%d" 4
  %".574" = load i32, i32* %".10", align 4
  ; if ! c
  %".576" = icmp ne i32 %".574", 0
  %".577" = xor i1 %".576", 1
  br i1 %".577", label %".578", label %".585"
.578:
  %".579" = bitcast [3 x i8]* @".str.d" to i8*
  %".580" = alloca i32
  store i32 5, i32* %".580"
  %".582" = load i32, i32* %".580"
  %".583" = call i32 (i8*, ...) @"printf"(i8* %".579", i32 %".582")
  ; printf "%d" 5
  br label %".591"
.585:
  ; else if d
  %".587" = load i32, i32* %".13", align 4
  %".588" = icmp ne i32 %".587", 0
  br i1 %".588", label %".589", label %".591"
.589:
  ;
  br label %".591"
.591:
  %".592" = bitcast [3 x i8]* @".str.d" to i8*
  %".593" = alloca i32
  store i32 6, i32* %".593"
  %".595" = load i32, i32* %".593"
  %".596" = call i32 (i8*, ...) @"printf"(i8* %".592", i32 %".595")
  ; printf "%d" 6
  br label %".639"
.598:
  ;  else if c
  %".600" = load i32, i32* %".10", align 4
  %".601" = icmp ne i32 %".600", 0
  br i1 %".601", label %".602", label %".617"
.602:
  %".603" = load i32, i32* %".4", align 4
  ; if a < b
  %".605" = load i32, i32* %".7", align 4
  %".606" = icmp slt i32 %".603", %".605"
  br i1 %".606", label %".607", label %".614"
.607:
  %".608" = bitcast [3 x i8]* @".str.d" to i8*
  %".609" = alloca i32
  store i32 7, i32* %".609"
  %".611" = load i32, i32* %".609"
  %".612" = call i32 (i8*, ...) @"printf"(i8* %".608", i32 %".611")
  ; printf "%d" 7
  br label %".616"
.614:
  ; else
  br label %".616"
.616:
  br label %".639"
.617:
  ; else if d
  %".619" = load i32, i32* %".13", align 4
  %".620" = icmp ne i32 %".619", 0
  br i1 %".620", label %".621", label %".639"
.621:
  %".622" = bitcast [3 x i8]* @".str.d" to i8*
  %".623" = alloca i32
  store i32 8, i32* %".623"
  %".625" = load i32, i32* %".623"
  %".626" = call i32 (i8*, ...) @"printf"(i8* %".622", i32 %".625")
  ; printf "%d" 8
  ; if d
  %".629" = load i32, i32* %".13", align 4
  %".630" = icmp ne i32 %".629", 0
  br i1 %".630", label %".631", label %".638"
.631:
  %".632" = bitcast [3 x i8]* @".str.d" to i8*
  %".633" = alloca i32
  store i32 9, i32* %".633"
  %".635" = load i32, i32* %".633"
  %".636" = call i32 (i8*, ...) @"printf"(i8* %".632", i32 %".635")
  ; printf "%d" 9
  br label %".638"
.638:
  br label %".639"
.639:
  %".640" = bitcast [3 x i8]* @".str.d" to i8*
  %".641" = alloca i32
  store i32 10, i32* %".641"
  %".643" = load i32, i32* %".641"
  %".644" = call i32 (i8*, ...) @"printf"(i8* %".640", i32 %".643")
  ;    printf "%d" 10
  ret i32 0
  ;  return 0
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"
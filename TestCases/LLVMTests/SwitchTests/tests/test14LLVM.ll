; ModuleID = "tests/test14.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;    INT main
  %".4" = alloca i32, align 4
  store i32 0, i32* %".4", align 4
  ;  INT a = 0
  %".7" = alloca i32, align 4
  store i32 0, i32* %".7", align 4
  ; INT b = 0
  store i32 6, i32* %".4", align 4
  ; a = 6
  %".12" = load i32, i32* %".4", align 4
  ; switch a
  %".14" = icmp eq i32 %".12", 1
  br i1 %".14", label %".21", label %".15"
.15:
  %".16" = load i32, i32* %".4", align 4
  %".17" = icmp eq i32 %".16", 6
  br i1 %".17", label %".21", label %".18"
.18:
  %".19" = load i32, i32* %".4", align 4
  %".20" = icmp eq i32 %".19", 2
  br label %".21"
.21:
  ; case 1 b = 1
  %".23" = phi  i1 [1, %".15"], [%".20", %".18"], [1, %".2"]
  br i1 %".23", label %".24", label %".223"
.24:
  %".25" = load i32, i32* %".4", align 4
  %".26" = icmp eq i32 %".25", 1
  br i1 %".26", label %".30", label %".27"
.27:
  %".28" = load i32, i32* %".4", align 4
  %".29" = icmp eq i32 %".28", 6
  br label %".30"
.30:
  %".31" = phi  i1 [1, %".24"], [%".29", %".27"]
  br i1 %".31", label %".32", label %".160"
.32:
  %".33" = load i32, i32* %".4", align 4
  %".34" = icmp eq i32 %".33", 1
  br i1 %".34", label %".35", label %".97"
.35:
  store i32 1, i32* %".7", align 4
  %".37" = load i32, i32* %".7", align 4
  ;  switch b
  %".39" = icmp eq i32 %".37", 1
  br i1 %".39", label %".40", label %".47"
.40:
  ; case 1 printf "%d" 11
  %".42" = bitcast [3 x i8]* @".str.0" to i8*
  %".43" = alloca i32
  store i32 11, i32* %".43"
  %".45" = load i32, i32* %".43"
  %".46" = call i32 (i8*, ...) @"printf"(i8* %".42", i32 %".45")
  br label %".47"
.47:
  %".48" = load i32, i32* %".7", align 4
  %".49" = icmp eq i32 %".48", 6
  br i1 %".49", label %".53", label %".50"
.50:
  %".51" = load i32, i32* %".7", align 4
  %".52" = icmp eq i32 %".51", 2
  br label %".53"
.53:
  ; break case 6 printf "%d" 66
  %".55" = phi  i1 [1, %".47"], [%".52", %".50"]
  br i1 %".55", label %".56", label %".72"
.56:
  %".57" = load i32, i32* %".7", align 4
  %".58" = icmp eq i32 %".57", 6
  br i1 %".58", label %".59", label %".65"
.59:
  %".60" = bitcast [3 x i8]* @".str.0" to i8*
  %".61" = alloca i32
  store i32 66, i32* %".61"
  %".63" = load i32, i32* %".61"
  %".64" = call i32 (i8*, ...) @"printf"(i8* %".60", i32 %".63")
  br label %".65"
.65:
  %".66" = bitcast [3 x i8]* @".str.0" to i8*
  %".67" = alloca i32
  store i32 22, i32* %".67"
  %".69" = load i32, i32* %".67"
  %".70" = call i32 (i8*, ...) @"printf"(i8* %".66", i32 %".69")
  ; case 2 printf "%d" 22
  br label %".72"
.72:
  %".73" = load i32, i32* %".7", align 4
  %".74" = icmp ne i32 %".73", 1
  br i1 %".74", label %".75", label %".81"
.75:
  %".76" = load i32, i32* %".7", align 4
  %".77" = icmp ne i32 %".76", 6
  br i1 %".77", label %".78", label %".81"
.78:
  %".79" = load i32, i32* %".7", align 4
  %".80" = icmp ne i32 %".79", 2
  br label %".81"
.81:
  ; break default printf "%d" 33
  %".83" = phi  i1 [0, %".72"], [0, %".75"], [%".80", %".78"]
  br i1 %".83", label %".84", label %".90"
.84:
  %".85" = bitcast [3 x i8]* @".str.0" to i8*
  %".86" = alloca i32
  store i32 33, i32* %".86"
  %".88" = load i32, i32* %".86"
  %".89" = call i32 (i8*, ...) @"printf"(i8* %".85", i32 %".88")
  br label %".90"
.90:
  %".91" = bitcast [3 x i8]* @".str.0" to i8*
  %".92" = alloca i32
  store i32 1, i32* %".92"
  %".94" = load i32, i32* %".92"
  %".95" = call i32 (i8*, ...) @"printf"(i8* %".91", i32 %".94")
  ; break    printf "%d" 1
  br label %".97"
.97:
  store i32 6, i32* %".7", align 4
  ; case 6 b = 6
  %".100" = load i32, i32* %".7", align 4
  ;  switch b
  %".102" = icmp eq i32 %".100", 1
  br i1 %".102", label %".103", label %".110"
.103:
  ; case 1 printf "%d" 11
  %".105" = bitcast [3 x i8]* @".str.0" to i8*
  %".106" = alloca i32
  store i32 11, i32* %".106"
  %".108" = load i32, i32* %".106"
  %".109" = call i32 (i8*, ...) @"printf"(i8* %".105", i32 %".108")
  br label %".110"
.110:
  %".111" = load i32, i32* %".7", align 4
  %".112" = icmp eq i32 %".111", 6
  br i1 %".112", label %".116", label %".113"
.113:
  %".114" = load i32, i32* %".7", align 4
  %".115" = icmp eq i32 %".114", 2
  br label %".116"
.116:
  ; break case 6 printf "%d" 66
  %".118" = phi  i1 [1, %".110"], [%".115", %".113"]
  br i1 %".118", label %".119", label %".135"
.119:
  %".120" = load i32, i32* %".7", align 4
  %".121" = icmp eq i32 %".120", 6
  br i1 %".121", label %".122", label %".128"
.122:
  %".123" = bitcast [3 x i8]* @".str.0" to i8*
  %".124" = alloca i32
  store i32 66, i32* %".124"
  %".126" = load i32, i32* %".124"
  %".127" = call i32 (i8*, ...) @"printf"(i8* %".123", i32 %".126")
  br label %".128"
.128:
  %".129" = bitcast [3 x i8]* @".str.0" to i8*
  %".130" = alloca i32
  store i32 22, i32* %".130"
  %".132" = load i32, i32* %".130"
  %".133" = call i32 (i8*, ...) @"printf"(i8* %".129", i32 %".132")
  ; case 2 printf "%d" 22
  br label %".135"
.135:
  %".136" = load i32, i32* %".7", align 4
  %".137" = icmp ne i32 %".136", 1
  br i1 %".137", label %".138", label %".144"
.138:
  %".139" = load i32, i32* %".7", align 4
  %".140" = icmp ne i32 %".139", 6
  br i1 %".140", label %".141", label %".144"
.141:
  %".142" = load i32, i32* %".7", align 4
  %".143" = icmp ne i32 %".142", 2
  br label %".144"
.144:
  ; break default printf "%d" 33
  %".146" = phi  i1 [0, %".135"], [0, %".138"], [%".143", %".141"]
  br i1 %".146", label %".147", label %".153"
.147:
  %".148" = bitcast [3 x i8]* @".str.0" to i8*
  %".149" = alloca i32
  store i32 33, i32* %".149"
  %".151" = load i32, i32* %".149"
  %".152" = call i32 (i8*, ...) @"printf"(i8* %".148", i32 %".151")
  br label %".153"
.153:
  %".154" = bitcast [3 x i8]* @".str.0" to i8*
  %".155" = alloca i32
  store i32 6, i32* %".155"
  %".157" = load i32, i32* %".155"
  %".158" = call i32 (i8*, ...) @"printf"(i8* %".154", i32 %".157")
  ; break    printf "%d" 6
  br label %".160"
.160:
  store i32 2, i32* %".7", align 4
  ; case 2 b = 2
  %".163" = load i32, i32* %".7", align 4
  ;  switch b
  %".165" = icmp eq i32 %".163", 1
  br i1 %".165", label %".166", label %".173"
.166:
  ; case 1 printf "%d" 11
  %".168" = bitcast [3 x i8]* @".str.0" to i8*
  %".169" = alloca i32
  store i32 11, i32* %".169"
  %".171" = load i32, i32* %".169"
  %".172" = call i32 (i8*, ...) @"printf"(i8* %".168", i32 %".171")
  br label %".173"
.173:
  %".174" = load i32, i32* %".7", align 4
  %".175" = icmp eq i32 %".174", 6
  br i1 %".175", label %".179", label %".176"
.176:
  %".177" = load i32, i32* %".7", align 4
  %".178" = icmp eq i32 %".177", 2
  br label %".179"
.179:
  ; break case 6 printf "%d" 66
  %".181" = phi  i1 [1, %".173"], [%".178", %".176"]
  br i1 %".181", label %".182", label %".198"
.182:
  %".183" = load i32, i32* %".7", align 4
  %".184" = icmp eq i32 %".183", 6
  br i1 %".184", label %".185", label %".191"
.185:
  %".186" = bitcast [3 x i8]* @".str.0" to i8*
  %".187" = alloca i32
  store i32 66, i32* %".187"
  %".189" = load i32, i32* %".187"
  %".190" = call i32 (i8*, ...) @"printf"(i8* %".186", i32 %".189")
  br label %".191"
.191:
  %".192" = bitcast [3 x i8]* @".str.0" to i8*
  %".193" = alloca i32
  store i32 22, i32* %".193"
  %".195" = load i32, i32* %".193"
  %".196" = call i32 (i8*, ...) @"printf"(i8* %".192", i32 %".195")
  ; case 2 printf "%d" 22
  br label %".198"
.198:
  %".199" = load i32, i32* %".7", align 4
  %".200" = icmp ne i32 %".199", 1
  br i1 %".200", label %".201", label %".207"
.201:
  %".202" = load i32, i32* %".7", align 4
  %".203" = icmp ne i32 %".202", 6
  br i1 %".203", label %".204", label %".207"
.204:
  %".205" = load i32, i32* %".7", align 4
  %".206" = icmp ne i32 %".205", 2
  br label %".207"
.207:
  ; break default printf "%d" 33
  %".209" = phi  i1 [0, %".198"], [0, %".201"], [%".206", %".204"]
  br i1 %".209", label %".210", label %".216"
.210:
  %".211" = bitcast [3 x i8]* @".str.0" to i8*
  %".212" = alloca i32
  store i32 33, i32* %".212"
  %".214" = load i32, i32* %".212"
  %".215" = call i32 (i8*, ...) @"printf"(i8* %".211", i32 %".214")
  br label %".216"
.216:
  %".217" = bitcast [3 x i8]* @".str.0" to i8*
  %".218" = alloca i32
  store i32 2, i32* %".218"
  %".220" = load i32, i32* %".218"
  %".221" = call i32 (i8*, ...) @"printf"(i8* %".217", i32 %".220")
  ; break    printf "%d" 2
  br label %".223"
.223:
  %".224" = load i32, i32* %".4", align 4
  %".225" = icmp ne i32 %".224", 1
  br i1 %".225", label %".226", label %".232"
.226:
  %".227" = load i32, i32* %".4", align 4
  %".228" = icmp ne i32 %".227", 6
  br i1 %".228", label %".229", label %".232"
.229:
  %".230" = load i32, i32* %".4", align 4
  %".231" = icmp ne i32 %".230", 2
  br label %".232"
.232:
  ; break default b = 3
  %".234" = phi  i1 [0, %".223"], [0, %".226"], [%".231", %".229"]
  br i1 %".234", label %".235", label %".297"
.235:
  store i32 3, i32* %".7", align 4
  %".237" = load i32, i32* %".7", align 4
  ;  switch b
  %".239" = icmp eq i32 %".237", 1
  br i1 %".239", label %".240", label %".247"
.240:
  ; case 1 printf "%d" 11
  %".242" = bitcast [3 x i8]* @".str.0" to i8*
  %".243" = alloca i32
  store i32 11, i32* %".243"
  %".245" = load i32, i32* %".243"
  %".246" = call i32 (i8*, ...) @"printf"(i8* %".242", i32 %".245")
  br label %".247"
.247:
  %".248" = load i32, i32* %".7", align 4
  %".249" = icmp eq i32 %".248", 6
  br i1 %".249", label %".253", label %".250"
.250:
  %".251" = load i32, i32* %".7", align 4
  %".252" = icmp eq i32 %".251", 2
  br label %".253"
.253:
  ; break case 6 printf "%d" 66
  %".255" = phi  i1 [1, %".247"], [%".252", %".250"]
  br i1 %".255", label %".256", label %".272"
.256:
  %".257" = load i32, i32* %".7", align 4
  %".258" = icmp eq i32 %".257", 6
  br i1 %".258", label %".259", label %".265"
.259:
  %".260" = bitcast [3 x i8]* @".str.0" to i8*
  %".261" = alloca i32
  store i32 66, i32* %".261"
  %".263" = load i32, i32* %".261"
  %".264" = call i32 (i8*, ...) @"printf"(i8* %".260", i32 %".263")
  br label %".265"
.265:
  %".266" = bitcast [3 x i8]* @".str.0" to i8*
  %".267" = alloca i32
  store i32 22, i32* %".267"
  %".269" = load i32, i32* %".267"
  %".270" = call i32 (i8*, ...) @"printf"(i8* %".266", i32 %".269")
  ; case 2 printf "%d" 22
  br label %".272"
.272:
  %".273" = load i32, i32* %".7", align 4
  %".274" = icmp ne i32 %".273", 1
  br i1 %".274", label %".275", label %".281"
.275:
  %".276" = load i32, i32* %".7", align 4
  %".277" = icmp ne i32 %".276", 6
  br i1 %".277", label %".278", label %".281"
.278:
  %".279" = load i32, i32* %".7", align 4
  %".280" = icmp ne i32 %".279", 2
  br label %".281"
.281:
  ; break default printf "%d" 33
  %".283" = phi  i1 [0, %".272"], [0, %".275"], [%".280", %".278"]
  br i1 %".283", label %".284", label %".290"
.284:
  %".285" = bitcast [3 x i8]* @".str.0" to i8*
  %".286" = alloca i32
  store i32 33, i32* %".286"
  %".288" = load i32, i32* %".286"
  %".289" = call i32 (i8*, ...) @"printf"(i8* %".285", i32 %".288")
  br label %".290"
.290:
  %".291" = bitcast [3 x i8]* @".str.0" to i8*
  %".292" = alloca i32
  store i32 3, i32* %".292"
  %".294" = load i32, i32* %".292"
  %".295" = call i32 (i8*, ...) @"printf"(i8* %".291", i32 %".294")
  ; break    printf "%d" 3
  br label %".297"
.297:
  %".298" = bitcast [3 x i8]* @".str.0" to i8*
  %".299" = alloca i32
  store i32 4, i32* %".299"
  %".301" = load i32, i32* %".299"
  %".302" = call i32 (i8*, ...) @"printf"(i8* %".298", i32 %".301")
  ; break    printf "%d" 4
  ret i32 0
  ;  return 0
}

@".str.0" = internal constant [3 x i8] c"%d\00"
declare i32 @"printf"(i8* %".1", ...)

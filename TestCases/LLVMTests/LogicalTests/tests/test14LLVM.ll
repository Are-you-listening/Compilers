; ModuleID = "tests/test14.c"
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
  %".62" = bitcast [3 x i8]* @".str.0" to i8*
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
  %".85" = bitcast [3 x i8]* @".str.0" to i8*
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
  %".113" = bitcast [3 x i8]* @".str.0" to i8*
  %".114" = alloca i32
  store i32 %".111", i32* %".114"
  %".116" = load i32, i32* %".114"
  %".117" = call i32 (i8*, ...) @"printf"(i8* %".113", i32 %".116")
  store i32 0, i32* %".4", align 4
  ;  a = 0
  store i32 1, i32* %".7", align 4
  ; b = 1
  ; f = a && ! b || c || ! b && ! d
  %".123" = load i32, i32* %".4", align 4
  %".124" = icmp ne i32 %".123", 0
  br i1 %".124", label %".125", label %".131"
.125:
  %".126" = load i32, i32* %".7", align 4
  %".127" = icmp ne i32 %".126", 0
  br i1 %".127", label %".131", label %".128"
.128:
  %".129" = load i32, i32* %".10", align 4
  %".130" = icmp ne i32 %".129", 0
  br i1 %".130", label %".131", label %".139"
.131:
  %".132" = load i32, i32* %".7", align 4
  %".133" = icmp ne i32 %".132", 0
  br i1 %".133", label %".134", label %".139"
.134:
  %".135" = load i32, i32* %".13", align 4
  %".136" = icmp ne i32 %".135", 0
  %".137" = xor i1 %".136", 1
  %".138" = xor i1 %".137", 1
  br label %".139"
.139:
  %".140" = phi  i1 [1, %".128"], [1, %".131"], [%".138", %".134"]
  %".141" = zext i1 %".140" to i32
  store i32 %".141", i32* %".19", align 4
  %".143" = load i32, i32* %".19", align 4
  ; printf "%d" f
  %".145" = bitcast [3 x i8]* @".str.0" to i8*
  %".146" = alloca i32
  store i32 %".143", i32* %".146"
  %".148" = load i32, i32* %".146"
  %".149" = call i32 (i8*, ...) @"printf"(i8* %".145", i32 %".148")
  store i32 1, i32* %".4", align 4
  ;  a = 1
  store i32 1, i32* %".7", align 4
  ; b = 1
  ; f = a && ! b || c || ! b && ! d
  %".155" = load i32, i32* %".4", align 4
  %".156" = icmp ne i32 %".155", 0
  br i1 %".156", label %".157", label %".163"
.157:
  %".158" = load i32, i32* %".7", align 4
  %".159" = icmp ne i32 %".158", 0
  br i1 %".159", label %".163", label %".160"
.160:
  %".161" = load i32, i32* %".10", align 4
  %".162" = icmp ne i32 %".161", 0
  br i1 %".162", label %".163", label %".171"
.163:
  %".164" = load i32, i32* %".7", align 4
  %".165" = icmp ne i32 %".164", 0
  br i1 %".165", label %".166", label %".171"
.166:
  %".167" = load i32, i32* %".13", align 4
  %".168" = icmp ne i32 %".167", 0
  %".169" = xor i1 %".168", 1
  %".170" = xor i1 %".169", 1
  br label %".171"
.171:
  %".172" = phi  i1 [1, %".160"], [1, %".163"], [%".170", %".166"]
  %".173" = zext i1 %".172" to i32
  store i32 %".173", i32* %".19", align 4
  %".175" = load i32, i32* %".19", align 4
  ; printf "%d" f
  %".177" = bitcast [3 x i8]* @".str.0" to i8*
  %".178" = alloca i32
  store i32 %".175", i32* %".178"
  %".180" = load i32, i32* %".178"
  %".181" = call i32 (i8*, ...) @"printf"(i8* %".177", i32 %".180")
  store i32 0, i32* %".4", align 4
  ;  a = 0
  store i32 0, i32* %".7", align 4
  ; b = 0
  store i32 1, i32* %".10", align 4
  ; c = 1
  ; f = a && ! b || c || ! b && ! d
  %".189" = load i32, i32* %".4", align 4
  %".190" = icmp ne i32 %".189", 0
  br i1 %".190", label %".191", label %".197"
.191:
  %".192" = load i32, i32* %".7", align 4
  %".193" = icmp ne i32 %".192", 0
  br i1 %".193", label %".197", label %".194"
.194:
  %".195" = load i32, i32* %".10", align 4
  %".196" = icmp ne i32 %".195", 0
  br i1 %".196", label %".197", label %".205"
.197:
  %".198" = load i32, i32* %".7", align 4
  %".199" = icmp ne i32 %".198", 0
  br i1 %".199", label %".200", label %".205"
.200:
  %".201" = load i32, i32* %".13", align 4
  %".202" = icmp ne i32 %".201", 0
  %".203" = xor i1 %".202", 1
  %".204" = xor i1 %".203", 1
  br label %".205"
.205:
  %".206" = phi  i1 [1, %".194"], [1, %".197"], [%".204", %".200"]
  %".207" = zext i1 %".206" to i32
  store i32 %".207", i32* %".19", align 4
  %".209" = load i32, i32* %".19", align 4
  ; printf "%d" f
  %".211" = bitcast [3 x i8]* @".str.0" to i8*
  %".212" = alloca i32
  store i32 %".209", i32* %".212"
  %".214" = load i32, i32* %".212"
  %".215" = call i32 (i8*, ...) @"printf"(i8* %".211", i32 %".214")
  store i32 1, i32* %".4", align 4
  ;  a = 1
  store i32 0, i32* %".7", align 4
  ; b = 0
  store i32 1, i32* %".10", align 4
  ; c = 1
  ; f = a && ! b || c || ! b && ! d
  %".223" = load i32, i32* %".4", align 4
  %".224" = icmp ne i32 %".223", 0
  br i1 %".224", label %".225", label %".231"
.225:
  %".226" = load i32, i32* %".7", align 4
  %".227" = icmp ne i32 %".226", 0
  br i1 %".227", label %".231", label %".228"
.228:
  %".229" = load i32, i32* %".10", align 4
  %".230" = icmp ne i32 %".229", 0
  br i1 %".230", label %".231", label %".239"
.231:
  %".232" = load i32, i32* %".7", align 4
  %".233" = icmp ne i32 %".232", 0
  br i1 %".233", label %".234", label %".239"
.234:
  %".235" = load i32, i32* %".13", align 4
  %".236" = icmp ne i32 %".235", 0
  %".237" = xor i1 %".236", 1
  %".238" = xor i1 %".237", 1
  br label %".239"
.239:
  %".240" = phi  i1 [1, %".228"], [1, %".231"], [%".238", %".234"]
  %".241" = zext i1 %".240" to i32
  store i32 %".241", i32* %".19", align 4
  %".243" = load i32, i32* %".19", align 4
  ; printf "%d" f
  %".245" = bitcast [3 x i8]* @".str.0" to i8*
  %".246" = alloca i32
  store i32 %".243", i32* %".246"
  %".248" = load i32, i32* %".246"
  %".249" = call i32 (i8*, ...) @"printf"(i8* %".245", i32 %".248")
  store i32 0, i32* %".4", align 4
  ;  a = 0
  store i32 1, i32* %".7", align 4
  ; b = 1
  store i32 1, i32* %".10", align 4
  ; c = 1
  ; f = a && ! b || c || ! b && ! d
  %".257" = load i32, i32* %".4", align 4
  %".258" = icmp ne i32 %".257", 0
  br i1 %".258", label %".259", label %".265"
.259:
  %".260" = load i32, i32* %".7", align 4
  %".261" = icmp ne i32 %".260", 0
  br i1 %".261", label %".265", label %".262"
.262:
  %".263" = load i32, i32* %".10", align 4
  %".264" = icmp ne i32 %".263", 0
  br i1 %".264", label %".265", label %".273"
.265:
  %".266" = load i32, i32* %".7", align 4
  %".267" = icmp ne i32 %".266", 0
  br i1 %".267", label %".268", label %".273"
.268:
  %".269" = load i32, i32* %".13", align 4
  %".270" = icmp ne i32 %".269", 0
  %".271" = xor i1 %".270", 1
  %".272" = xor i1 %".271", 1
  br label %".273"
.273:
  %".274" = phi  i1 [1, %".262"], [1, %".265"], [%".272", %".268"]
  %".275" = zext i1 %".274" to i32
  store i32 %".275", i32* %".19", align 4
  %".277" = load i32, i32* %".19", align 4
  ; printf "%d" f
  %".279" = bitcast [3 x i8]* @".str.0" to i8*
  %".280" = alloca i32
  store i32 %".277", i32* %".280"
  %".282" = load i32, i32* %".280"
  %".283" = call i32 (i8*, ...) @"printf"(i8* %".279", i32 %".282")
  store i32 1, i32* %".4", align 4
  ;  a = 1
  store i32 1, i32* %".7", align 4
  ; b = 1
  store i32 1, i32* %".10", align 4
  ; c = 1
  ; f = a && ! b || c || ! b && ! d
  %".291" = load i32, i32* %".4", align 4
  %".292" = icmp ne i32 %".291", 0
  br i1 %".292", label %".293", label %".299"
.293:
  %".294" = load i32, i32* %".7", align 4
  %".295" = icmp ne i32 %".294", 0
  br i1 %".295", label %".299", label %".296"
.296:
  %".297" = load i32, i32* %".10", align 4
  %".298" = icmp ne i32 %".297", 0
  br i1 %".298", label %".299", label %".307"
.299:
  %".300" = load i32, i32* %".7", align 4
  %".301" = icmp ne i32 %".300", 0
  br i1 %".301", label %".302", label %".307"
.302:
  %".303" = load i32, i32* %".13", align 4
  %".304" = icmp ne i32 %".303", 0
  %".305" = xor i1 %".304", 1
  %".306" = xor i1 %".305", 1
  br label %".307"
.307:
  %".308" = phi  i1 [1, %".296"], [1, %".299"], [%".306", %".302"]
  %".309" = zext i1 %".308" to i32
  store i32 %".309", i32* %".19", align 4
  %".311" = load i32, i32* %".19", align 4
  ; printf "%d" f
  %".313" = bitcast [3 x i8]* @".str.0" to i8*
  %".314" = alloca i32
  store i32 %".311", i32* %".314"
  %".316" = load i32, i32* %".314"
  %".317" = call i32 (i8*, ...) @"printf"(i8* %".313", i32 %".316")
  ret i32 0
  ;    return 0
}

@".str.0" = internal constant [3 x i8] c"%d\00"
declare i32 @"printf"(i8* %".1", ...)

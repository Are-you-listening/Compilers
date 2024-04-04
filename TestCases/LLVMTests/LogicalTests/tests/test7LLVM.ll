; ModuleID = "tests/test7.c"
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
  ; f = a && b || c || d && c && e
  %".33" = icmp ne i32 %".31", 0
  br i1 %".33", label %".34", label %".40"
.34:
  %".35" = load i32, i32* %".6", align 4
  %".36" = icmp ne i32 %".35", 0
  br i1 %".36", label %".49", label %".37"
.37:
  %".38" = load i32, i32* %".9", align 4
  %".39" = icmp ne i32 %".38", 0
  br i1 %".39", label %".49", label %".40"
.40:
  %".41" = load i32, i32* %".12", align 4
  %".42" = icmp ne i32 %".41", 0
  br i1 %".42", label %".43", label %".49"
.43:
  %".44" = load i32, i32* %".9", align 4
  %".45" = icmp ne i32 %".44", 0
  br i1 %".45", label %".46", label %".49"
.46:
  %".47" = load i32, i32* %".15", align 4
  %".48" = icmp ne i32 %".47", 0
  br label %".49"
.49:
  %".50" = phi  i1 [0, %".40"], [1, %".34"], [1, %".37"], [%".48", %".46"], [0, %".43"]
  %".51" = zext i1 %".50" to i32
  store i32 %".51", i32* %".18", align 4
  %".53" = load i32, i32* %".18", align 4
  ; printf "%d" , f
  %".55" = bitcast [3 x i8]* @".str.d" to i8*
  %".56" = alloca i32
  store i32 %".53", i32* %".56"
  %".58" = load i32, i32* %".56"
  %".59" = call i32 (i8*, ...) @"printf"(i8* %".55", i32 %".58")
  store i32 1, i32* %".3", align 4
  ; a = 1
  %".62" = load i32, i32* %".3", align 4
  ; f = a && b || c || d && c && e
  %".64" = icmp ne i32 %".62", 0
  br i1 %".64", label %".65", label %".71"
.65:
  %".66" = load i32, i32* %".6", align 4
  %".67" = icmp ne i32 %".66", 0
  br i1 %".67", label %".80", label %".68"
.68:
  %".69" = load i32, i32* %".9", align 4
  %".70" = icmp ne i32 %".69", 0
  br i1 %".70", label %".80", label %".71"
.71:
  %".72" = load i32, i32* %".12", align 4
  %".73" = icmp ne i32 %".72", 0
  br i1 %".73", label %".74", label %".80"
.74:
  %".75" = load i32, i32* %".9", align 4
  %".76" = icmp ne i32 %".75", 0
  br i1 %".76", label %".77", label %".80"
.77:
  %".78" = load i32, i32* %".15", align 4
  %".79" = icmp ne i32 %".78", 0
  br label %".80"
.80:
  %".81" = phi  i1 [1, %".65"], [%".79", %".77"], [1, %".68"], [0, %".74"], [0, %".71"]
  %".82" = zext i1 %".81" to i32
  store i32 %".82", i32* %".18", align 4
  %".84" = load i32, i32* %".18", align 4
  ; printf "%d" , f
  %".86" = bitcast [3 x i8]* @".str.d" to i8*
  %".87" = alloca i32
  store i32 %".84", i32* %".87"
  %".89" = load i32, i32* %".87"
  %".90" = call i32 (i8*, ...) @"printf"(i8* %".86", i32 %".89")
  store i32 1, i32* %".6", align 4
  ; b = 1
  %".93" = load i32, i32* %".3", align 4
  ; f = a && b || c || d && c && e
  %".95" = icmp ne i32 %".93", 0
  br i1 %".95", label %".96", label %".102"
.96:
  %".97" = load i32, i32* %".6", align 4
  %".98" = icmp ne i32 %".97", 0
  br i1 %".98", label %".111", label %".99"
.99:
  %".100" = load i32, i32* %".9", align 4
  %".101" = icmp ne i32 %".100", 0
  br i1 %".101", label %".111", label %".102"
.102:
  %".103" = load i32, i32* %".12", align 4
  %".104" = icmp ne i32 %".103", 0
  br i1 %".104", label %".105", label %".111"
.105:
  %".106" = load i32, i32* %".9", align 4
  %".107" = icmp ne i32 %".106", 0
  br i1 %".107", label %".108", label %".111"
.108:
  %".109" = load i32, i32* %".15", align 4
  %".110" = icmp ne i32 %".109", 0
  br label %".111"
.111:
  %".112" = phi  i1 [1, %".99"], [%".110", %".108"], [0, %".102"], [1, %".96"], [0, %".105"]
  %".113" = zext i1 %".112" to i32
  store i32 %".113", i32* %".18", align 4
  %".115" = load i32, i32* %".18", align 4
  ; printf "%d" , f
  %".117" = bitcast [3 x i8]* @".str.d" to i8*
  %".118" = alloca i32
  store i32 %".115", i32* %".118"
  %".120" = load i32, i32* %".118"
  %".121" = call i32 (i8*, ...) @"printf"(i8* %".117", i32 %".120")
  store i32 1, i32* %".9", align 4
  ; c = 1
  %".124" = load i32, i32* %".3", align 4
  ; f = a && b || c || d && c && e
  %".126" = icmp ne i32 %".124", 0
  br i1 %".126", label %".127", label %".133"
.127:
  %".128" = load i32, i32* %".6", align 4
  %".129" = icmp ne i32 %".128", 0
  br i1 %".129", label %".142", label %".130"
.130:
  %".131" = load i32, i32* %".9", align 4
  %".132" = icmp ne i32 %".131", 0
  br i1 %".132", label %".142", label %".133"
.133:
  %".134" = load i32, i32* %".12", align 4
  %".135" = icmp ne i32 %".134", 0
  br i1 %".135", label %".136", label %".142"
.136:
  %".137" = load i32, i32* %".9", align 4
  %".138" = icmp ne i32 %".137", 0
  br i1 %".138", label %".139", label %".142"
.139:
  %".140" = load i32, i32* %".15", align 4
  %".141" = icmp ne i32 %".140", 0
  br label %".142"
.142:
  %".143" = phi  i1 [1, %".127"], [0, %".133"], [0, %".136"], [1, %".130"], [%".141", %".139"]
  %".144" = zext i1 %".143" to i32
  store i32 %".144", i32* %".18", align 4
  %".146" = load i32, i32* %".18", align 4
  ; printf "%d" , f
  %".148" = bitcast [3 x i8]* @".str.d" to i8*
  %".149" = alloca i32
  store i32 %".146", i32* %".149"
  %".151" = load i32, i32* %".149"
  %".152" = call i32 (i8*, ...) @"printf"(i8* %".148", i32 %".151")
  store i32 1, i32* %".12", align 4
  ; d = 1
  %".155" = load i32, i32* %".3", align 4
  ; f = a && b || c || d && c && e
  %".157" = icmp ne i32 %".155", 0
  br i1 %".157", label %".158", label %".164"
.158:
  %".159" = load i32, i32* %".6", align 4
  %".160" = icmp ne i32 %".159", 0
  br i1 %".160", label %".173", label %".161"
.161:
  %".162" = load i32, i32* %".9", align 4
  %".163" = icmp ne i32 %".162", 0
  br i1 %".163", label %".173", label %".164"
.164:
  %".165" = load i32, i32* %".12", align 4
  %".166" = icmp ne i32 %".165", 0
  br i1 %".166", label %".167", label %".173"
.167:
  %".168" = load i32, i32* %".9", align 4
  %".169" = icmp ne i32 %".168", 0
  br i1 %".169", label %".170", label %".173"
.170:
  %".171" = load i32, i32* %".15", align 4
  %".172" = icmp ne i32 %".171", 0
  br label %".173"
.173:
  %".174" = phi  i1 [%".172", %".170"], [0, %".167"], [1, %".161"], [0, %".164"], [1, %".158"]
  %".175" = zext i1 %".174" to i32
  store i32 %".175", i32* %".18", align 4
  %".177" = load i32, i32* %".18", align 4
  ; printf "%d" , f
  %".179" = bitcast [3 x i8]* @".str.d" to i8*
  %".180" = alloca i32
  store i32 %".177", i32* %".180"
  %".182" = load i32, i32* %".180"
  %".183" = call i32 (i8*, ...) @"printf"(i8* %".179", i32 %".182")
  store i32 1, i32* %".15", align 4
  ; e = 1
  %".186" = load i32, i32* %".3", align 4
  ; f = a && b || c || d && c && e
  %".188" = icmp ne i32 %".186", 0
  br i1 %".188", label %".189", label %".195"
.189:
  %".190" = load i32, i32* %".6", align 4
  %".191" = icmp ne i32 %".190", 0
  br i1 %".191", label %".204", label %".192"
.192:
  %".193" = load i32, i32* %".9", align 4
  %".194" = icmp ne i32 %".193", 0
  br i1 %".194", label %".204", label %".195"
.195:
  %".196" = load i32, i32* %".12", align 4
  %".197" = icmp ne i32 %".196", 0
  br i1 %".197", label %".198", label %".204"
.198:
  %".199" = load i32, i32* %".9", align 4
  %".200" = icmp ne i32 %".199", 0
  br i1 %".200", label %".201", label %".204"
.201:
  %".202" = load i32, i32* %".15", align 4
  %".203" = icmp ne i32 %".202", 0
  br label %".204"
.204:
  %".205" = phi  i1 [0, %".195"], [1, %".189"], [%".203", %".201"], [0, %".198"], [1, %".192"]
  %".206" = zext i1 %".205" to i32
  store i32 %".206", i32* %".18", align 4
  %".208" = load i32, i32* %".18", align 4
  ; printf "%d" , f
  %".210" = bitcast [3 x i8]* @".str.d" to i8*
  %".211" = alloca i32
  store i32 %".208", i32* %".211"
  %".213" = load i32, i32* %".211"
  %".214" = call i32 (i8*, ...) @"printf"(i8* %".210", i32 %".213")
  store i32 0, i32* %".6", align 4
  ; b = 0
  %".217" = load i32, i32* %".3", align 4
  ; f = a && b || c || d && c && e
  %".219" = icmp ne i32 %".217", 0
  br i1 %".219", label %".220", label %".226"
.220:
  %".221" = load i32, i32* %".6", align 4
  %".222" = icmp ne i32 %".221", 0
  br i1 %".222", label %".235", label %".223"
.223:
  %".224" = load i32, i32* %".9", align 4
  %".225" = icmp ne i32 %".224", 0
  br i1 %".225", label %".235", label %".226"
.226:
  %".227" = load i32, i32* %".12", align 4
  %".228" = icmp ne i32 %".227", 0
  br i1 %".228", label %".229", label %".235"
.229:
  %".230" = load i32, i32* %".9", align 4
  %".231" = icmp ne i32 %".230", 0
  br i1 %".231", label %".232", label %".235"
.232:
  %".233" = load i32, i32* %".15", align 4
  %".234" = icmp ne i32 %".233", 0
  br label %".235"
.235:
  %".236" = phi  i1 [0, %".229"], [1, %".220"], [0, %".226"], [%".234", %".232"], [1, %".223"]
  %".237" = zext i1 %".236" to i32
  store i32 %".237", i32* %".18", align 4
  %".239" = load i32, i32* %".18", align 4
  ; printf "%d" , f
  %".241" = bitcast [3 x i8]* @".str.d" to i8*
  %".242" = alloca i32
  store i32 %".239", i32* %".242"
  %".244" = load i32, i32* %".242"
  %".245" = call i32 (i8*, ...) @"printf"(i8* %".241", i32 %".244")
  store i32 0, i32* %".9", align 4
  ; c = 0
  %".248" = load i32, i32* %".3", align 4
  ; f = a && b || c || d && c && e
  %".250" = icmp ne i32 %".248", 0
  br i1 %".250", label %".251", label %".257"
.251:
  %".252" = load i32, i32* %".6", align 4
  %".253" = icmp ne i32 %".252", 0
  br i1 %".253", label %".266", label %".254"
.254:
  %".255" = load i32, i32* %".9", align 4
  %".256" = icmp ne i32 %".255", 0
  br i1 %".256", label %".266", label %".257"
.257:
  %".258" = load i32, i32* %".12", align 4
  %".259" = icmp ne i32 %".258", 0
  br i1 %".259", label %".260", label %".266"
.260:
  %".261" = load i32, i32* %".9", align 4
  %".262" = icmp ne i32 %".261", 0
  br i1 %".262", label %".263", label %".266"
.263:
  %".264" = load i32, i32* %".15", align 4
  %".265" = icmp ne i32 %".264", 0
  br label %".266"
.266:
  %".267" = phi  i1 [1, %".251"], [0, %".260"], [0, %".257"], [%".265", %".263"], [1, %".254"]
  %".268" = zext i1 %".267" to i32
  store i32 %".268", i32* %".18", align 4
  %".270" = load i32, i32* %".18", align 4
  ; printf "%d" , f
  %".272" = bitcast [3 x i8]* @".str.d" to i8*
  %".273" = alloca i32
  store i32 %".270", i32* %".273"
  %".275" = load i32, i32* %".273"
  %".276" = call i32 (i8*, ...) @"printf"(i8* %".272", i32 %".275")
  store i32 0, i32* %".12", align 4
  ; d = 0
  %".279" = load i32, i32* %".3", align 4
  ; f = a && b || c || d && c && e
  %".281" = icmp ne i32 %".279", 0
  br i1 %".281", label %".282", label %".288"
.282:
  %".283" = load i32, i32* %".6", align 4
  %".284" = icmp ne i32 %".283", 0
  br i1 %".284", label %".297", label %".285"
.285:
  %".286" = load i32, i32* %".9", align 4
  %".287" = icmp ne i32 %".286", 0
  br i1 %".287", label %".297", label %".288"
.288:
  %".289" = load i32, i32* %".12", align 4
  %".290" = icmp ne i32 %".289", 0
  br i1 %".290", label %".291", label %".297"
.291:
  %".292" = load i32, i32* %".9", align 4
  %".293" = icmp ne i32 %".292", 0
  br i1 %".293", label %".294", label %".297"
.294:
  %".295" = load i32, i32* %".15", align 4
  %".296" = icmp ne i32 %".295", 0
  br label %".297"
.297:
  %".298" = phi  i1 [1, %".285"], [1, %".282"], [0, %".291"], [%".296", %".294"], [0, %".288"]
  %".299" = zext i1 %".298" to i32
  store i32 %".299", i32* %".18", align 4
  %".301" = load i32, i32* %".18", align 4
  ; printf "%d" , f
  %".303" = bitcast [3 x i8]* @".str.d" to i8*
  %".304" = alloca i32
  store i32 %".301", i32* %".304"
  %".306" = load i32, i32* %".304"
  %".307" = call i32 (i8*, ...) @"printf"(i8* %".303", i32 %".306")
  ret i32 0
  ; INT main
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"
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
  %".56" = phi  i1 [1, %".34"], [0, %".43"], [%".48", %".46"], [0, %".40"], [1, %".37"]
  %".57" = zext i1 %".56" to i32
  store i32 %".57", i32* %".18", align 4
  %".59" = load i32, i32* %".18", align 4
  ; printf " %d " , f
  %".61" = bitcast [3 x i8]* @".str.d" to i8*
  %".62" = alloca i32
  store i32 %".59", i32* %".62"
  %".64" = load i32, i32* %".62"
  %".65" = call i32 (i8*, ...) @"printf"(i8* %".61", i32 %".64")
  store i32 1, i32* %".3", align 4
  ; a = 1
  %".68" = load i32, i32* %".3", align 4
  ; f = a && b || c || d && c && e
  %".70" = icmp ne i32 %".68", 0
  br i1 %".70", label %".71", label %".77"
.71:
  %".72" = load i32, i32* %".6", align 4
  %".73" = icmp ne i32 %".72", 0
  br i1 %".73", label %".86", label %".74"
.74:
  %".75" = load i32, i32* %".9", align 4
  %".76" = icmp ne i32 %".75", 0
  br i1 %".76", label %".86", label %".77"
.77:
  %".78" = load i32, i32* %".12", align 4
  %".79" = icmp ne i32 %".78", 0
  br i1 %".79", label %".80", label %".86"
.80:
  %".81" = load i32, i32* %".9", align 4
  %".82" = icmp ne i32 %".81", 0
  br i1 %".82", label %".83", label %".86"
.83:
  %".84" = load i32, i32* %".15", align 4
  %".85" = icmp ne i32 %".84", 0
  br label %".86"
.86:
  %".93" = phi  i1 [1, %".74"], [0, %".80"], [1, %".71"], [%".85", %".83"], [0, %".77"]
  %".94" = zext i1 %".93" to i32
  store i32 %".94", i32* %".18", align 4
  %".96" = load i32, i32* %".18", align 4
  ; printf " %d " , f
  %".98" = bitcast [3 x i8]* @".str.d" to i8*
  %".99" = alloca i32
  store i32 %".96", i32* %".99"
  %".101" = load i32, i32* %".99"
  %".102" = call i32 (i8*, ...) @"printf"(i8* %".98", i32 %".101")
  store i32 1, i32* %".6", align 4
  ; b = 1
  %".105" = load i32, i32* %".3", align 4
  ; f = a && b || c || d && c && e
  %".107" = icmp ne i32 %".105", 0
  br i1 %".107", label %".108", label %".114"
.108:
  %".109" = load i32, i32* %".6", align 4
  %".110" = icmp ne i32 %".109", 0
  br i1 %".110", label %".123", label %".111"
.111:
  %".112" = load i32, i32* %".9", align 4
  %".113" = icmp ne i32 %".112", 0
  br i1 %".113", label %".123", label %".114"
.114:
  %".115" = load i32, i32* %".12", align 4
  %".116" = icmp ne i32 %".115", 0
  br i1 %".116", label %".117", label %".123"
.117:
  %".118" = load i32, i32* %".9", align 4
  %".119" = icmp ne i32 %".118", 0
  br i1 %".119", label %".120", label %".123"
.120:
  %".121" = load i32, i32* %".15", align 4
  %".122" = icmp ne i32 %".121", 0
  br label %".123"
.123:
  %".130" = phi  i1 [0, %".114"], [1, %".111"], [%".122", %".120"], [1, %".108"], [0, %".117"]
  %".131" = zext i1 %".130" to i32
  store i32 %".131", i32* %".18", align 4
  %".133" = load i32, i32* %".18", align 4
  ; printf " %d " , f
  %".135" = bitcast [3 x i8]* @".str.d" to i8*
  %".136" = alloca i32
  store i32 %".133", i32* %".136"
  %".138" = load i32, i32* %".136"
  %".139" = call i32 (i8*, ...) @"printf"(i8* %".135", i32 %".138")
  store i32 1, i32* %".9", align 4
  ; c = 1
  %".142" = load i32, i32* %".3", align 4
  ; f = a && b || c || d && c && e
  %".144" = icmp ne i32 %".142", 0
  br i1 %".144", label %".145", label %".151"
.145:
  %".146" = load i32, i32* %".6", align 4
  %".147" = icmp ne i32 %".146", 0
  br i1 %".147", label %".160", label %".148"
.148:
  %".149" = load i32, i32* %".9", align 4
  %".150" = icmp ne i32 %".149", 0
  br i1 %".150", label %".160", label %".151"
.151:
  %".152" = load i32, i32* %".12", align 4
  %".153" = icmp ne i32 %".152", 0
  br i1 %".153", label %".154", label %".160"
.154:
  %".155" = load i32, i32* %".9", align 4
  %".156" = icmp ne i32 %".155", 0
  br i1 %".156", label %".157", label %".160"
.157:
  %".158" = load i32, i32* %".15", align 4
  %".159" = icmp ne i32 %".158", 0
  br label %".160"
.160:
  %".167" = phi  i1 [%".159", %".157"], [0, %".154"], [1, %".145"], [0, %".151"], [1, %".148"]
  %".168" = zext i1 %".167" to i32
  store i32 %".168", i32* %".18", align 4
  %".170" = load i32, i32* %".18", align 4
  ; printf " %d " , f
  %".172" = bitcast [3 x i8]* @".str.d" to i8*
  %".173" = alloca i32
  store i32 %".170", i32* %".173"
  %".175" = load i32, i32* %".173"
  %".176" = call i32 (i8*, ...) @"printf"(i8* %".172", i32 %".175")
  store i32 1, i32* %".12", align 4
  ; d = 1
  %".179" = load i32, i32* %".3", align 4
  ; f = a && b || c || d && c && e
  %".181" = icmp ne i32 %".179", 0
  br i1 %".181", label %".182", label %".188"
.182:
  %".183" = load i32, i32* %".6", align 4
  %".184" = icmp ne i32 %".183", 0
  br i1 %".184", label %".197", label %".185"
.185:
  %".186" = load i32, i32* %".9", align 4
  %".187" = icmp ne i32 %".186", 0
  br i1 %".187", label %".197", label %".188"
.188:
  %".189" = load i32, i32* %".12", align 4
  %".190" = icmp ne i32 %".189", 0
  br i1 %".190", label %".191", label %".197"
.191:
  %".192" = load i32, i32* %".9", align 4
  %".193" = icmp ne i32 %".192", 0
  br i1 %".193", label %".194", label %".197"
.194:
  %".195" = load i32, i32* %".15", align 4
  %".196" = icmp ne i32 %".195", 0
  br label %".197"
.197:
  %".204" = phi  i1 [1, %".182"], [%".196", %".194"], [0, %".191"], [1, %".185"], [0, %".188"]
  %".205" = zext i1 %".204" to i32
  store i32 %".205", i32* %".18", align 4
  %".207" = load i32, i32* %".18", align 4
  ; printf " %d " , f
  %".209" = bitcast [3 x i8]* @".str.d" to i8*
  %".210" = alloca i32
  store i32 %".207", i32* %".210"
  %".212" = load i32, i32* %".210"
  %".213" = call i32 (i8*, ...) @"printf"(i8* %".209", i32 %".212")
  store i32 1, i32* %".15", align 4
  ; e = 1
  %".216" = load i32, i32* %".3", align 4
  ; f = a && b || c || d && c && e
  %".218" = icmp ne i32 %".216", 0
  br i1 %".218", label %".219", label %".225"
.219:
  %".220" = load i32, i32* %".6", align 4
  %".221" = icmp ne i32 %".220", 0
  br i1 %".221", label %".234", label %".222"
.222:
  %".223" = load i32, i32* %".9", align 4
  %".224" = icmp ne i32 %".223", 0
  br i1 %".224", label %".234", label %".225"
.225:
  %".226" = load i32, i32* %".12", align 4
  %".227" = icmp ne i32 %".226", 0
  br i1 %".227", label %".228", label %".234"
.228:
  %".229" = load i32, i32* %".9", align 4
  %".230" = icmp ne i32 %".229", 0
  br i1 %".230", label %".231", label %".234"
.231:
  %".232" = load i32, i32* %".15", align 4
  %".233" = icmp ne i32 %".232", 0
  br label %".234"
.234:
  %".241" = phi  i1 [0, %".225"], [1, %".219"], [0, %".228"], [%".233", %".231"], [1, %".222"]
  %".242" = zext i1 %".241" to i32
  store i32 %".242", i32* %".18", align 4
  %".244" = load i32, i32* %".18", align 4
  ; printf " %d " , f
  %".246" = bitcast [3 x i8]* @".str.d" to i8*
  %".247" = alloca i32
  store i32 %".244", i32* %".247"
  %".249" = load i32, i32* %".247"
  %".250" = call i32 (i8*, ...) @"printf"(i8* %".246", i32 %".249")
  store i32 0, i32* %".6", align 4
  ; b = 0
  %".253" = load i32, i32* %".3", align 4
  ; f = a && b || c || d && c && e
  %".255" = icmp ne i32 %".253", 0
  br i1 %".255", label %".256", label %".262"
.256:
  %".257" = load i32, i32* %".6", align 4
  %".258" = icmp ne i32 %".257", 0
  br i1 %".258", label %".271", label %".259"
.259:
  %".260" = load i32, i32* %".9", align 4
  %".261" = icmp ne i32 %".260", 0
  br i1 %".261", label %".271", label %".262"
.262:
  %".263" = load i32, i32* %".12", align 4
  %".264" = icmp ne i32 %".263", 0
  br i1 %".264", label %".265", label %".271"
.265:
  %".266" = load i32, i32* %".9", align 4
  %".267" = icmp ne i32 %".266", 0
  br i1 %".267", label %".268", label %".271"
.268:
  %".269" = load i32, i32* %".15", align 4
  %".270" = icmp ne i32 %".269", 0
  br label %".271"
.271:
  %".278" = phi  i1 [1, %".256"], [0, %".265"], [1, %".259"], [%".270", %".268"], [0, %".262"]
  %".279" = zext i1 %".278" to i32
  store i32 %".279", i32* %".18", align 4
  %".281" = load i32, i32* %".18", align 4
  ; printf " %d " , f
  %".283" = bitcast [3 x i8]* @".str.d" to i8*
  %".284" = alloca i32
  store i32 %".281", i32* %".284"
  %".286" = load i32, i32* %".284"
  %".287" = call i32 (i8*, ...) @"printf"(i8* %".283", i32 %".286")
  store i32 0, i32* %".9", align 4
  ; c = 0
  %".290" = load i32, i32* %".3", align 4
  ; f = a && b || c || d && c && e
  %".292" = icmp ne i32 %".290", 0
  br i1 %".292", label %".293", label %".299"
.293:
  %".294" = load i32, i32* %".6", align 4
  %".295" = icmp ne i32 %".294", 0
  br i1 %".295", label %".308", label %".296"
.296:
  %".297" = load i32, i32* %".9", align 4
  %".298" = icmp ne i32 %".297", 0
  br i1 %".298", label %".308", label %".299"
.299:
  %".300" = load i32, i32* %".12", align 4
  %".301" = icmp ne i32 %".300", 0
  br i1 %".301", label %".302", label %".308"
.302:
  %".303" = load i32, i32* %".9", align 4
  %".304" = icmp ne i32 %".303", 0
  br i1 %".304", label %".305", label %".308"
.305:
  %".306" = load i32, i32* %".15", align 4
  %".307" = icmp ne i32 %".306", 0
  br label %".308"
.308:
  %".315" = phi  i1 [0, %".302"], [0, %".299"], [1, %".293"], [%".307", %".305"], [1, %".296"]
  %".316" = zext i1 %".315" to i32
  store i32 %".316", i32* %".18", align 4
  %".318" = load i32, i32* %".18", align 4
  ; printf " %d " , f
  %".320" = bitcast [3 x i8]* @".str.d" to i8*
  %".321" = alloca i32
  store i32 %".318", i32* %".321"
  %".323" = load i32, i32* %".321"
  %".324" = call i32 (i8*, ...) @"printf"(i8* %".320", i32 %".323")
  store i32 0, i32* %".12", align 4
  ; d = 0
  %".327" = load i32, i32* %".3", align 4
  ; f = a && b || c || d && c && e
  %".329" = icmp ne i32 %".327", 0
  br i1 %".329", label %".330", label %".336"
.330:
  %".331" = load i32, i32* %".6", align 4
  %".332" = icmp ne i32 %".331", 0
  br i1 %".332", label %".345", label %".333"
.333:
  %".334" = load i32, i32* %".9", align 4
  %".335" = icmp ne i32 %".334", 0
  br i1 %".335", label %".345", label %".336"
.336:
  %".337" = load i32, i32* %".12", align 4
  %".338" = icmp ne i32 %".337", 0
  br i1 %".338", label %".339", label %".345"
.339:
  %".340" = load i32, i32* %".9", align 4
  %".341" = icmp ne i32 %".340", 0
  br i1 %".341", label %".342", label %".345"
.342:
  %".343" = load i32, i32* %".15", align 4
  %".344" = icmp ne i32 %".343", 0
  br label %".345"
.345:
  %".352" = phi  i1 [1, %".330"], [0, %".336"], [0, %".339"], [%".344", %".342"], [1, %".333"]
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
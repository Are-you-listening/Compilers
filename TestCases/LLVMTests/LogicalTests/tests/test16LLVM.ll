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
  %".47" = phi  i1 [1, %".2"], [0, %".40"], [%".45", %".43"]
  %".48" = icmp ne i1 %".47", 0
  %".49" = xor i1 %".48", 1
  %".50" = zext i1 %".49" to i32
  store i32 %".50", i32* %".18", align 4
  %".52" = load i32, i32* %".18", align 4
  ; printf "%d" , f
  %".54" = bitcast [3 x i8]* @".str.d" to i8*
  %".55" = alloca i32
  store i32 %".52", i32* %".55"
  %".57" = load i32, i32* %".55"
  %".58" = call i32 (i8*, ...) @"printf"(i8* %".54", i32 %".57")
  %".59" = load i32, i32* %".3", align 4
  ; g = a < d && e >= b
  %".61" = load i32, i32* %".12", align 4
  %".62" = icmp slt i32 %".59", %".61"
  br i1 %".62", label %".63", label %".67"
.63:
  %".64" = load i32, i32* %".15", align 4
  %".65" = load i32, i32* %".6", align 4
  %".66" = icmp sge i32 %".64", %".65"
  br label %".67"
.67:
  %".68" = phi  i1 [%".66", %".63"], [0, %".46"]
  %".69" = zext i1 %".68" to i32
  store i32 %".69", i32* %".21", align 4
  %".71" = load i32, i32* %".21", align 4
  ; printf "%d" , g
  %".73" = bitcast [3 x i8]* @".str.d" to i8*
  %".74" = alloca i32
  store i32 %".71", i32* %".74"
  %".76" = load i32, i32* %".74"
  %".77" = call i32 (i8*, ...) @"printf"(i8* %".73", i32 %".76")
  %".78" = load i32, i32* %".3", align 4
  ; h = a - b < d && ! e > g
  %".80" = load i32, i32* %".6", align 4
  %".81" = sub i32 %".78", %".80"
  %".82" = load i32, i32* %".12", align 4
  %".83" = icmp slt i32 %".81", %".82"
  br i1 %".83", label %".84", label %".90"
.84:
  %".85" = load i32, i32* %".15", align 4
  %".86" = load i32, i32* %".21", align 4
  %".87" = icmp sgt i32 %".85", %".86"
  %".88" = icmp ne i1 %".87", 0
  %".89" = xor i1 %".88", 1
  br label %".90"
.90:
  %".91" = phi  i1 [0, %".67"], [%".89", %".84"]
  %".92" = zext i1 %".91" to i32
  store i32 %".92", i32* %".24", align 4
  %".94" = load i32, i32* %".24", align 4
  ; printf "%d" , h
  %".96" = bitcast [3 x i8]* @".str.d" to i8*
  %".97" = alloca i32
  store i32 %".94", i32* %".97"
  %".99" = load i32, i32* %".97"
  %".100" = call i32 (i8*, ...) @"printf"(i8* %".96", i32 %".99")
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
  %".111" = load i32, i32* %".3", align 4
  ; f = ! a || e && d && 5 < 6
  %".113" = icmp ne i32 %".111", 0
  br i1 %".113", label %".120", label %".114"
.114:
  %".115" = load i32, i32* %".15", align 4
  %".116" = icmp ne i32 %".115", 0
  br i1 %".116", label %".117", label %".120"
.117:
  %".118" = load i32, i32* %".12", align 4
  %".119" = icmp ne i32 %".118", 0
  br label %".120"
.120:
  %".121" = phi  i1 [1, %".90"], [0, %".114"], [%".119", %".117"]
  %".122" = icmp ne i1 %".121", 0
  %".123" = xor i1 %".122", 1
  %".124" = zext i1 %".123" to i32
  store i32 %".124", i32* %".18", align 4
  %".126" = load i32, i32* %".18", align 4
  ; printf "%d" , f
  %".128" = bitcast [3 x i8]* @".str.d" to i8*
  %".129" = alloca i32
  store i32 %".126", i32* %".129"
  %".131" = load i32, i32* %".129"
  %".132" = call i32 (i8*, ...) @"printf"(i8* %".128", i32 %".131")
  %".133" = load i32, i32* %".3", align 4
  ; g = a < d && e >= b
  %".135" = load i32, i32* %".12", align 4
  %".136" = icmp slt i32 %".133", %".135"
  br i1 %".136", label %".137", label %".141"
.137:
  %".138" = load i32, i32* %".15", align 4
  %".139" = load i32, i32* %".6", align 4
  %".140" = icmp sge i32 %".138", %".139"
  br label %".141"
.141:
  %".142" = phi  i1 [0, %".120"], [%".140", %".137"]
  %".143" = zext i1 %".142" to i32
  store i32 %".143", i32* %".21", align 4
  %".145" = load i32, i32* %".21", align 4
  ; printf "%d" , g
  %".147" = bitcast [3 x i8]* @".str.d" to i8*
  %".148" = alloca i32
  store i32 %".145", i32* %".148"
  %".150" = load i32, i32* %".148"
  %".151" = call i32 (i8*, ...) @"printf"(i8* %".147", i32 %".150")
  %".152" = load i32, i32* %".3", align 4
  ; h = a - b < d && ! e > g
  %".154" = load i32, i32* %".6", align 4
  %".155" = sub i32 %".152", %".154"
  %".156" = load i32, i32* %".12", align 4
  %".157" = icmp slt i32 %".155", %".156"
  br i1 %".157", label %".158", label %".164"
.158:
  %".159" = load i32, i32* %".15", align 4
  %".160" = load i32, i32* %".21", align 4
  %".161" = icmp sgt i32 %".159", %".160"
  %".162" = icmp ne i1 %".161", 0
  %".163" = xor i1 %".162", 1
  br label %".164"
.164:
  %".165" = phi  i1 [%".163", %".158"], [0, %".141"]
  %".166" = zext i1 %".165" to i32
  store i32 %".166", i32* %".24", align 4
  %".168" = load i32, i32* %".24", align 4
  ; printf "%d" , h
  %".170" = bitcast [3 x i8]* @".str.d" to i8*
  %".171" = alloca i32
  store i32 %".168", i32* %".171"
  %".173" = load i32, i32* %".171"
  %".174" = call i32 (i8*, ...) @"printf"(i8* %".170", i32 %".173")
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
  %".185" = load i32, i32* %".3", align 4
  ; f = ! a || e && d && 5 < 6
  %".187" = icmp ne i32 %".185", 0
  br i1 %".187", label %".194", label %".188"
.188:
  %".189" = load i32, i32* %".15", align 4
  %".190" = icmp ne i32 %".189", 0
  br i1 %".190", label %".191", label %".194"
.191:
  %".192" = load i32, i32* %".12", align 4
  %".193" = icmp ne i32 %".192", 0
  br label %".194"
.194:
  %".195" = phi  i1 [%".193", %".191"], [0, %".188"], [1, %".164"]
  %".196" = icmp ne i1 %".195", 0
  %".197" = xor i1 %".196", 1
  %".198" = zext i1 %".197" to i32
  store i32 %".198", i32* %".18", align 4
  %".200" = load i32, i32* %".18", align 4
  ; printf "%d" , f
  %".202" = bitcast [3 x i8]* @".str.d" to i8*
  %".203" = alloca i32
  store i32 %".200", i32* %".203"
  %".205" = load i32, i32* %".203"
  %".206" = call i32 (i8*, ...) @"printf"(i8* %".202", i32 %".205")
  %".207" = load i32, i32* %".3", align 4
  ; g = a < d && e >= b
  %".209" = load i32, i32* %".12", align 4
  %".210" = icmp slt i32 %".207", %".209"
  br i1 %".210", label %".211", label %".215"
.211:
  %".212" = load i32, i32* %".15", align 4
  %".213" = load i32, i32* %".6", align 4
  %".214" = icmp sge i32 %".212", %".213"
  br label %".215"
.215:
  %".216" = phi  i1 [0, %".194"], [%".214", %".211"]
  %".217" = zext i1 %".216" to i32
  store i32 %".217", i32* %".21", align 4
  %".219" = load i32, i32* %".21", align 4
  ; printf "%d" , g
  %".221" = bitcast [3 x i8]* @".str.d" to i8*
  %".222" = alloca i32
  store i32 %".219", i32* %".222"
  %".224" = load i32, i32* %".222"
  %".225" = call i32 (i8*, ...) @"printf"(i8* %".221", i32 %".224")
  %".226" = load i32, i32* %".3", align 4
  ; h = a - b < d && ! e > g
  %".228" = load i32, i32* %".6", align 4
  %".229" = sub i32 %".226", %".228"
  %".230" = load i32, i32* %".12", align 4
  %".231" = icmp slt i32 %".229", %".230"
  br i1 %".231", label %".232", label %".238"
.232:
  %".233" = load i32, i32* %".15", align 4
  %".234" = load i32, i32* %".21", align 4
  %".235" = icmp sgt i32 %".233", %".234"
  %".236" = icmp ne i1 %".235", 0
  %".237" = xor i1 %".236", 1
  br label %".238"
.238:
  %".239" = phi  i1 [0, %".215"], [%".237", %".232"]
  %".240" = zext i1 %".239" to i32
  store i32 %".240", i32* %".24", align 4
  %".242" = load i32, i32* %".24", align 4
  ; printf "%d" , h
  %".244" = bitcast [3 x i8]* @".str.d" to i8*
  %".245" = alloca i32
  store i32 %".242", i32* %".245"
  %".247" = load i32, i32* %".245"
  %".248" = call i32 (i8*, ...) @"printf"(i8* %".244", i32 %".247")
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
  %".259" = load i32, i32* %".3", align 4
  ; f = ! a || e && d && 5 < 6
  %".261" = icmp ne i32 %".259", 0
  br i1 %".261", label %".268", label %".262"
.262:
  %".263" = load i32, i32* %".15", align 4
  %".264" = icmp ne i32 %".263", 0
  br i1 %".264", label %".265", label %".268"
.265:
  %".266" = load i32, i32* %".12", align 4
  %".267" = icmp ne i32 %".266", 0
  br label %".268"
.268:
  %".269" = phi  i1 [1, %".238"], [0, %".262"], [%".267", %".265"]
  %".270" = icmp ne i1 %".269", 0
  %".271" = xor i1 %".270", 1
  %".272" = zext i1 %".271" to i32
  store i32 %".272", i32* %".18", align 4
  %".274" = load i32, i32* %".18", align 4
  ; printf "%d" , f
  %".276" = bitcast [3 x i8]* @".str.d" to i8*
  %".277" = alloca i32
  store i32 %".274", i32* %".277"
  %".279" = load i32, i32* %".277"
  %".280" = call i32 (i8*, ...) @"printf"(i8* %".276", i32 %".279")
  %".281" = load i32, i32* %".3", align 4
  ; g = a < d && e >= b
  %".283" = load i32, i32* %".12", align 4
  %".284" = icmp slt i32 %".281", %".283"
  br i1 %".284", label %".285", label %".289"
.285:
  %".286" = load i32, i32* %".15", align 4
  %".287" = load i32, i32* %".6", align 4
  %".288" = icmp sge i32 %".286", %".287"
  br label %".289"
.289:
  %".290" = phi  i1 [0, %".268"], [%".288", %".285"]
  %".291" = zext i1 %".290" to i32
  store i32 %".291", i32* %".21", align 4
  %".293" = load i32, i32* %".21", align 4
  ; printf "%d" , g
  %".295" = bitcast [3 x i8]* @".str.d" to i8*
  %".296" = alloca i32
  store i32 %".293", i32* %".296"
  %".298" = load i32, i32* %".296"
  %".299" = call i32 (i8*, ...) @"printf"(i8* %".295", i32 %".298")
  %".300" = load i32, i32* %".3", align 4
  ; h = a - b < d && ! e > g
  %".302" = load i32, i32* %".6", align 4
  %".303" = sub i32 %".300", %".302"
  %".304" = load i32, i32* %".12", align 4
  %".305" = icmp slt i32 %".303", %".304"
  br i1 %".305", label %".306", label %".312"
.306:
  %".307" = load i32, i32* %".15", align 4
  %".308" = load i32, i32* %".21", align 4
  %".309" = icmp sgt i32 %".307", %".308"
  %".310" = icmp ne i1 %".309", 0
  %".311" = xor i1 %".310", 1
  br label %".312"
.312:
  %".313" = phi  i1 [0, %".289"], [%".311", %".306"]
  %".314" = zext i1 %".313" to i32
  store i32 %".314", i32* %".24", align 4
  %".316" = load i32, i32* %".24", align 4
  ; printf "%d" , h
  %".318" = bitcast [3 x i8]* @".str.d" to i8*
  %".319" = alloca i32
  store i32 %".316", i32* %".319"
  %".321" = load i32, i32* %".319"
  %".322" = call i32 (i8*, ...) @"printf"(i8* %".318", i32 %".321")
  ret i32 0
  ; INT main
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"
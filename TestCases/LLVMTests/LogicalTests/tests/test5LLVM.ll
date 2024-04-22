; ModuleID = "tests/test5.c"
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
  ;  f = a && b || c || d && c && e
  %".33" = load i32, i32* %".4", align 4
  %".34" = icmp ne i32 %".33", 0
  br i1 %".34", label %".35", label %".41"
.35:
  %".36" = load i32, i32* %".7", align 4
  %".37" = icmp ne i32 %".36", 0
  br i1 %".37", label %".50", label %".38"
.38:
  %".39" = load i32, i32* %".10", align 4
  %".40" = icmp ne i32 %".39", 0
  br i1 %".40", label %".50", label %".41"
.41:
  %".42" = load i32, i32* %".13", align 4
  %".43" = icmp ne i32 %".42", 0
  br i1 %".43", label %".44", label %".50"
.44:
  %".45" = load i32, i32* %".10", align 4
  %".46" = icmp ne i32 %".45", 0
  br i1 %".46", label %".47", label %".50"
.47:
  %".48" = load i32, i32* %".16", align 4
  %".49" = icmp ne i32 %".48", 0
  br label %".50"
.50:
  %".51" = phi  i1 [1, %".35"], [1, %".38"], [0, %".41"], [0, %".44"], [%".49", %".47"]
  %".52" = zext i1 %".51" to i32
  store i32 %".52", i32* %".19", align 4
  %".54" = load i32, i32* %".19", align 4
  ; printf "%d" f
  %".56" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".57" = alloca i32
  store i32 %".54", i32* %".57"
  %".59" = load i32, i32* %".57"
  %".60" = call i32 (i8*, ...) @"printf"(i8* %".56", i32 %".59")
  store i32 1, i32* %".4", align 4
  ;  a = 1
  ;  f = a && b || c || d && c && e
  %".64" = load i32, i32* %".4", align 4
  %".65" = icmp ne i32 %".64", 0
  br i1 %".65", label %".66", label %".72"
.66:
  %".67" = load i32, i32* %".7", align 4
  %".68" = icmp ne i32 %".67", 0
  br i1 %".68", label %".81", label %".69"
.69:
  %".70" = load i32, i32* %".10", align 4
  %".71" = icmp ne i32 %".70", 0
  br i1 %".71", label %".81", label %".72"
.72:
  %".73" = load i32, i32* %".13", align 4
  %".74" = icmp ne i32 %".73", 0
  br i1 %".74", label %".75", label %".81"
.75:
  %".76" = load i32, i32* %".10", align 4
  %".77" = icmp ne i32 %".76", 0
  br i1 %".77", label %".78", label %".81"
.78:
  %".79" = load i32, i32* %".16", align 4
  %".80" = icmp ne i32 %".79", 0
  br label %".81"
.81:
  %".82" = phi  i1 [1, %".66"], [1, %".69"], [0, %".72"], [0, %".75"], [%".80", %".78"]
  %".83" = zext i1 %".82" to i32
  store i32 %".83", i32* %".19", align 4
  %".85" = load i32, i32* %".19", align 4
  ; printf "%d" f
  %".87" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".88" = alloca i32
  store i32 %".85", i32* %".88"
  %".90" = load i32, i32* %".88"
  %".91" = call i32 (i8*, ...) @"printf"(i8* %".87", i32 %".90")
  store i32 1, i32* %".7", align 4
  ;  b = 1
  ;  f = a && b || c || d && c && e
  %".95" = load i32, i32* %".4", align 4
  %".96" = icmp ne i32 %".95", 0
  br i1 %".96", label %".97", label %".103"
.97:
  %".98" = load i32, i32* %".7", align 4
  %".99" = icmp ne i32 %".98", 0
  br i1 %".99", label %".112", label %".100"
.100:
  %".101" = load i32, i32* %".10", align 4
  %".102" = icmp ne i32 %".101", 0
  br i1 %".102", label %".112", label %".103"
.103:
  %".104" = load i32, i32* %".13", align 4
  %".105" = icmp ne i32 %".104", 0
  br i1 %".105", label %".106", label %".112"
.106:
  %".107" = load i32, i32* %".10", align 4
  %".108" = icmp ne i32 %".107", 0
  br i1 %".108", label %".109", label %".112"
.109:
  %".110" = load i32, i32* %".16", align 4
  %".111" = icmp ne i32 %".110", 0
  br label %".112"
.112:
  %".113" = phi  i1 [1, %".100"], [0, %".103"], [0, %".106"], [%".111", %".109"], [1, %".97"]
  %".114" = zext i1 %".113" to i32
  store i32 %".114", i32* %".19", align 4
  %".116" = load i32, i32* %".19", align 4
  ; printf "%d" f
  %".118" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".119" = alloca i32
  store i32 %".116", i32* %".119"
  %".121" = load i32, i32* %".119"
  %".122" = call i32 (i8*, ...) @"printf"(i8* %".118", i32 %".121")
  store i32 1, i32* %".10", align 4
  ;  c = 1
  ;  f = a && b || c || d && c && e
  %".126" = load i32, i32* %".4", align 4
  %".127" = icmp ne i32 %".126", 0
  br i1 %".127", label %".128", label %".134"
.128:
  %".129" = load i32, i32* %".7", align 4
  %".130" = icmp ne i32 %".129", 0
  br i1 %".130", label %".143", label %".131"
.131:
  %".132" = load i32, i32* %".10", align 4
  %".133" = icmp ne i32 %".132", 0
  br i1 %".133", label %".143", label %".134"
.134:
  %".135" = load i32, i32* %".13", align 4
  %".136" = icmp ne i32 %".135", 0
  br i1 %".136", label %".137", label %".143"
.137:
  %".138" = load i32, i32* %".10", align 4
  %".139" = icmp ne i32 %".138", 0
  br i1 %".139", label %".140", label %".143"
.140:
  %".141" = load i32, i32* %".16", align 4
  %".142" = icmp ne i32 %".141", 0
  br label %".143"
.143:
  %".144" = phi  i1 [1, %".128"], [1, %".131"], [0, %".134"], [0, %".137"], [%".142", %".140"]
  %".145" = zext i1 %".144" to i32
  store i32 %".145", i32* %".19", align 4
  %".147" = load i32, i32* %".19", align 4
  ; printf "%d" f
  %".149" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".150" = alloca i32
  store i32 %".147", i32* %".150"
  %".152" = load i32, i32* %".150"
  %".153" = call i32 (i8*, ...) @"printf"(i8* %".149", i32 %".152")
  store i32 1, i32* %".13", align 4
  ;  d = 1
  ;  f = a && b || c || d && c && e
  %".157" = load i32, i32* %".4", align 4
  %".158" = icmp ne i32 %".157", 0
  br i1 %".158", label %".159", label %".165"
.159:
  %".160" = load i32, i32* %".7", align 4
  %".161" = icmp ne i32 %".160", 0
  br i1 %".161", label %".174", label %".162"
.162:
  %".163" = load i32, i32* %".10", align 4
  %".164" = icmp ne i32 %".163", 0
  br i1 %".164", label %".174", label %".165"
.165:
  %".166" = load i32, i32* %".13", align 4
  %".167" = icmp ne i32 %".166", 0
  br i1 %".167", label %".168", label %".174"
.168:
  %".169" = load i32, i32* %".10", align 4
  %".170" = icmp ne i32 %".169", 0
  br i1 %".170", label %".171", label %".174"
.171:
  %".172" = load i32, i32* %".16", align 4
  %".173" = icmp ne i32 %".172", 0
  br label %".174"
.174:
  %".175" = phi  i1 [1, %".159"], [1, %".162"], [0, %".165"], [0, %".168"], [%".173", %".171"]
  %".176" = zext i1 %".175" to i32
  store i32 %".176", i32* %".19", align 4
  %".178" = load i32, i32* %".19", align 4
  ; printf "%d" f
  %".180" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".181" = alloca i32
  store i32 %".178", i32* %".181"
  %".183" = load i32, i32* %".181"
  %".184" = call i32 (i8*, ...) @"printf"(i8* %".180", i32 %".183")
  store i32 1, i32* %".16", align 4
  ;  e = 1
  ;  f = a && b || c || d && c && e
  %".188" = load i32, i32* %".4", align 4
  %".189" = icmp ne i32 %".188", 0
  br i1 %".189", label %".190", label %".196"
.190:
  %".191" = load i32, i32* %".7", align 4
  %".192" = icmp ne i32 %".191", 0
  br i1 %".192", label %".205", label %".193"
.193:
  %".194" = load i32, i32* %".10", align 4
  %".195" = icmp ne i32 %".194", 0
  br i1 %".195", label %".205", label %".196"
.196:
  %".197" = load i32, i32* %".13", align 4
  %".198" = icmp ne i32 %".197", 0
  br i1 %".198", label %".199", label %".205"
.199:
  %".200" = load i32, i32* %".10", align 4
  %".201" = icmp ne i32 %".200", 0
  br i1 %".201", label %".202", label %".205"
.202:
  %".203" = load i32, i32* %".16", align 4
  %".204" = icmp ne i32 %".203", 0
  br label %".205"
.205:
  %".206" = phi  i1 [1, %".190"], [1, %".193"], [0, %".196"], [0, %".199"], [%".204", %".202"]
  %".207" = zext i1 %".206" to i32
  store i32 %".207", i32* %".19", align 4
  %".209" = load i32, i32* %".19", align 4
  ; printf "%d" f
  %".211" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".212" = alloca i32
  store i32 %".209", i32* %".212"
  %".214" = load i32, i32* %".212"
  %".215" = call i32 (i8*, ...) @"printf"(i8* %".211", i32 %".214")
  ret i32 0
  ;  return 0
}

declare i32 @"printf"(i8* %".1", ...)

@".str.PS0" = internal constant [3 x i8] c"%d\00"
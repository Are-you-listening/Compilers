; ModuleID = "tests/test7.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ; INT main
  %".58" = alloca i32, align 4
  store i32 0, i32* %".58", align 4
  ; INT a = 0
  %".61" = alloca i32, align 4
  store i32 0, i32* %".61", align 4
  ; INT b = 0
  %".64" = alloca i32, align 4
  store i32 0, i32* %".64", align 4
  ; INT c = 0
  %".67" = alloca i32, align 4
  store i32 0, i32* %".67", align 4
  ; INT d = 0
  %".70" = alloca i32, align 4
  store i32 0, i32* %".70", align 4
  ; INT e = 0
  %".73" = alloca i32, align 4
  store i32 0, i32* %".73", align 4
  ; INT f = 0
  store i32 0, i32* %".58", align 4
  ; a = 0
  store i32 0, i32* %".61", align 4
  ; b = 0
  store i32 0, i32* %".64", align 4
  ; c = 0
  store i32 0, i32* %".67", align 4
  ; d = 0
  store i32 0, i32* %".70", align 4
  ; e = 0
  %".86" = load i32, i32* %".58", align 4
  ; f = a && b || c || d && c && e
  %".88" = icmp ne i32 %".86", 0
  br i1 %".88", label %".3", label %".5"
.3:
  %".90" = load i32, i32* %".61", align 4
  %".91" = icmp ne i32 %".90", 0
  br i1 %".91", label %".8", label %".4"
.4:
  %".93" = load i32, i32* %".64", align 4
  %".94" = icmp ne i32 %".93", 0
  br i1 %".94", label %".8", label %".5"
.5:
  %".96" = load i32, i32* %".67", align 4
  %".97" = icmp ne i32 %".96", 0
  br i1 %".97", label %".6", label %".8"
.6:
  %".99" = load i32, i32* %".64", align 4
  %".100" = icmp ne i32 %".99", 0
  br i1 %".100", label %".7", label %".8"
.7:
  %".102" = load i32, i32* %".70", align 4
  %".103" = icmp ne i32 %".102", 0
  br label %".8"
.8:
  %".105" = phi  i1 [1, %".4"], [1, %".3"], [%".103", %".7"], [0, %".5"], [0, %".6"]
  %".106" = zext i1 %".105" to i32
  store i32 %".106", i32* %".73", align 4
  %".108" = load i32, i32* %".73", align 4
  ; printf "%d" , f
  %".110" = bitcast [3 x i8]* @".str.d" to i8*
  %".111" = alloca i32
  store i32 %".108", i32* %".111"
  %".113" = load i32, i32* %".111"
  %".114" = call i32 (i8*, ...) @"printf"(i8* %".110", i32 %".113")
  store i32 1, i32* %".58", align 4
  ; a = 1
  %".117" = load i32, i32* %".58", align 4
  ; f = a && b || c || d && c && e
  %".119" = icmp ne i32 %".117", 0
  br i1 %".119", label %".9", label %".11"
.9:
  %".121" = load i32, i32* %".61", align 4
  %".122" = icmp ne i32 %".121", 0
  br i1 %".122", label %".14", label %".10"
.10:
  %".124" = load i32, i32* %".64", align 4
  %".125" = icmp ne i32 %".124", 0
  br i1 %".125", label %".14", label %".11"
.11:
  %".127" = load i32, i32* %".67", align 4
  %".128" = icmp ne i32 %".127", 0
  br i1 %".128", label %".12", label %".14"
.12:
  %".130" = load i32, i32* %".64", align 4
  %".131" = icmp ne i32 %".130", 0
  br i1 %".131", label %".13", label %".14"
.13:
  %".133" = load i32, i32* %".70", align 4
  %".134" = icmp ne i32 %".133", 0
  br label %".14"
.14:
  %".136" = phi  i1 [1, %".10"], [0, %".11"], [%".134", %".13"], [0, %".12"], [1, %".9"]
  %".137" = zext i1 %".136" to i32
  store i32 %".137", i32* %".73", align 4
  %".139" = load i32, i32* %".73", align 4
  ; printf "%d" , f
  %".141" = bitcast [3 x i8]* @".str.d" to i8*
  %".142" = alloca i32
  store i32 %".139", i32* %".142"
  %".144" = load i32, i32* %".142"
  %".145" = call i32 (i8*, ...) @"printf"(i8* %".141", i32 %".144")
  store i32 1, i32* %".61", align 4
  ; b = 1
  %".148" = load i32, i32* %".58", align 4
  ; f = a && b || c || d && c && e
  %".150" = icmp ne i32 %".148", 0
  br i1 %".150", label %".15", label %".17"
.15:
  %".152" = load i32, i32* %".61", align 4
  %".153" = icmp ne i32 %".152", 0
  br i1 %".153", label %".20", label %".16"
.16:
  %".155" = load i32, i32* %".64", align 4
  %".156" = icmp ne i32 %".155", 0
  br i1 %".156", label %".20", label %".17"
.17:
  %".158" = load i32, i32* %".67", align 4
  %".159" = icmp ne i32 %".158", 0
  br i1 %".159", label %".18", label %".20"
.18:
  %".161" = load i32, i32* %".64", align 4
  %".162" = icmp ne i32 %".161", 0
  br i1 %".162", label %".19", label %".20"
.19:
  %".164" = load i32, i32* %".70", align 4
  %".165" = icmp ne i32 %".164", 0
  br label %".20"
.20:
  %".167" = phi  i1 [1, %".15"], [%".165", %".19"], [0, %".17"], [1, %".16"], [0, %".18"]
  %".168" = zext i1 %".167" to i32
  store i32 %".168", i32* %".73", align 4
  %".170" = load i32, i32* %".73", align 4
  ; printf "%d" , f
  %".172" = bitcast [3 x i8]* @".str.d" to i8*
  %".173" = alloca i32
  store i32 %".170", i32* %".173"
  %".175" = load i32, i32* %".173"
  %".176" = call i32 (i8*, ...) @"printf"(i8* %".172", i32 %".175")
  store i32 1, i32* %".64", align 4
  ; c = 1
  %".179" = load i32, i32* %".58", align 4
  ; f = a && b || c || d && c && e
  %".181" = icmp ne i32 %".179", 0
  br i1 %".181", label %".21", label %".23"
.21:
  %".183" = load i32, i32* %".61", align 4
  %".184" = icmp ne i32 %".183", 0
  br i1 %".184", label %".26", label %".22"
.22:
  %".186" = load i32, i32* %".64", align 4
  %".187" = icmp ne i32 %".186", 0
  br i1 %".187", label %".26", label %".23"
.23:
  %".189" = load i32, i32* %".67", align 4
  %".190" = icmp ne i32 %".189", 0
  br i1 %".190", label %".24", label %".26"
.24:
  %".192" = load i32, i32* %".64", align 4
  %".193" = icmp ne i32 %".192", 0
  br i1 %".193", label %".25", label %".26"
.25:
  %".195" = load i32, i32* %".70", align 4
  %".196" = icmp ne i32 %".195", 0
  br label %".26"
.26:
  %".198" = phi  i1 [0, %".24"], [%".196", %".25"], [1, %".22"], [1, %".21"], [0, %".23"]
  %".199" = zext i1 %".198" to i32
  store i32 %".199", i32* %".73", align 4
  %".201" = load i32, i32* %".73", align 4
  ; printf "%d" , f
  %".203" = bitcast [3 x i8]* @".str.d" to i8*
  %".204" = alloca i32
  store i32 %".201", i32* %".204"
  %".206" = load i32, i32* %".204"
  %".207" = call i32 (i8*, ...) @"printf"(i8* %".203", i32 %".206")
  store i32 1, i32* %".67", align 4
  ; d = 1
  %".210" = load i32, i32* %".58", align 4
  ; f = a && b || c || d && c && e
  %".212" = icmp ne i32 %".210", 0
  br i1 %".212", label %".27", label %".29"
.27:
  %".214" = load i32, i32* %".61", align 4
  %".215" = icmp ne i32 %".214", 0
  br i1 %".215", label %".32", label %".28"
.28:
  %".217" = load i32, i32* %".64", align 4
  %".218" = icmp ne i32 %".217", 0
  br i1 %".218", label %".32", label %".29"
.29:
  %".220" = load i32, i32* %".67", align 4
  %".221" = icmp ne i32 %".220", 0
  br i1 %".221", label %".30", label %".32"
.30:
  %".223" = load i32, i32* %".64", align 4
  %".224" = icmp ne i32 %".223", 0
  br i1 %".224", label %".31", label %".32"
.31:
  %".226" = load i32, i32* %".70", align 4
  %".227" = icmp ne i32 %".226", 0
  br label %".32"
.32:
  %".229" = phi  i1 [0, %".30"], [1, %".28"], [0, %".29"], [%".227", %".31"], [1, %".27"]
  %".230" = zext i1 %".229" to i32
  store i32 %".230", i32* %".73", align 4
  %".232" = load i32, i32* %".73", align 4
  ; printf "%d" , f
  %".234" = bitcast [3 x i8]* @".str.d" to i8*
  %".235" = alloca i32
  store i32 %".232", i32* %".235"
  %".237" = load i32, i32* %".235"
  %".238" = call i32 (i8*, ...) @"printf"(i8* %".234", i32 %".237")
  store i32 1, i32* %".70", align 4
  ; e = 1
  %".241" = load i32, i32* %".58", align 4
  ; f = a && b || c || d && c && e
  %".243" = icmp ne i32 %".241", 0
  br i1 %".243", label %".33", label %".35"
.33:
  %".245" = load i32, i32* %".61", align 4
  %".246" = icmp ne i32 %".245", 0
  br i1 %".246", label %".38", label %".34"
.34:
  %".248" = load i32, i32* %".64", align 4
  %".249" = icmp ne i32 %".248", 0
  br i1 %".249", label %".38", label %".35"
.35:
  %".251" = load i32, i32* %".67", align 4
  %".252" = icmp ne i32 %".251", 0
  br i1 %".252", label %".36", label %".38"
.36:
  %".254" = load i32, i32* %".64", align 4
  %".255" = icmp ne i32 %".254", 0
  br i1 %".255", label %".37", label %".38"
.37:
  %".257" = load i32, i32* %".70", align 4
  %".258" = icmp ne i32 %".257", 0
  br label %".38"
.38:
  %".260" = phi  i1 [0, %".36"], [0, %".35"], [%".258", %".37"], [1, %".33"], [1, %".34"]
  %".261" = zext i1 %".260" to i32
  store i32 %".261", i32* %".73", align 4
  %".263" = load i32, i32* %".73", align 4
  ; printf "%d" , f
  %".265" = bitcast [3 x i8]* @".str.d" to i8*
  %".266" = alloca i32
  store i32 %".263", i32* %".266"
  %".268" = load i32, i32* %".266"
  %".269" = call i32 (i8*, ...) @"printf"(i8* %".265", i32 %".268")
  store i32 0, i32* %".61", align 4
  ; b = 0
  %".272" = load i32, i32* %".58", align 4
  ; f = a && b || c || d && c && e
  %".274" = icmp ne i32 %".272", 0
  br i1 %".274", label %".39", label %".41"
.39:
  %".276" = load i32, i32* %".61", align 4
  %".277" = icmp ne i32 %".276", 0
  br i1 %".277", label %".44", label %".40"
.40:
  %".279" = load i32, i32* %".64", align 4
  %".280" = icmp ne i32 %".279", 0
  br i1 %".280", label %".44", label %".41"
.41:
  %".282" = load i32, i32* %".67", align 4
  %".283" = icmp ne i32 %".282", 0
  br i1 %".283", label %".42", label %".44"
.42:
  %".285" = load i32, i32* %".64", align 4
  %".286" = icmp ne i32 %".285", 0
  br i1 %".286", label %".43", label %".44"
.43:
  %".288" = load i32, i32* %".70", align 4
  %".289" = icmp ne i32 %".288", 0
  br label %".44"
.44:
  %".291" = phi  i1 [%".289", %".43"], [0, %".41"], [1, %".40"], [0, %".42"], [1, %".39"]
  %".292" = zext i1 %".291" to i32
  store i32 %".292", i32* %".73", align 4
  %".294" = load i32, i32* %".73", align 4
  ; printf "%d" , f
  %".296" = bitcast [3 x i8]* @".str.d" to i8*
  %".297" = alloca i32
  store i32 %".294", i32* %".297"
  %".299" = load i32, i32* %".297"
  %".300" = call i32 (i8*, ...) @"printf"(i8* %".296", i32 %".299")
  store i32 0, i32* %".64", align 4
  ; c = 0
  %".303" = load i32, i32* %".58", align 4
  ; f = a && b || c || d && c && e
  %".305" = icmp ne i32 %".303", 0
  br i1 %".305", label %".45", label %".47"
.45:
  %".307" = load i32, i32* %".61", align 4
  %".308" = icmp ne i32 %".307", 0
  br i1 %".308", label %".50", label %".46"
.46:
  %".310" = load i32, i32* %".64", align 4
  %".311" = icmp ne i32 %".310", 0
  br i1 %".311", label %".50", label %".47"
.47:
  %".313" = load i32, i32* %".67", align 4
  %".314" = icmp ne i32 %".313", 0
  br i1 %".314", label %".48", label %".50"
.48:
  %".316" = load i32, i32* %".64", align 4
  %".317" = icmp ne i32 %".316", 0
  br i1 %".317", label %".49", label %".50"
.49:
  %".319" = load i32, i32* %".70", align 4
  %".320" = icmp ne i32 %".319", 0
  br label %".50"
.50:
  %".322" = phi  i1 [1, %".46"], [1, %".45"], [0, %".48"], [0, %".47"], [%".320", %".49"]
  %".323" = zext i1 %".322" to i32
  store i32 %".323", i32* %".73", align 4
  %".325" = load i32, i32* %".73", align 4
  ; printf "%d" , f
  %".327" = bitcast [3 x i8]* @".str.d" to i8*
  %".328" = alloca i32
  store i32 %".325", i32* %".328"
  %".330" = load i32, i32* %".328"
  %".331" = call i32 (i8*, ...) @"printf"(i8* %".327", i32 %".330")
  store i32 0, i32* %".67", align 4
  ; d = 0
  %".334" = load i32, i32* %".58", align 4
  ; f = a && b || c || d && c && e
  %".336" = icmp ne i32 %".334", 0
  br i1 %".336", label %".51", label %".53"
.51:
  %".338" = load i32, i32* %".61", align 4
  %".339" = icmp ne i32 %".338", 0
  br i1 %".339", label %".56", label %".52"
.52:
  %".341" = load i32, i32* %".64", align 4
  %".342" = icmp ne i32 %".341", 0
  br i1 %".342", label %".56", label %".53"
.53:
  %".344" = load i32, i32* %".67", align 4
  %".345" = icmp ne i32 %".344", 0
  br i1 %".345", label %".54", label %".56"
.54:
  %".347" = load i32, i32* %".64", align 4
  %".348" = icmp ne i32 %".347", 0
  br i1 %".348", label %".55", label %".56"
.55:
  %".350" = load i32, i32* %".70", align 4
  %".351" = icmp ne i32 %".350", 0
  br label %".56"
.56:
  %".353" = phi  i1 [%".351", %".55"], [0, %".54"], [0, %".53"], [1, %".52"], [1, %".51"]
  %".354" = zext i1 %".353" to i32
  store i32 %".354", i32* %".73", align 4
  %".356" = load i32, i32* %".73", align 4
  ; printf "%d" , f
  %".358" = bitcast [3 x i8]* @".str.d" to i8*
  %".359" = alloca i32
  store i32 %".356", i32* %".359"
  %".361" = load i32, i32* %".359"
  %".362" = call i32 (i8*, ...) @"printf"(i8* %".358", i32 %".361")
  ret i32 0
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"
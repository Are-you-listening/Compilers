; ModuleID = "tests/test1.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 0, i32* %".3", align 4
  ; INT a = 0
  store i32 110127075, i32* %".3", align 4
  ; a = 33 + 69789 * 69421 / 51213 + 2231 - 654
  %".8" = load i32, i32* %".3", align 4
  ; printf "%d" , a
  %".10" = bitcast [3 x i8]* @".str.d" to i8*
  %".11" = alloca i32
  store i32 %".8", i32* %".11"
  %".13" = load i32, i32* %".11"
  %".14" = call i32 (i8*, ...) @"printf"(i8* %".10", i32 %".13")
  store i32 0, i32* %".3", align 4
  ; a = 654 * 15486 - 15000 + 486
  %".17" = load i32, i32* %".3", align 4
  ; printf "%d" , a
  %".19" = bitcast [3 x i8]* @".str.d" to i8*
  %".20" = alloca i32
  store i32 %".17", i32* %".20"
  %".22" = load i32, i32* %".20"
  %".23" = call i32 (i8*, ...) @"printf"(i8* %".19", i32 %".22")
  store i32 1, i32* %".3", align 4
  ; a = 1 && 1 || 0
  %".26" = load i32, i32* %".3", align 4
  ; printf "%d" , a
  %".28" = bitcast [3 x i8]* @".str.d" to i8*
  %".29" = alloca i32
  store i32 %".26", i32* %".29"
  %".31" = load i32, i32* %".29"
  %".32" = call i32 (i8*, ...) @"printf"(i8* %".28", i32 %".31")
  store i32 0, i32* %".3", align 4
  ; a = 0 && 1 && 1
  %".35" = load i32, i32* %".3", align 4
  ; printf "%d" , a
  %".37" = bitcast [3 x i8]* @".str.d" to i8*
  %".38" = alloca i32
  store i32 %".35", i32* %".38"
  %".40" = load i32, i32* %".38"
  %".41" = call i32 (i8*, ...) @"printf"(i8* %".37", i32 %".40")
  store i32 0, i32* %".3", align 4
  ; a = 0 || 0 * 3
  %".44" = load i32, i32* %".3", align 4
  ; printf "%d" , a
  %".46" = bitcast [3 x i8]* @".str.d" to i8*
  %".47" = alloca i32
  store i32 %".44", i32* %".47"
  %".49" = load i32, i32* %".47"
  %".50" = call i32 (i8*, ...) @"printf"(i8* %".46", i32 %".49")
  store i32 0, i32* %".3", align 4
  ; a = 1 && ! 1 + 0
  %".53" = load i32, i32* %".3", align 4
  ; printf "%d" , a
  %".55" = bitcast [3 x i8]* @".str.d" to i8*
  %".56" = alloca i32
  store i32 %".53", i32* %".56"
  %".58" = load i32, i32* %".56"
  %".59" = call i32 (i8*, ...) @"printf"(i8* %".55", i32 %".58")
  store i32 166675612, i32* %".3", align 4
  ; a = 12 + 98721 + 36265 / 456 * 0 + 1687
  %".62" = load i32, i32* %".3", align 4
  ; printf "%d" , a
  %".64" = bitcast [3 x i8]* @".str.d" to i8*
  %".65" = alloca i32
  store i32 %".62", i32* %".65"
  %".67" = load i32, i32* %".65"
  %".68" = call i32 (i8*, ...) @"printf"(i8* %".64", i32 %".67")
  store i32 12, i32* %".3", align 4
  ; a = 12 + 98721 * 0 + 36265 / 456 * 0
  %".71" = load i32, i32* %".3", align 4
  ; printf "%d" , a
  %".73" = bitcast [3 x i8]* @".str.d" to i8*
  %".74" = alloca i32
  store i32 %".71", i32* %".74"
  %".76" = load i32, i32* %".74"
  %".77" = call i32 (i8*, ...) @"printf"(i8* %".73", i32 %".76")
  store i32 1, i32* %".3", align 4
  ; a = 12321 > 9656 + 3
  %".80" = load i32, i32* %".3", align 4
  ; printf "%d" , a
  %".82" = bitcast [3 x i8]* @".str.d" to i8*
  %".83" = alloca i32
  store i32 %".80", i32* %".83"
  %".85" = load i32, i32* %".83"
  %".86" = call i32 (i8*, ...) @"printf"(i8* %".82", i32 %".85")
  store i32 0, i32* %".3", align 4
  ; a = 125154 < 54 > - 65
  %".89" = load i32, i32* %".3", align 4
  ; printf "%d" , a
  %".91" = bitcast [3 x i8]* @".str.d" to i8*
  %".92" = alloca i32
  store i32 %".89", i32* %".92"
  %".94" = load i32, i32* %".92"
  %".95" = call i32 (i8*, ...) @"printf"(i8* %".91", i32 %".94")
  store i32 1, i32* %".3", align 4
  ; a = 987842121 >= 212
  %".98" = load i32, i32* %".3", align 4
  ; printf "%d" , a
  %".100" = bitcast [3 x i8]* @".str.d" to i8*
  %".101" = alloca i32
  store i32 %".98", i32* %".101"
  %".103" = load i32, i32* %".101"
  %".104" = call i32 (i8*, ...) @"printf"(i8* %".100", i32 %".103")
  store i32 1, i32* %".3", align 4
  ; a = - 6549 <= 2189 + 63
  %".107" = load i32, i32* %".3", align 4
  ; printf "%d" , a
  %".109" = bitcast [3 x i8]* @".str.d" to i8*
  %".110" = alloca i32
  store i32 %".107", i32* %".110"
  %".112" = load i32, i32* %".110"
  %".113" = call i32 (i8*, ...) @"printf"(i8* %".109", i32 %".112")
  store i32 1, i32* %".3", align 4
  ; a = 0 >= - 564654
  %".116" = load i32, i32* %".3", align 4
  ; printf "%d" , a
  %".118" = bitcast [3 x i8]* @".str.d" to i8*
  %".119" = alloca i32
  store i32 %".116", i32* %".119"
  %".121" = load i32, i32* %".119"
  %".122" = call i32 (i8*, ...) @"printf"(i8* %".118", i32 %".121")
  store i32 1, i32* %".3", align 4
  ; a = 540 != 58973
  %".125" = load i32, i32* %".3", align 4
  ; printf "%d" , a
  %".127" = bitcast [3 x i8]* @".str.d" to i8*
  %".128" = alloca i32
  store i32 %".125", i32* %".128"
  %".130" = load i32, i32* %".128"
  %".131" = call i32 (i8*, ...) @"printf"(i8* %".127", i32 %".130")
  store i32 0, i32* %".3", align 4
  ; a = - 5 != - 5
  %".134" = load i32, i32* %".3", align 4
  ; printf "%d" , a
  %".136" = bitcast [3 x i8]* @".str.d" to i8*
  %".137" = alloca i32
  store i32 %".134", i32* %".137"
  %".139" = load i32, i32* %".137"
  %".140" = call i32 (i8*, ...) @"printf"(i8* %".136", i32 %".139")
  store i32 0, i32* %".3", align 4
  ; a = - 5 * 20 != - 4 * 25
  %".143" = load i32, i32* %".3", align 4
  ; printf "%d" , a
  %".145" = bitcast [3 x i8]* @".str.d" to i8*
  %".146" = alloca i32
  store i32 %".143", i32* %".146"
  %".148" = load i32, i32* %".146"
  %".149" = call i32 (i8*, ...) @"printf"(i8* %".145", i32 %".148")
  store i32 9, i32* %".3", align 4
  ; a = 9 % 10
  %".152" = load i32, i32* %".3", align 4
  ; printf "%d" , a
  %".154" = bitcast [3 x i8]* @".str.d" to i8*
  %".155" = alloca i32
  store i32 %".152", i32* %".155"
  %".157" = load i32, i32* %".155"
  %".158" = call i32 (i8*, ...) @"printf"(i8* %".154", i32 %".157")
  store i32 9, i32* %".3", align 4
  ; a = 19 % 10
  %".161" = load i32, i32* %".3", align 4
  ; printf "%d" , a
  %".163" = bitcast [3 x i8]* @".str.d" to i8*
  %".164" = alloca i32
  store i32 %".161", i32* %".164"
  %".166" = load i32, i32* %".164"
  %".167" = call i32 (i8*, ...) @"printf"(i8* %".163", i32 %".166")
  store i32 3, i32* %".3", align 4
  ; a = 8971 % 8
  %".170" = load i32, i32* %".3", align 4
  ; printf "%d" , a
  %".172" = bitcast [3 x i8]* @".str.d" to i8*
  %".173" = alloca i32
  store i32 %".170", i32* %".173"
  %".175" = load i32, i32* %".173"
  %".176" = call i32 (i8*, ...) @"printf"(i8* %".172", i32 %".175")
  store i32 16384, i32* %".3", align 4
  ; a = 1024 << 4
  %".179" = load i32, i32* %".3", align 4
  ; printf "%d" , a
  %".181" = bitcast [3 x i8]* @".str.d" to i8*
  %".182" = alloca i32
  store i32 %".179", i32* %".182"
  %".184" = load i32, i32* %".182"
  %".185" = call i32 (i8*, ...) @"printf"(i8* %".181", i32 %".184")
  store i32 256, i32* %".3", align 4
  ; a = 2048 >> 3
  %".188" = load i32, i32* %".3", align 4
  ; printf "%d" , a
  %".190" = bitcast [3 x i8]* @".str.d" to i8*
  %".191" = alloca i32
  store i32 %".188", i32* %".191"
  %".193" = load i32, i32* %".191"
  %".194" = call i32 (i8*, ...) @"printf"(i8* %".190", i32 %".193")
  store i32 0, i32* %".3", align 4
  ; a = 2048 >> - 3
  %".197" = load i32, i32* %".3", align 4
  ; printf "%d" , a
  %".199" = bitcast [3 x i8]* @".str.d" to i8*
  %".200" = alloca i32
  store i32 %".197", i32* %".200"
  %".202" = load i32, i32* %".200"
  %".203" = call i32 (i8*, ...) @"printf"(i8* %".199", i32 %".202")
  store i32 7360446, i32* %".3", align 4
  ; a = 23423 ^ 7345345
  %".206" = load i32, i32* %".3", align 4
  ; printf "%d" , a
  %".208" = bitcast [3 x i8]* @".str.d" to i8*
  %".209" = alloca i32
  store i32 %".206", i32* %".209"
  %".211" = load i32, i32* %".209"
  %".212" = call i32 (i8*, ...) @"printf"(i8* %".208", i32 %".211")
  store i32 778, i32* %".3", align 4
  ; a = 843 & - 86
  %".215" = load i32, i32* %".3", align 4
  ; printf "%d" , a
  %".217" = bitcast [3 x i8]* @".str.d" to i8*
  %".218" = alloca i32
  store i32 %".215", i32* %".218"
  %".220" = load i32, i32* %".218"
  %".221" = call i32 (i8*, ...) @"printf"(i8* %".217", i32 %".220")
  store i32 1018, i32* %".3", align 4
  ; a = 954 | 976
  %".224" = load i32, i32* %".3", align 4
  ; printf "%d" , a
  %".226" = bitcast [3 x i8]* @".str.d" to i8*
  %".227" = alloca i32
  store i32 %".224", i32* %".227"
  %".229" = load i32, i32* %".227"
  %".230" = call i32 (i8*, ...) @"printf"(i8* %".226", i32 %".229")
  store i32 0, i32* %".3", align 4
  ; a = ! 9736
  %".233" = load i32, i32* %".3", align 4
  ; printf "%d" , a
  %".235" = bitcast [3 x i8]* @".str.d" to i8*
  %".236" = alloca i32
  store i32 %".233", i32* %".236"
  %".238" = load i32, i32* %".236"
  %".239" = call i32 (i8*, ...) @"printf"(i8* %".235", i32 %".238")
  ret i32 0
  ; INT main
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"
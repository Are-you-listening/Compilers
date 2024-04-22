; ModuleID = "tests/test1.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;    INT main
  %".4" = alloca i32, align 4
  store i32 0, i32* %".4", align 4
  ; INT a = 0
  store i32 110127075, i32* %".4", align 4
  ; a = 33 + 69789 * 69421 / 51213 + 2231 - 654
  %".9" = load i32, i32* %".4", align 4
  ; printf "%d" a
  %".11" = bitcast [3 x i8]* @".str.0" to i8*
  %".12" = alloca i32
  store i32 %".9", i32* %".12"
  %".14" = load i32, i32* %".12"
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".11", i32 %".14")
  store i32 0, i32* %".4", align 4
  ;  a = 654 * 15486 - 15000 + 486
  %".18" = load i32, i32* %".4", align 4
  ; printf "%d" a
  %".20" = bitcast [3 x i8]* @".str.0" to i8*
  %".21" = alloca i32
  store i32 %".18", i32* %".21"
  %".23" = load i32, i32* %".21"
  %".24" = call i32 (i8*, ...) @"printf"(i8* %".20", i32 %".23")
  store i32 1, i32* %".4", align 4
  ;  a = 1 && 1 || 0
  %".27" = load i32, i32* %".4", align 4
  ; printf "%d" a
  %".29" = bitcast [3 x i8]* @".str.0" to i8*
  %".30" = alloca i32
  store i32 %".27", i32* %".30"
  %".32" = load i32, i32* %".30"
  %".33" = call i32 (i8*, ...) @"printf"(i8* %".29", i32 %".32")
  store i32 0, i32* %".4", align 4
  ; a = 0 && 1 && 1
  %".36" = load i32, i32* %".4", align 4
  ; printf "%d" a
  %".38" = bitcast [3 x i8]* @".str.0" to i8*
  %".39" = alloca i32
  store i32 %".36", i32* %".39"
  %".41" = load i32, i32* %".39"
  %".42" = call i32 (i8*, ...) @"printf"(i8* %".38", i32 %".41")
  store i32 0, i32* %".4", align 4
  ; a = 0 || 0 * 3
  %".45" = load i32, i32* %".4", align 4
  ; printf "%d" a
  %".47" = bitcast [3 x i8]* @".str.0" to i8*
  %".48" = alloca i32
  store i32 %".45", i32* %".48"
  %".50" = load i32, i32* %".48"
  %".51" = call i32 (i8*, ...) @"printf"(i8* %".47", i32 %".50")
  store i32 0, i32* %".4", align 4
  ; a = 1 && ! 1 + 0
  %".54" = load i32, i32* %".4", align 4
  ; printf "%d" a
  %".56" = bitcast [3 x i8]* @".str.0" to i8*
  %".57" = alloca i32
  store i32 %".54", i32* %".57"
  %".59" = load i32, i32* %".57"
  %".60" = call i32 (i8*, ...) @"printf"(i8* %".56", i32 %".59")
  store i32 166675612, i32* %".4", align 4
  ; a = 12 + 98721 + 36265 / 456 * 0 + 1687
  %".63" = load i32, i32* %".4", align 4
  ; printf "%d" a
  %".65" = bitcast [3 x i8]* @".str.0" to i8*
  %".66" = alloca i32
  store i32 %".63", i32* %".66"
  %".68" = load i32, i32* %".66"
  %".69" = call i32 (i8*, ...) @"printf"(i8* %".65", i32 %".68")
  store i32 12, i32* %".4", align 4
  ; a = 12 + 98721 * 0 + 36265 / 456 * 0
  %".72" = load i32, i32* %".4", align 4
  ; printf "%d" a
  %".74" = bitcast [3 x i8]* @".str.0" to i8*
  %".75" = alloca i32
  store i32 %".72", i32* %".75"
  %".77" = load i32, i32* %".75"
  %".78" = call i32 (i8*, ...) @"printf"(i8* %".74", i32 %".77")
  store i32 1, i32* %".4", align 4
  ;  a = 12321 > 9656 + 3
  %".81" = load i32, i32* %".4", align 4
  ; printf "%d" a
  %".83" = bitcast [3 x i8]* @".str.0" to i8*
  %".84" = alloca i32
  store i32 %".81", i32* %".84"
  %".86" = load i32, i32* %".84"
  %".87" = call i32 (i8*, ...) @"printf"(i8* %".83", i32 %".86")
  store i32 0, i32* %".4", align 4
  ; a = 125154 < 54 > - 65
  %".90" = load i32, i32* %".4", align 4
  ; printf "%d" a
  %".92" = bitcast [3 x i8]* @".str.0" to i8*
  %".93" = alloca i32
  store i32 %".90", i32* %".93"
  %".95" = load i32, i32* %".93"
  %".96" = call i32 (i8*, ...) @"printf"(i8* %".92", i32 %".95")
  store i32 1, i32* %".4", align 4
  ;  a = 987842121 >= 212
  %".99" = load i32, i32* %".4", align 4
  ; printf "%d" a
  %".101" = bitcast [3 x i8]* @".str.0" to i8*
  %".102" = alloca i32
  store i32 %".99", i32* %".102"
  %".104" = load i32, i32* %".102"
  %".105" = call i32 (i8*, ...) @"printf"(i8* %".101", i32 %".104")
  store i32 1, i32* %".4", align 4
  ;  a = - 6549 <= 2189 + 63
  %".108" = load i32, i32* %".4", align 4
  ; printf "%d" a
  %".110" = bitcast [3 x i8]* @".str.0" to i8*
  %".111" = alloca i32
  store i32 %".108", i32* %".111"
  %".113" = load i32, i32* %".111"
  %".114" = call i32 (i8*, ...) @"printf"(i8* %".110", i32 %".113")
  store i32 1, i32* %".4", align 4
  ; a = 0 >= - 564654
  %".117" = load i32, i32* %".4", align 4
  ; printf "%d" a
  %".119" = bitcast [3 x i8]* @".str.0" to i8*
  %".120" = alloca i32
  store i32 %".117", i32* %".120"
  %".122" = load i32, i32* %".120"
  %".123" = call i32 (i8*, ...) @"printf"(i8* %".119", i32 %".122")
  store i32 1, i32* %".4", align 4
  ;  a = 540 != 58973
  %".126" = load i32, i32* %".4", align 4
  ; printf "%d" a
  %".128" = bitcast [3 x i8]* @".str.0" to i8*
  %".129" = alloca i32
  store i32 %".126", i32* %".129"
  %".131" = load i32, i32* %".129"
  %".132" = call i32 (i8*, ...) @"printf"(i8* %".128", i32 %".131")
  store i32 0, i32* %".4", align 4
  ; a = - 5 != - 5
  %".135" = load i32, i32* %".4", align 4
  ; printf "%d" a
  %".137" = bitcast [3 x i8]* @".str.0" to i8*
  %".138" = alloca i32
  store i32 %".135", i32* %".138"
  %".140" = load i32, i32* %".138"
  %".141" = call i32 (i8*, ...) @"printf"(i8* %".137", i32 %".140")
  store i32 0, i32* %".4", align 4
  ;  a = - 5 * 20 != - 4 * 25
  %".144" = load i32, i32* %".4", align 4
  ; printf "%d" a
  %".146" = bitcast [3 x i8]* @".str.0" to i8*
  %".147" = alloca i32
  store i32 %".144", i32* %".147"
  %".149" = load i32, i32* %".147"
  %".150" = call i32 (i8*, ...) @"printf"(i8* %".146", i32 %".149")
  store i32 9, i32* %".4", align 4
  ;  a = 9 % 10
  %".153" = load i32, i32* %".4", align 4
  ; printf "%d" a
  %".155" = bitcast [3 x i8]* @".str.0" to i8*
  %".156" = alloca i32
  store i32 %".153", i32* %".156"
  %".158" = load i32, i32* %".156"
  %".159" = call i32 (i8*, ...) @"printf"(i8* %".155", i32 %".158")
  store i32 9, i32* %".4", align 4
  ; a = 19 % 10
  %".162" = load i32, i32* %".4", align 4
  ; printf "%d" a
  %".164" = bitcast [3 x i8]* @".str.0" to i8*
  %".165" = alloca i32
  store i32 %".162", i32* %".165"
  %".167" = load i32, i32* %".165"
  %".168" = call i32 (i8*, ...) @"printf"(i8* %".164", i32 %".167")
  store i32 3, i32* %".4", align 4
  ; a = 8971 % 8
  %".171" = load i32, i32* %".4", align 4
  ; printf "%d" a
  %".173" = bitcast [3 x i8]* @".str.0" to i8*
  %".174" = alloca i32
  store i32 %".171", i32* %".174"
  %".176" = load i32, i32* %".174"
  %".177" = call i32 (i8*, ...) @"printf"(i8* %".173", i32 %".176")
  store i32 16384, i32* %".4", align 4
  ;  a = 1024 << 4
  %".180" = load i32, i32* %".4", align 4
  ; printf "%d" a
  %".182" = bitcast [3 x i8]* @".str.0" to i8*
  %".183" = alloca i32
  store i32 %".180", i32* %".183"
  %".185" = load i32, i32* %".183"
  %".186" = call i32 (i8*, ...) @"printf"(i8* %".182", i32 %".185")
  store i32 256, i32* %".4", align 4
  ; a = 2048 >> 3
  %".189" = load i32, i32* %".4", align 4
  ; printf "%d" a
  %".191" = bitcast [3 x i8]* @".str.0" to i8*
  %".192" = alloca i32
  store i32 %".189", i32* %".192"
  %".194" = load i32, i32* %".192"
  %".195" = call i32 (i8*, ...) @"printf"(i8* %".191", i32 %".194")
  store i32 0, i32* %".4", align 4
  ; a = 2048 >> - 3
  %".198" = load i32, i32* %".4", align 4
  ; printf "%d" a
  %".200" = bitcast [3 x i8]* @".str.0" to i8*
  %".201" = alloca i32
  store i32 %".198", i32* %".201"
  %".203" = load i32, i32* %".201"
  %".204" = call i32 (i8*, ...) @"printf"(i8* %".200", i32 %".203")
  store i32 7360446, i32* %".4", align 4
  ;   a = 23423 ^ 7345345
  %".207" = load i32, i32* %".4", align 4
  ; printf "%d" a
  %".209" = bitcast [3 x i8]* @".str.0" to i8*
  %".210" = alloca i32
  store i32 %".207", i32* %".210"
  %".212" = load i32, i32* %".210"
  %".213" = call i32 (i8*, ...) @"printf"(i8* %".209", i32 %".212")
  store i32 778, i32* %".4", align 4
  ; a = 843 & - 86
  %".216" = load i32, i32* %".4", align 4
  ; printf "%d" a
  %".218" = bitcast [3 x i8]* @".str.0" to i8*
  %".219" = alloca i32
  store i32 %".216", i32* %".219"
  %".221" = load i32, i32* %".219"
  %".222" = call i32 (i8*, ...) @"printf"(i8* %".218", i32 %".221")
  store i32 1018, i32* %".4", align 4
  ; a = 954 | 976
  %".225" = load i32, i32* %".4", align 4
  ; printf "%d" a
  %".227" = bitcast [3 x i8]* @".str.0" to i8*
  %".228" = alloca i32
  store i32 %".225", i32* %".228"
  %".230" = load i32, i32* %".228"
  %".231" = call i32 (i8*, ...) @"printf"(i8* %".227", i32 %".230")
  store i32 0, i32* %".4", align 4
  ; a = ! 9736
  %".234" = load i32, i32* %".4", align 4
  ; printf "%d" a
  %".236" = bitcast [3 x i8]* @".str.0" to i8*
  %".237" = alloca i32
  store i32 %".234", i32* %".237"
  %".239" = load i32, i32* %".237"
  %".240" = call i32 (i8*, ...) @"printf"(i8* %".236", i32 %".239")
  ret i32 0
  ;  return 0
}

@".str.0" = internal constant [3 x i8] c"%d\00"
declare i32 @"printf"(i8* %".1", ...)

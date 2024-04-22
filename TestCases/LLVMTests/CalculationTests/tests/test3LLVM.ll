; ModuleID = "tests/test3.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;     INT main
  %".4" = alloca i32, align 4
  store i32 0, i32* %".4", align 4
  ; INT a = 0
  store i32 110127075, i32* %".4", align 4
  ; a = 33 + 69789 * 69421 / 51213 + 2231 - 654
  %".9" = load i32, i32* %".4", align 4
  ; printf "%d" a
  %".11" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".12" = alloca i32
  store i32 %".9", i32* %".12"
  %".14" = load i32, i32* %".12"
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".11", i32 %".14")
  store i32 2, i32* %".4", align 4
  ;  a = 1 + 1
  %".18" = load i32, i32* %".4", align 4
  ; printf "%d" a
  %".20" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".21" = alloca i32
  store i32 %".18", i32* %".21"
  %".23" = load i32, i32* %".21"
  %".24" = call i32 (i8*, ...) @"printf"(i8* %".20", i32 %".23")
  store i32 -6985, i32* %".4", align 4
  ;  a = 0 - 6985
  %".27" = load i32, i32* %".4", align 4
  ; printf "%d" a
  %".29" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".30" = alloca i32
  store i32 %".27", i32* %".30"
  %".32" = load i32, i32* %".30"
  %".33" = call i32 (i8*, ...) @"printf"(i8* %".29", i32 %".32")
  store i32 315, i32* %".4", align 4
  ; a = 5 * 63
  %".36" = load i32, i32* %".4", align 4
  ; printf "%d" a
  %".38" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".39" = alloca i32
  store i32 %".36", i32* %".39"
  %".41" = load i32, i32* %".39"
  %".42" = call i32 (i8*, ...) @"printf"(i8* %".38", i32 %".41")
  store i32 0, i32* %".4", align 4
  ; a = 99 / 3622
  %".45" = load i32, i32* %".4", align 4
  ; printf "%d" a
  %".47" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".48" = alloca i32
  store i32 %".45", i32* %".48"
  %".50" = load i32, i32* %".48"
  %".51" = call i32 (i8*, ...) @"printf"(i8* %".47", i32 %".50")
  store i32 1, i32* %".4", align 4
  ; a = 3 > 1
  %".54" = load i32, i32* %".4", align 4
  ; printf "%d" a
  %".56" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".57" = alloca i32
  store i32 %".54", i32* %".57"
  %".59" = load i32, i32* %".57"
  %".60" = call i32 (i8*, ...) @"printf"(i8* %".56", i32 %".59")
  store i32 0, i32* %".4", align 4
  ; a = 3 < 1
  %".63" = load i32, i32* %".4", align 4
  ; printf "%d" a
  %".65" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".66" = alloca i32
  store i32 %".63", i32* %".66"
  %".68" = load i32, i32* %".66"
  %".69" = call i32 (i8*, ...) @"printf"(i8* %".65", i32 %".68")
  store i32 0, i32* %".4", align 4
  ; a = 8897 == 45647897
  %".72" = load i32, i32* %".4", align 4
  ; printf "%d" a
  %".74" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".75" = alloca i32
  store i32 %".72", i32* %".75"
  %".77" = load i32, i32* %".75"
  %".78" = call i32 (i8*, ...) @"printf"(i8* %".74", i32 %".77")
  store i32 487897, i32* %".4", align 4
  ; a = + 487897
  %".81" = load i32, i32* %".4", align 4
  ; printf "%d" a
  %".83" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".84" = alloca i32
  store i32 %".81", i32* %".84"
  %".86" = load i32, i32* %".84"
  %".87" = call i32 (i8*, ...) @"printf"(i8* %".83", i32 %".86")
  store i32 -5, i32* %".4", align 4
  ; a = - 5
  %".90" = load i32, i32* %".4", align 4
  ; printf "%d" a
  %".92" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".93" = alloca i32
  store i32 %".90", i32* %".93"
  %".95" = load i32, i32* %".93"
  %".96" = call i32 (i8*, ...) @"printf"(i8* %".92", i32 %".95")
  store i32 1, i32* %".4", align 4
  ; a = 1 && 656
  %".99" = load i32, i32* %".4", align 4
  ; printf "%d" a
  %".101" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".102" = alloca i32
  store i32 %".99", i32* %".102"
  %".104" = load i32, i32* %".102"
  %".105" = call i32 (i8*, ...) @"printf"(i8* %".101", i32 %".104")
  store i32 1, i32* %".4", align 4
  ; a = 989 || 68779
  %".108" = load i32, i32* %".4", align 4
  ; printf "%d" a
  %".110" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".111" = alloca i32
  store i32 %".108", i32* %".111"
  %".113" = load i32, i32* %".111"
  %".114" = call i32 (i8*, ...) @"printf"(i8* %".110", i32 %".113")
  store i32 0, i32* %".4", align 4
  ; a = ! 65465
  %".117" = load i32, i32* %".4", align 4
  ; printf "%d" a
  %".119" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".120" = alloca i32
  store i32 %".117", i32* %".120"
  %".122" = load i32, i32* %".120"
  %".123" = call i32 (i8*, ...) @"printf"(i8* %".119", i32 %".122")
  store i32 5, i32* %".4", align 4
  ; a = 1 + 3 * 6 / 1 + 3
  %".126" = load i32, i32* %".4", align 4
  ; printf "%d" a
  %".128" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".129" = alloca i32
  store i32 %".126", i32* %".129"
  %".131" = load i32, i32* %".129"
  %".132" = call i32 (i8*, ...) @"printf"(i8* %".128", i32 %".131")
  store i32 104, i32* %".4", align 4
  ; a = 1 + 3 + 5 * 62 / 3
  %".135" = load i32, i32* %".4", align 4
  ; printf "%d" a
  %".137" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".138" = alloca i32
  store i32 %".135", i32* %".138"
  %".140" = load i32, i32* %".138"
  %".141" = call i32 (i8*, ...) @"printf"(i8* %".137", i32 %".140")
  store i32 45, i32* %".4", align 4
  ; a = 5 * + 9
  %".144" = load i32, i32* %".4", align 4
  ; printf "%d" a
  %".146" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".147" = alloca i32
  store i32 %".144", i32* %".147"
  %".149" = load i32, i32* %".147"
  %".150" = call i32 (i8*, ...) @"printf"(i8* %".146", i32 %".149")
  store i32 -165, i32* %".4", align 4
  ; a = 33 * - 5
  %".153" = load i32, i32* %".4", align 4
  ; printf "%d" a
  %".155" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".156" = alloca i32
  store i32 %".153", i32* %".156"
  %".158" = load i32, i32* %".156"
  %".159" = call i32 (i8*, ...) @"printf"(i8* %".155", i32 %".158")
  store i32 -30, i32* %".4", align 4
  ;  a = - 6 * 5 + 32 / 6532
  %".162" = load i32, i32* %".4", align 4
  ; printf "%d" a
  %".164" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".165" = alloca i32
  store i32 %".162", i32* %".165"
  %".167" = load i32, i32* %".165"
  %".168" = call i32 (i8*, ...) @"printf"(i8* %".164", i32 %".167")
  store i32 0, i32* %".4", align 4
  ;  a = 1 >= 3
  %".171" = load i32, i32* %".4", align 4
  ; printf "%d" a
  %".173" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".174" = alloca i32
  store i32 %".171", i32* %".174"
  %".176" = load i32, i32* %".174"
  %".177" = call i32 (i8*, ...) @"printf"(i8* %".173", i32 %".176")
  store i32 1, i32* %".4", align 4
  ; a = 695 <= 44878
  %".180" = load i32, i32* %".4", align 4
  ; printf "%d" a
  %".182" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".183" = alloca i32
  store i32 %".180", i32* %".183"
  %".185" = load i32, i32* %".183"
  %".186" = call i32 (i8*, ...) @"printf"(i8* %".182", i32 %".185")
  store i32 1, i32* %".4", align 4
  ; a = 98333 != 6565911
  %".189" = load i32, i32* %".4", align 4
  ; printf "%d" a
  %".191" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".192" = alloca i32
  store i32 %".189", i32* %".192"
  %".194" = load i32, i32* %".192"
  %".195" = call i32 (i8*, ...) @"printf"(i8* %".191", i32 %".194")
  store i32 55, i32* %".4", align 4
  ; a = 55 % 963
  %".198" = load i32, i32* %".4", align 4
  ; printf "%d" a
  %".200" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".201" = alloca i32
  store i32 %".198", i32* %".201"
  %".203" = load i32, i32* %".201"
  %".204" = call i32 (i8*, ...) @"printf"(i8* %".200", i32 %".203")
  store i32 720, i32* %".4", align 4
  ;   a = 45 << 4
  %".207" = load i32, i32* %".4", align 4
  ; printf "%d" a
  %".209" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".210" = alloca i32
  store i32 %".207", i32* %".210"
  %".212" = load i32, i32* %".210"
  %".213" = call i32 (i8*, ...) @"printf"(i8* %".209", i32 %".212")
  store i32 -1, i32* %".4", align 4
  ; a = - 33 >> - 4
  %".216" = load i32, i32* %".4", align 4
  ; printf "%d" a
  %".218" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".219" = alloca i32
  store i32 %".216", i32* %".219"
  %".221" = load i32, i32* %".219"
  %".222" = call i32 (i8*, ...) @"printf"(i8* %".218", i32 %".221")
  store i32 1, i32* %".4", align 4
  ;  a = 1 & 8784573
  %".225" = load i32, i32* %".4", align 4
  ; printf "%d" a
  %".227" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".228" = alloca i32
  store i32 %".225", i32* %".228"
  %".230" = load i32, i32* %".228"
  %".231" = call i32 (i8*, ...) @"printf"(i8* %".227", i32 %".230")
  store i32 994, i32* %".4", align 4
  ; a = 898 | 98
  %".234" = load i32, i32* %".4", align 4
  ; printf "%d" a
  %".236" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".237" = alloca i32
  store i32 %".234", i32* %".237"
  %".239" = load i32, i32* %".237"
  %".240" = call i32 (i8*, ...) @"printf"(i8* %".236", i32 %".239")
  store i32 0, i32* %".4", align 4
  ; a = ! - 97435345
  %".243" = load i32, i32* %".4", align 4
  ; printf "%d" a
  %".245" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".246" = alloca i32
  store i32 %".243", i32* %".246"
  %".248" = load i32, i32* %".246"
  %".249" = call i32 (i8*, ...) @"printf"(i8* %".245", i32 %".248")
  store i32 -314, i32* %".4", align 4
  ; a = 9787 ^ - 9987
  %".252" = load i32, i32* %".4", align 4
  ; printf "%d" a
  %".254" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".255" = alloca i32
  store i32 %".252", i32* %".255"
  %".257" = load i32, i32* %".255"
  %".258" = call i32 (i8*, ...) @"printf"(i8* %".254", i32 %".257")
  ret i32 0
  ;    return 0
}

declare i32 @"printf"(i8* %".1", ...)

@".str.PS0" = internal constant [3 x i8] c"%d\00"
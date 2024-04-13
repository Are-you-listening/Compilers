; ModuleID = "tests/test5.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;  #include <stdio.h>  INT main
  %".4" = alloca float, align 4
  store float 0x402e333340000000, float* %".4", align 4
  ; FLOAT a = 15.1
  %".7" = alloca i32, align 4
  store i32 104, i32* %".7", align 4
  ; INT b = '0' - 'd' - 'd'
  %".10" = alloca float, align 4
  store float 0x4096e2ccc0000000, float* %".10", align 4
  ; FLOAT c = 15.1 * 'a'
  %".13" = alloca i8, align 1
  store i8 55, i8* %".13", align 1
  ; CHAR d = 50.1 + 5
  %".16" = alloca i8, align 1
  store i8 1, i8* %".16", align 1
  ; CHAR e = 'e' / 'a'
  %".19" = alloca i8, align 1
  store i8 64, i8* %".19", align 1
  ; CHAR f1 = 45435 + 77.02262 + 'x' + 0.0 * 8
  %".22" = alloca i32, align 4
  store i32 3, i32* %".22", align 4
  ; INT f = 15 % 4
  %".25" = alloca i32, align 4
  store i32 16, i32* %".25", align 4
  ; INT g = 2 << 3
  %".28" = alloca i32, align 4
  store i32 4, i32* %".28", align 4
  ; INT h = 16 >> 2
  %".31" = alloca i32, align 4
  store i32 1, i32* %".31", align 4
  ; INT i = 5 & 3
  %".34" = alloca i32, align 4
  store i32 7, i32* %".34", align 4
  ; INT j = 5 | 3
  %".37" = alloca i32, align 4
  store i32 -6, i32* %".37", align 4
  ; INT k = ~ 5
  %".40" = alloca i32, align 4
  store i32 6, i32* %".40", align 4
  ; INT l = 5 ^ 3
  %".43" = alloca i32, align 4
  store i32 0, i32* %".43", align 4
  ; INT m = 7 && 0
  %".46" = alloca i32, align 4
  store i32 1, i32* %".46", align 4
  ; INT n = 5 || 0
  %".49" = alloca i32, align 4
  store i32 0, i32* %".49", align 4
  ; INT o = ! 1
  %".52" = alloca float, align 4
  store float 0x402c800000000000, float* %".52", align 4
  ; FLOAT p = 10.5 + 3.75
  %".55" = alloca float, align 4
  store float 0x403f333340000000, float* %".55", align 4
  ; FLOAT q = 15.6 * 2.0
  %".58" = alloca float, align 4
  store float 0x4014000000000000, float* %".58", align 4
  ; FLOAT r = 20.0 / 4.0
  %".61" = alloca float, align 4
  store float 0x408f400000000000, float* %".61", align 4
  ; FLOAT x = 555.0 + 445
  %".64" = alloca i32, align 4
  store i32 65, i32* %".64", align 4
  ; INT aa = 10 + 3 * 7 - 2
  %".67" = alloca i32, align 4
  store i32 1, i32* %".67", align 4
  ; INT ba = 100 / 4 % 3
  %".70" = alloca i32, align 4
  store i32 24, i32* %".70", align 4
  ; INT ca = 5 << 2 + 8 >> 1
  %".73" = alloca i32, align 4
  store i32 -6, i32* %".73", align 4
  ; INT da = ~ ~ 10 & 7
  %".76" = alloca i32, align 4
  store i32 13, i32* %".76", align 4
  ; INT ea = 15 | 3 ^ 7 & 2
  %".79" = alloca i32, align 4
  store i32 1, i32* %".79", align 4
  ; INT fa = 20 > 10 && 5 <= 7
  %".82" = alloca i32, align 4
  store i32 1, i32* %".82", align 4
  ; INT ga = 10 == 5 || 7 != 3
  %".85" = alloca i32, align 4
  store i32 1, i32* %".85", align 4
  ; INT ha = ! 10 >= 20
  %".88" = alloca float, align 4
  store float 0x4006000000000000, float* %".88", align 4
  ; FLOAT ja = 5.5 * 2.0 / 3.0 + 1.0
  %".91" = alloca float, align 4
  store float 0x4024000000000000, float* %".91", align 4
  ; FLOAT ka = 7.0 + 3.0 * 2.5 - 1.5
  %".94" = alloca i32, align 4
  store i32 15, i32* %".94", align 4
  ; INT ab = 15
  %".97" = alloca i32, align 4
  store i32 1, i32* %".97", align 4
  ; INT xb = a + 50 || 0 + 1
  %".100" = alloca i32, align 4
  store i32 0, i32* %".100", align 4
  ; INT bb = a + x && 5 - 5
  %".103" = alloca i32, align 4
  store i32 1, i32* %".103", align 4
  ; INT cb = 1 && a + x
  %".106" = alloca i32, align 4
  store i32 1, i32* %".106", align 4
  ; INT db = 0 || c / 80
  ret i32 0
  ;  return 0
}

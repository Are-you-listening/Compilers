; ModuleID = "tests/test5.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca float, align 4
  store float 0x402e333340000000, float* %".3", align 4
  ; FLOAT a = 15.1
  %".6" = alloca i32, align 4
  store i32 104, i32* %".6", align 4
  ; INT b = '0' - 'd' - 'd'
  %".9" = alloca float, align 4
  store float 0x4096e2ccc0000000, float* %".9", align 4
  ; FLOAT c = 15.1 * 'a'
  %".12" = alloca i8, align 1
  store i8 55, i8* %".12", align 1
  ; CHAR d = 50.1 + 5
  %".15" = alloca i8, align 1
  store i8 1, i8* %".15", align 1
  ; CHAR e = 'e' / 'a'
  %".18" = alloca i8, align 1
  store i8 64, i8* %".18", align 1
  ; CHAR f1 = 45435 + 77.02262 + 'x' + 0.0 * 8
  %".21" = alloca i32, align 4
  store i32 3, i32* %".21", align 4
  ; INT f = 15 % 4
  %".24" = alloca i32, align 4
  store i32 16, i32* %".24", align 4
  ; INT g = 2 << 3
  %".27" = alloca i32, align 4
  store i32 4, i32* %".27", align 4
  ; INT h = 16 >> 2
  %".30" = alloca i32, align 4
  store i32 1, i32* %".30", align 4
  ; INT i = 5 & 3
  %".33" = alloca i32, align 4
  store i32 7, i32* %".33", align 4
  ; INT j = 5 | 3
  %".36" = alloca i32, align 4
  store i32 -6, i32* %".36", align 4
  ; INT k = ~ 5
  %".39" = alloca i32, align 4
  store i32 6, i32* %".39", align 4
  ; INT l = 5 ^ 3
  %".42" = alloca i32, align 4
  store i32 0, i32* %".42", align 4
  ; INT m = 7 && 0
  %".45" = alloca i32, align 4
  store i32 1, i32* %".45", align 4
  ; INT n = 5 || 0
  %".48" = alloca i32, align 4
  store i32 0, i32* %".48", align 4
  ; INT o = ! 1
  %".51" = alloca float, align 4
  store float 0x402c800000000000, float* %".51", align 4
  ; FLOAT p = 10.5 + 3.75
  %".54" = alloca float, align 4
  store float 0x403f333340000000, float* %".54", align 4
  ; FLOAT q = 15.6 * 2.0
  %".57" = alloca float, align 4
  store float 0x4014000000000000, float* %".57", align 4
  ; FLOAT r = 20.0 / 4.0
  %".60" = alloca float, align 4
  store float 0x408f400000000000, float* %".60", align 4
  ; FLOAT x = 555.0 + 445
  %".63" = alloca i32, align 4
  store i32 65, i32* %".63", align 4
  ; INT aa = 10 + 3 * 7 - 2
  %".66" = alloca i32, align 4
  store i32 1, i32* %".66", align 4
  ; INT ba = 100 / 4 % 3
  %".69" = alloca i32, align 4
  store i32 24, i32* %".69", align 4
  ; INT ca = 5 << 2 + 8 >> 1
  %".72" = alloca i32, align 4
  store i32 -6, i32* %".72", align 4
  ; INT da = ~ ~ 10 & 7
  %".75" = alloca i32, align 4
  store i32 13, i32* %".75", align 4
  ; INT ea = 15 | 3 ^ 7 & 2
  %".78" = alloca i32, align 4
  store i32 1, i32* %".78", align 4
  ; INT fa = 20 > 10 && 5 <= 7
  %".81" = alloca i32, align 4
  store i32 1, i32* %".81", align 4
  ; INT ga = 10 == 5 || 7 != 3
  %".84" = alloca i32, align 4
  store i32 1, i32* %".84", align 4
  ; INT ha = ! 10 >= 20
  %".87" = alloca float, align 4
  store float 0x4006000000000000, float* %".87", align 4
  ; FLOAT ja = 5.5 * 2.0 / 3.0 + 1.0
  %".90" = alloca float, align 4
  store float 0x4024000000000000, float* %".90", align 4
  ; FLOAT ka = 7.0 + 3.0 * 2.5 - 1.5
  %".93" = alloca i32, align 4
  store i32 15, i32* %".93", align 4
  ; INT ab = 15
  %".96" = alloca i32, align 4
  store i32 1, i32* %".96", align 4
  ; INT xb = a + 50 || 0 + 1
  %".99" = alloca i32, align 4
  store i32 0, i32* %".99", align 4
  ; INT bb = a + x && 5 - 5
  %".102" = alloca i32, align 4
  store i32 1, i32* %".102", align 4
  ; INT cb = 1 && a + x
  %".105" = alloca i32, align 4
  store i32 1, i32* %".105", align 4
  ; INT db = 0 || c / 80
  ret i32 0
  ; INT main
  ; #include <stdio.h>
}

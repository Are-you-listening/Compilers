; ModuleID = "tests/test17.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;     INT main
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
  %".22" = alloca i32, align 4
  store i32 0, i32* %".22", align 4
  ; INT g = 0
  %".25" = alloca i32, align 4
  store i32 0, i32* %".25", align 4
  ; INT h = 0
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
  ;  f = ! a || e && d && 5 < 6
  %".39" = load i32, i32* %".4", align 4
  %".40" = icmp ne i32 %".39", 0
.41:
  %".42" = load i32, i32* %".16", align 4
  %".43" = icmp ne i32 %".42", 0
.44:
  %".45" = load i32, i32* %".13", align 4
  %".46" = icmp ne i32 %".45", 0
  %".47" = icmp ne i1 %".46", 0
.48:
  %".49" = phi  i1 [1, %".2"], [0, %".41"], [%".47", %".44"]
  %".50" = icmp ne i1 %".49", 0
  %".51" = xor i1 %".50", 1
}

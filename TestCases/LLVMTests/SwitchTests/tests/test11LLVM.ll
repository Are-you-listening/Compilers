; ModuleID = "tests/test11.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;  #include <stdio.h>  INT main
  %".4" = alloca i32, align 4
  store i32 0, i32* %".4", align 4
  ;  INT a = 0
  %".7" = alloca i32, align 4
  store i32 0, i32* %".7", align 4
  ; INT b = 0
  %".10" = alloca i32, align 4
  store i32 0, i32* %".10", align 4
  ; INT c = 0
  store i32 0, i32* %".4", align 4
  ; a = 0
  %".15" = load i32, i32* %".4", align 4
  ;  switch a
  %".17" = icmp eq i32 %".15", 0
  br i1 %".17", label %".24", label %".18"
.18:
  %".19" = load i32, i32* %".4", align 4
  %".20" = icmp eq i32 %".19", 1
  br i1 %".20", label %".24", label %".21"
.21:
  %".22" = load i32, i32* %".4", align 4
  %".23" = icmp eq i32 %".22", 6
  br label %".24"
.24:
  ;  case 0 case 1
  %".26" = phi  i1 [1, %".18"], [1, %".2"], [%".23", %".21"]
  br i1 %".26", label %".27", label %".62"
.27:
  %".28" = load i32, i32* %".4", align 4
  %".29" = icmp eq i32 %".28", 0
  br i1 %".29", label %".33", label %".30"
.30:
  %".31" = load i32, i32* %".4", align 4
  %".32" = icmp eq i32 %".31", 1
  br label %".33"
.33:
  %".34" = phi  i1 [1, %".27"], [%".32", %".30"]
  br i1 %".34", label %".35", label %".53"
.35:
  %".36" = load i32, i32* %".4", align 4
  %".37" = icmp eq i32 %".36", 0
  br i1 %".37", label %".38", label %".39"
.38:
  br label %".39"
.39:
  store i32 1, i32* %".7", align 4
  ; b = 1
  %".42" = bitcast [3 x i8]* @".str.d" to i8*
  %".43" = alloca i32
  store i32 1, i32* %".43"
  %".45" = load i32, i32* %".43"
  %".46" = call i32 (i8*, ...) @"printf"(i8* %".42", i32 %".45")
  ; printf "%d" 1
  br label %".48"
.48:
  ; while 1
  br label %".50"
.50:
  ; break
  br label %".52"
.52:
  br label %".53"
.53:
  store i32 6, i32* %".7", align 4
  ;   case 6 b = 6
  %".56" = bitcast [3 x i8]* @".str.d" to i8*
  %".57" = alloca i32
  store i32 6, i32* %".57"
  %".59" = load i32, i32* %".57"
  %".60" = call i32 (i8*, ...) @"printf"(i8* %".56", i32 %".59")
  ; printf "%d" 6
  br label %".62"
.62:
  %".63" = load i32, i32* %".4", align 4
  %".64" = icmp eq i32 %".63", 2
  br i1 %".64", label %".65", label %".74"
.65:
  ; break case 2 b = 2
  store i32 2, i32* %".7", align 4
  %".68" = bitcast [3 x i8]* @".str.d" to i8*
  %".69" = alloca i32
  store i32 2, i32* %".69"
  %".71" = load i32, i32* %".69"
  %".72" = call i32 (i8*, ...) @"printf"(i8* %".68", i32 %".71")
  ; printf "%d" 2
  br label %".74"
.74:
  %".75" = load i32, i32* %".4", align 4
  %".76" = icmp ne i32 %".75", 0
  br i1 %".76", label %".77", label %".86"
.77:
  %".78" = load i32, i32* %".4", align 4
  %".79" = icmp ne i32 %".78", 1
  br i1 %".79", label %".80", label %".86"
.80:
  %".81" = load i32, i32* %".4", align 4
  %".82" = icmp ne i32 %".81", 6
  br i1 %".82", label %".83", label %".86"
.83:
  %".84" = load i32, i32* %".4", align 4
  %".85" = icmp ne i32 %".84", 2
  br label %".86"
.86:
  ; break default b = 3
  %".88" = phi  i1 [0, %".74"], [0, %".77"], [0, %".80"], [%".85", %".83"]
  br i1 %".88", label %".89", label %".97"
.89:
  store i32 3, i32* %".7", align 4
  %".91" = bitcast [3 x i8]* @".str.d" to i8*
  %".92" = alloca i32
  store i32 3, i32* %".92"
  %".94" = load i32, i32* %".92"
  %".95" = call i32 (i8*, ...) @"printf"(i8* %".91", i32 %".94")
  ; printf "%d" 3
  br label %".97"
.97:
  %".98" = bitcast [3 x i8]* @".str.d" to i8*
  %".99" = alloca i32
  store i32 4, i32* %".99"
  %".101" = load i32, i32* %".99"
  %".102" = call i32 (i8*, ...) @"printf"(i8* %".98", i32 %".101")
  ; break    printf "%d" 4
  ret i32 0
  ;  return 0
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"
; ModuleID = "tests/test35.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 10, i32* %".3", align 4
  ;     INT main ( ) { INT x = 10 ;
  %".6" = alloca i32*, align 8
  store i32* %".3", i32** %".6", align 8
  ; INT * xp = & x ;
  %".9" = alloca i32**, align 8
  store i32** %".6", i32*** %".9", align 8
  ; INT * * xpp = & xp ;
  %".12" = load i32, i32* %".3", align 4
  ; printf ( "%d; %d; %d" , x , * xp , * * xpp ) ;
  %".14" = load i32*, i32** %".6", align 8
  %".15" = load i32, i32* %".14", align 8
  %".16" = load i32**, i32*** %".9", align 8
  %".17" = load i32*, i32** %".16", align 8
  %".18" = load i32, i32* %".17", align 8
  %".19" = bitcast [11 x i8]* @".str.0" to i8*
  %".20" = alloca i32
  %".21" = alloca i32
  %".22" = alloca i32
  store i32 %".12", i32* %".20"
  store i32 %".15", i32* %".21"
  store i32 %".18", i32* %".22"
  %".26" = load i32, i32* %".20"
  %".27" = load i32, i32* %".21"
  %".28" = load i32, i32* %".22"
  %".29" = call i32 (i8*, ...) @"printf"(i8* %".19", i32 %".26", i32 %".27", i32 %".28")
  ret i32 0
  ; return 0 ;
}

@".str.0" = internal constant [11 x i8] c"%d; %d; %d\00"
declare i32 @"printf"(i8* %".1", ...)

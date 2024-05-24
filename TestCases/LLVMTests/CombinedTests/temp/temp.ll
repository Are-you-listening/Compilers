; ModuleID = "tests/test14.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define void @"reverseCount"(i32 %".1")
{
.3:
  %".4" = alloca i32
  %".5" = alloca i32
  store i32 %".1", i32* %".5"
  %".7" = alloca i32, align 4
  store i32 10, i32* %".7", align 4
  ; }   VOID reverseCount ( INT toSkip )  { INT i = 10 ;
  br label %".10"
.10:
  ; while ( i >= 1 )
  %".12" = load i32, i32* %".7", align 4
  %".13" = icmp sge i32 %".12", 1
  br i1 %".13", label %".14", label %".32"
.14:
  %".15" = load i32, i32* %".7", align 4
  ; { if ( i != toSkip )
  %".17" = load i32, i32* %".5"
  %".18" = icmp ne i32 %".15", %".17"
  br i1 %".18", label %".19", label %".27"
.19:
  %".20" = load i32, i32* %".7", align 4
  ; { printf ( "%d\n" , i ) ;
  %".22" = bitcast [4 x i8]* @".str.0" to i8*
  %".23" = alloca i32
  store i32 %".20", i32* %".23"
  %".25" = load i32, i32* %".23"
  %".26" = call i32 (i8*, ...) @"printf"(i8* %".22", i32 %".25")
  br label %".27"
.27:
  %".28" = load i32, i32* %".7", align 4
  ; } i -- ;
  %".30" = sub i32 %".28", 1
  store i32 %".30", i32* %".7", align 4
  br label %".10"
.32:
  ret void
}

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 8, i32* %".3", align 4
  ;    VOID reverseCount ( INT skip ) ;   INT main ( ) { INT toSkip = 8 ;
  %".6" = load i32, i32* %".3", align 4
  ; reverseCount ( toSkip ) ;
  call void @"reverseCount"(i32 %".6")
  store i32 3, i32* %".3", align 4
  ; toSkip = 3 ;
  %".11" = load i32, i32* %".3", align 4
  ; reverseCount ( toSkip ) ;
  call void @"reverseCount"(i32 %".11")
  ret i32 0
  ; return 0 ;
}

@".str.0" = internal constant [4 x i8] c"%d\0a\00"
declare i32 @"printf"(i8* %".1", ...)

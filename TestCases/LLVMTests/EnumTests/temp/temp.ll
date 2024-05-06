; ModuleID = "tests/test10.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  ;      INT x = 1 ;  enum week { Mon , Tue , Wed , Thur , Fri , Sat , Sun } ;  struct Schedule { enum week * day_ptr ; } ;   INT main ( ) { enum week day ;
  %".5" = alloca {i32*}, align 8
  ;  struct Schedule scheduler ;
  %".7" = getelementptr inbounds {i32*}, {i32*}* %".5", i32 0, i32 0
  ;  scheduler . day_ptr = & day ;
  store i32* %".3", i32** %".7", align 4
  %".10" = getelementptr inbounds {i32*}, {i32*}* %".5", i32 0, i32 0
  ;  scheduler . day_ptr = Wed ;
  %".12" = load i32, i32* @"Wed", align 4
  %".13" = inttoptr i32 %".12" to i32*
  store i32* %".13", i32** %".10", align 4
  %".15" = getelementptr inbounds {i32*}, {i32*}* %".5", i32 0, i32 0
  ; printf ( "%d" , scheduler . day_ptr ) ;
  %".17" = load i32*, i32** %".15", align 4
  %".18" = bitcast [3 x i8]* @".str.0" to i8*
  %".19" = alloca i32*
  store i32* %".17", i32** %".19"
  %".21" = load i32*, i32** %".19"
  %".22" = call i32 (i8*, ...) @"printf"(i8* %".18", i32* %".21")
  %".23" = load i32, i32* %".3", align 4
  ;   if ( day == Wed ) {
  %".25" = load i32, i32* @"Wed", align 4
  %".26" = icmp eq i32 %".23", %".25"
  br i1 %".26", label %".27", label %".33"
.27:
  %".28" = getelementptr inbounds {i32*}, {i32*}* %".5", i32 0, i32 0
  ; scheduler . day_ptr = Thur ;
  %".30" = load i32, i32* @"Thur", align 4
  %".31" = inttoptr i32 %".30" to i32*
  store i32* %".31", i32** %".28", align 4
  br label %".33"
.33:
  %".34" = getelementptr inbounds {i32*}, {i32*}* %".5", i32 0, i32 0
  ; }  printf ( "%d" , scheduler . day_ptr ) ;
  %".36" = load i32*, i32** %".34", align 4
  %".37" = bitcast [3 x i8]* @".str.0" to i8*
  %".38" = alloca i32*
  store i32* %".36", i32** %".38"
  %".40" = load i32*, i32** %".38"
  %".41" = call i32 (i8*, ...) @"printf"(i8* %".37", i32* %".40")
  ret i32 0
  ;  return 0 ;
}

@"x" = global i32 1, align 4
@"Sun" = global i32 6, align 4
@"Sat" = global i32 5, align 4
@"Fri" = global i32 4, align 4
@"Thur" = global i32 3, align 4
@"Wed" = global i32 2, align 4
@"Tue" = global i32 1, align 4
@"Mon" = global i32 0, align 4
@".str.0" = internal constant [3 x i8] c"%d\00"
declare i32 @"printf"(i8* %".1", ...)

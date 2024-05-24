; ModuleID = "tests/test10.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

%"Schedule" = type {i32*}
define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  ;      INT x = 1 ;  enum week { Mon , Tue , Wed , Thur , Fri , Sat , Sun } ;  struct Schedule { enum week * day_ptr ; } ;   INT main ( ) { enum week day ;
  %".5" = alloca %"Schedule", align 8
  ;  struct Schedule scheduler ;
  %".7" = getelementptr inbounds %"Schedule", %"Schedule"* %".5", i32 0, i32 0
  ;  scheduler . day_ptr = & day ;
  store i32* %".3", i32** %".7", align 4
  %".10" = getelementptr inbounds %"Schedule", %"Schedule"* %".5", i32 0, i32 0
  ;  scheduler . day_ptr = Wed ;
  %".12" = inttoptr i32 2 to i32*
  store i32* %".12", i32** %".10", align 4
  %".14" = getelementptr inbounds %"Schedule", %"Schedule"* %".5", i32 0, i32 0
  ; printf ( "%d" , scheduler . day_ptr ) ;
  %".16" = load i32*, i32** %".14", align 4
  %".17" = bitcast [3 x i8]* @".str.0" to i8*
  %".18" = alloca i32*
  store i32* %".16", i32** %".18"
  %".20" = load i32*, i32** %".18"
  %".21" = call i32 (i8*, ...) @"printf"(i8* %".17", i32* %".20")
  %".22" = load i32, i32* %".3", align 4
  ;   if ( day == Wed ) {
  %".24" = load i32, i32* @"Wed", align 4
  %".25" = icmp eq i32 %".22", %".24"
  br i1 %".25", label %".26", label %".31"
.26:
  %".27" = getelementptr inbounds %"Schedule", %"Schedule"* %".5", i32 0, i32 0
  ; scheduler . day_ptr = Thur ;
  %".29" = inttoptr i32 3 to i32*
  store i32* %".29", i32** %".27", align 4
  br label %".31"
.31:
  %".32" = getelementptr inbounds %"Schedule", %"Schedule"* %".5", i32 0, i32 0
  ; }  printf ( "%d" , scheduler . day_ptr ) ;
  %".34" = load i32*, i32** %".32", align 4
  %".35" = bitcast [3 x i8]* @".str.0" to i8*
  %".36" = alloca i32*
  store i32* %".34", i32** %".36"
  %".38" = load i32*, i32** %".36"
  %".39" = call i32 (i8*, ...) @"printf"(i8* %".35", i32* %".38")
  ret i32 0
  ;  return 0 ;
}

@"Wed" = global i32 2, align 4
@".str.0" = internal constant [3 x i8] c"%d\00"
declare i32 @"printf"(i8* %".1", ...)

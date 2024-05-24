; ModuleID = "tests/test6.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

%"0_IO_FILE" = type {i8*, i8*}
define i32 @"main"()
{
.2:
  %".3" = alloca [5 x i8], align 8
  ;    INT main ( ) {  CHAR buffer [ 5 ] ;
  ;    FILE * fp = fopen ( "files/test1.txt" , "r" ) ;
  %".6" = bitcast [16 x i8]* @".str.0" to i8*
  %".7" = bitcast [2 x i8]* @".str.1" to i8*
  %".8" = call %"0_IO_FILE"* @"fopen"(i8* %".6", i8* %".7")
  %".9" = alloca %"0_IO_FILE"*, align 8
  store %"0_IO_FILE"* %".8", %"0_IO_FILE"** %".9", align 8
  %".11" = getelementptr inbounds [5 x i8], [5 x i8]* %".3", i32 0, i32 0
  ;  fgets ( buffer , 5 , fp ) ;
  %".13" = load %"0_IO_FILE"*, %"0_IO_FILE"** %".9", align 8
  %".14" = call i8* @"fgets"(i8* %".11", i32 5, %"0_IO_FILE"* %".13")
  %".15" = getelementptr inbounds [5 x i8], [5 x i8]* %".3", i32 0, i32 0
  ;  printf ( "%s" , buffer ) ;
  %".17" = bitcast [3 x i8]* @".str.2" to i8*
  %".18" = alloca i8*
  store i8* %".15", i8** %".18"
  %".20" = load i8*, i8** %".18"
  %".21" = call i32 (i8*, ...) @"printf"(i8* %".17", i8* %".20")
  ;  INT length = buffer [ 0 ] ;
  %".23" = getelementptr inbounds [5 x i8], [5 x i8]* %".3", i64 0, i32 0
  %".24" = load i8, i8* %".23", align 4
  %".25" = sext i8 %".24" to i32
  %".26" = alloca i32, align 4
  store i32 %".25", i32* %".26", align 4
  %".28" = load i32, i32* %".26", align 4
  ;  printf ( "%d" , length ) ;
  %".30" = bitcast [3 x i8]* @".str.3" to i8*
  %".31" = alloca i32
  store i32 %".28", i32* %".31"
  %".33" = load i32, i32* %".31"
  %".34" = call i32 (i8*, ...) @"printf"(i8* %".30", i32 %".33")
  %".35" = load i32, i32* %".26", align 4
  ;     CHAR * c = malloc ( length ) ;
  ; /*    let length depend on first    */
  %".38" = call i8* @"malloc"(i32 %".35")
  %".39" = alloca i8*, align 8
  store i8* %".38", i8** %".39", align 8
  %".41" = load i8*, i8** %".39", align 8
  ; fgets ( c , length , fp ) ;
  %".43" = load i32, i32* %".26", align 4
  %".44" = load %"0_IO_FILE"*, %"0_IO_FILE"** %".9", align 8
  %".45" = call i8* @"fgets"(i8* %".41", i32 %".43", %"0_IO_FILE"* %".44")
  %".46" = load i8*, i8** %".39", align 8
  ;  printf ( "%s" , c ) ;
  %".48" = bitcast [3 x i8]* @".str.2" to i8*
  %".49" = alloca i8*
  store i8* %".46", i8** %".49"
  %".51" = load i8*, i8** %".49"
  %".52" = call i32 (i8*, ...) @"printf"(i8* %".48", i8* %".51")
  ret i32 0
  ;  return 0 ;
}

declare %"0_IO_FILE"* @"fopen"(i8* %".1", i8* %".2")

@".str.0" = internal constant [16 x i8] c"files/test1.txt\00"
@".str.1" = internal constant [2 x i8] c"r\00"
declare i8* @"fgets"(i8* %".1", i32 %".2", %"0_IO_FILE"* %".3")

@".str.2" = internal constant [3 x i8] c"%s\00"
declare i32 @"printf"(i8* %".1", ...)

@".str.3" = internal constant [3 x i8] c"%d\00"
declare i8* @"malloc"(i32 %".1")

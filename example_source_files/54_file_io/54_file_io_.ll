; ModuleID = "/home/tibov/Desktop/universiteit/bachlor-2/Compilers/Project/Compilers/example_source_files/54_file_io/54_file_io.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

%"_IO_FILE" = type opaque
define i32 @"main"()
{
.2:
  ;    INT main ( ) { CHAR * buf = calloc ( 50 , sizeof ( CHAR ) ) ;
  %".4" = call i8* @"calloc"(i32 50, i32 1)
  %".5" = alloca i8*, align 8
  store i8* %".4", i8** %".5", align 8
  ;  FILE * fp = fopen ( "../includes/io.txt" , "r" ) ;
  %".8" = bitcast [19 x i8]* @".str.0" to i8*
  %".9" = bitcast [2 x i8]* @".str.1" to i8*
  %".10" = call %"_IO_FILE"* @"fopen"(i8* %".8", i8* %".9")
  %".11" = alloca %"_IO_FILE"*, align 8
  store %"_IO_FILE"* %".10", %"_IO_FILE"** %".11", align 8
  %".13" = load i8*, i8** %".5", align 8
  ;  fgets ( buf , 50 , fp ) ;
  %".15" = load %"_IO_FILE"*, %"_IO_FILE"** %".11", align 8
  %".16" = call i8* @"fgets"(i8* %".13", i32 50, %"_IO_FILE"* %".15")
  ;  fp = fopen ( "../includes/io.txt" , "w" ) ;
  %".18" = bitcast [19 x i8]* @".str.0" to i8*
  %".19" = bitcast [2 x i8]* @".str.2" to i8*
  %".20" = call %"_IO_FILE"* @"fopen"(i8* %".18", i8* %".19")
  store %"_IO_FILE"* %".20", %"_IO_FILE"** %".11", align 8
  %".22" = load i8*, i8** %".5", align 8
  ;  fputs ( buf , fp ) ;
  %".24" = load %"_IO_FILE"*, %"_IO_FILE"** %".11", align 8
  %".25" = call i8 @"fputs"(i8* %".22", %"_IO_FILE"* %".24")
  %".26" = load %"_IO_FILE"*, %"_IO_FILE"** %".11", align 8
  ;  fclose ( fp ) ;
  call void @"fclose"(%"_IO_FILE"* %".26")
  ret i32 0
  ;  return 0 ;
}

declare i8* @"calloc"(i32 %".1", i32 %".2")

declare %"_IO_FILE"* @"fopen"(i8* %".1", i8* %".2")

@".str.0" = internal constant [19 x i8] c"../includes/io.txt\00"
@".str.1" = internal constant [2 x i8] c"r\00"
declare i8* @"fgets"(i8* %".1", i32 %".2", %"_IO_FILE"* %".3")

@".str.2" = internal constant [2 x i8] c"w\00"
declare i8 @"fputs"(i8* %".1", %"_IO_FILE"* %".2")

declare void @"fclose"(%"_IO_FILE"* %".1")

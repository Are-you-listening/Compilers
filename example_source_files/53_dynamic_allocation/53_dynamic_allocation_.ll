; ModuleID = "/home/watson/OneDrive/2023-2024/Compilers/Project/Compilers/example_source_files/53_dynamic_allocation/53_dynamic_allocation.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca {i32}, align 4
  ;  struct cheese { INT milk ; } ;  INT main ( ) { struct cheese gouda ;
  %".5" = getelementptr inbounds {i32}, {i32}* %".3", i32 0, i32 0
  ; gouda . milk = 3 ;
  store i32 3, i32* %".5", align 4
  ;  struct cheese * gouda_ptr = ( struct cheese * ) malloc ( sizeof ( struct cheese ) ) ;
  %".9" = call i8* @"malloc"(i32 4)
  %".10" = bitcast i8* %".9" to {i32}*
  %".11" = alloca {i32}*, align 8
  store {i32}* %".10", {i32}** %".11", align 8
  ;  gouda_ptr = realloc ( gouda_ptr , sizeof ( struct cheese ) * 2 ) ;
  %".14" = load {i32}*, {i32}** %".11", align 8
  %".15" = bitcast {i32}* %".14" to i8*
  %".16" = call i8* @"realloc"(i8* %".15", i32 8)
  %".17" = bitcast i8* %".16" to {i32}*
  store {i32}* %".17", {i32}** %".11", align 8
  ;  free ( gouda_ptr ) ;
  %".20" = load {i32}*, {i32}** %".11", align 8
  %".21" = bitcast {i32}* %".20" to i8*
  call void @"free"(i8* %".21")
  ;  CHAR * z = calloc ( 2 , sizeof ( CHAR ) ) ;
  %".24" = call i8* @"calloc"(i32 2, i32 1)
  %".25" = alloca i8*, align 8
  store i8* %".24", i8** %".25", align 8
  %".27" = load i8*, i8** %".25"
  %".28" = getelementptr inbounds i8, i8* %".27", i32 0
  ; z [ 0 ] = 'O' ;
  store i8 79, i8* %".28", align 4
  %".31" = load i8*, i8** %".25"
  %".32" = getelementptr inbounds i8, i8* %".31", i32 1
  ; z [ 1 ] = 'Y' ;
  store i8 89, i8* %".32", align 4
  %".35" = load i8*, i8** %".25", align 8
  ;  free ( z ) ;
  call void @"free"(i8* %".35")
  ret i32 0
  ;  return 0 ;
}

declare i8* @"malloc"(i32 %".1")

declare i8* @"realloc"(i8* %".1", i32 %".2")

declare void @"free"(i8* %".1")

declare i8* @"calloc"(i32 %".1", i32 %".2")
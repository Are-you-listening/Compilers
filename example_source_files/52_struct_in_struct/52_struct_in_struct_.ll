; ModuleID = "/home/watson/OneDrive/2023-2024/Compilers/Project/Compilers/example_source_files/52_struct_in_struct/52_struct_in_struct.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

%"water" = type {i32}
%"bottle" = type {%"water", %"water", %"water"}
define i32 @"main"()
{
.2:
  %".3" = alloca %"water", align 4
  ;    struct water { INT has_nemo ; } ;  struct bottle { struct water perier ; struct water spa ; struct water sea ; } ;  INT main ( ) { struct water perier ;
  %".5" = getelementptr inbounds %"water", %"water"* %".3", i32 0, i32 0
  ; perier . has_nemo = 0 ;
  store i32 0, i32* %".5", align 4
  %".8" = alloca %"water", align 4
  ; struct water spa ;
  %".10" = getelementptr inbounds %"water", %"water"* %".8", i32 0, i32 0
  ; spa . has_nemo = 0 ;
  store i32 0, i32* %".10", align 4
  %".13" = alloca %"water", align 4
  ; struct water sea ;
  %".15" = getelementptr inbounds %"water", %"water"* %".13", i32 0, i32 0
  ; sea . has_nemo = 1 ;
  store i32 1, i32* %".15", align 4
  %".18" = getelementptr inbounds %"water", %"water"* %".3", i32 0, i32 0
  ;  printf ( "%d" , perier . has_nemo ) ;
  %".20" = load i32, i32* %".18", align 4
  %".21" = bitcast [3 x i8]* @".str.0" to i8*
  %".22" = alloca i32
  store i32 %".20", i32* %".22"
  %".24" = load i32, i32* %".22"
  %".25" = call i32 (i8*, ...) @"printf"(i8* %".21", i32 %".24")
  %".26" = getelementptr inbounds %"water", %"water"* %".8", i32 0, i32 0
  ; printf ( "%d" , spa . has_nemo ) ;
  %".28" = load i32, i32* %".26", align 4
  %".29" = bitcast [3 x i8]* @".str.0" to i8*
  %".30" = alloca i32
  store i32 %".28", i32* %".30"
  %".32" = load i32, i32* %".30"
  %".33" = call i32 (i8*, ...) @"printf"(i8* %".29", i32 %".32")
  %".34" = getelementptr inbounds %"water", %"water"* %".13", i32 0, i32 0
  ; printf ( "%d" , sea . has_nemo ) ;
  %".36" = load i32, i32* %".34", align 4
  %".37" = bitcast [3 x i8]* @".str.0" to i8*
  %".38" = alloca i32
  store i32 %".36", i32* %".38"
  %".40" = load i32, i32* %".38"
  %".41" = call i32 (i8*, ...) @"printf"(i8* %".37", i32 %".40")
  %".42" = alloca %"bottle", align 16
  ;  struct bottle boo ;
  %".44" = getelementptr inbounds %"bottle", %"bottle"* %".42", i32 0, i32 0
  ; boo . perier = perier ;
  %".46" = load %"water", %"water"* %".3", align 4
  store %"water" %".46", %"water"* %".44", align 4
  %".48" = getelementptr inbounds %"bottle", %"bottle"* %".42", i32 0, i32 1
  ; boo . spa = spa ;
  %".50" = load %"water", %"water"* %".8", align 4
  store %"water" %".50", %"water"* %".48", align 4
  %".52" = getelementptr inbounds %"bottle", %"bottle"* %".42", i32 0, i32 2
  ; boo . sea = sea ;
  %".54" = load %"water", %"water"* %".13", align 4
  store %"water" %".54", %"water"* %".52", align 4
  ret i32 0
  ;    return 0 ;
}

@".str.0" = internal constant [3 x i8] c"%d\00"
declare i32 @"printf"(i8* %".1", ...)

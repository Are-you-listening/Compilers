; ModuleID = "/home/watson/OneDrive/2023-2024/Compilers/Project/Compilers/example_source_files/52_struct_in_struct/52_struct_in_struct.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca {i32}, align 4
  ;    struct water { INT has_nemo ; } ;  struct bottle { struct water perier ; struct water spa ; struct water sea ; } ;  INT main ( ) { struct water perier ;
  %".5" = getelementptr inbounds {i32}, {i32}* %".3", i32 0, i32 0
  ; perier . has_nemo = 0 ;
  store i32 0, i32* %".5", align 4
  %".8" = alloca {i32}, align 4
  ; struct water spa ;
  %".10" = getelementptr inbounds {i32}, {i32}* %".8", i32 0, i32 0
  ; spa . has_nemo = 0 ;
  store i32 0, i32* %".10", align 4
  %".13" = alloca {i32}, align 4
  ; struct water sea ;
  %".15" = getelementptr inbounds {i32}, {i32}* %".13", i32 0, i32 0
  ; sea . has_nemo = 1 ;
  store i32 1, i32* %".15", align 4
  %".18" = alloca {{i32}, {i32}, {i32}}, align 16
  ;  struct bottle boo ;
  %".20" = getelementptr inbounds {{i32}, {i32}, {i32}}, {{i32}, {i32}, {i32}}* %".18", i32 0, i32 0
  ; boo . perier = perier ;
  %".22" = load {i32}, {i32}* %".3", align 4
  store {i32} %".22", {i32}* %".20", align 4
  %".24" = getelementptr inbounds {{i32}, {i32}, {i32}}, {{i32}, {i32}, {i32}}* %".18", i32 0, i32 1
  ; boo . spa = spa ;
  %".26" = load {i32}, {i32}* %".8", align 4
  store {i32} %".26", {i32}* %".24", align 4
  %".28" = getelementptr inbounds {{i32}, {i32}, {i32}}, {{i32}, {i32}, {i32}}* %".18", i32 0, i32 2
  ; boo . sea = sea ;
  %".30" = load {i32}, {i32}* %".13", align 4
  store {i32} %".30", {i32}* %".28", align 4
  ret i32 0
  ;  return 0 ;
}

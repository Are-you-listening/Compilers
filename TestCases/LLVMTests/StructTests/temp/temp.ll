; ModuleID = "tests/test6.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;    struct kaas INT melk INT fermtented   struct pointer struct kaas * kaas_ptr    INT main
  %".4" = alloca {i32, i32}, align 8
  ; struct kaas ementaler
  %".6" = getelementptr inbounds {i32, i32}, {i32, i32}* %".4", i32 0, i32 0
  ;  ementaler . melk = 1
  store i32 1, i32* %".6", align 4
  %".9" = getelementptr inbounds {i32, i32}, {i32, i32}* %".4", i32 0, i32 1
  ; ementaler . fermtented = 18
  store i32 18, i32* %".9", align 4
  %".12" = getelementptr inbounds {i32, i32}, {i32, i32}* %".4", i32 0, i32 0
  ; printf "%d" ementaler . melk
  %".14" = load i32, i32* %".12", align 4
  %".15" = bitcast [3 x i8]* @".str.0" to i8*
  %".16" = alloca i32
  store i32 %".14", i32* %".16"
  %".18" = load i32, i32* %".16"
  %".19" = call i32 (i8*, ...) @"printf"(i8* %".15", i32 %".18")
  %".20" = getelementptr inbounds {i32, i32}, {i32, i32}* %".4", i32 0, i32 1
  ; printf "%d" ementaler . fermtented
  %".22" = load i32, i32* %".20", align 4
  %".23" = bitcast [3 x i8]* @".str.0" to i8*
  %".24" = alloca i32
  store i32 %".22", i32* %".24"
  %".26" = load i32, i32* %".24"
  %".27" = call i32 (i8*, ...) @"printf"(i8* %".23", i32 %".26")
  %".28" = alloca {i32, i32}, align 8
  ;   struct kaas gouda
  %".30" = getelementptr inbounds {i32, i32}, {i32, i32}* %".28", i32 0, i32 0
  ;  gouda . melk = 2
  store i32 2, i32* %".30", align 4
  %".33" = getelementptr inbounds {i32, i32}, {i32, i32}* %".28", i32 0, i32 1
  ; gouda . fermtented = 7
  store i32 7, i32* %".33", align 4
  %".36" = getelementptr inbounds {i32, i32}, {i32, i32}* %".28", i32 0, i32 0
  ; printf "%d" gouda . melk
  %".38" = load i32, i32* %".36", align 4
  %".39" = bitcast [3 x i8]* @".str.0" to i8*
  %".40" = alloca i32
  store i32 %".38", i32* %".40"
  %".42" = load i32, i32* %".40"
  %".43" = call i32 (i8*, ...) @"printf"(i8* %".39", i32 %".42")
  %".44" = getelementptr inbounds {i32, i32}, {i32, i32}* %".28", i32 0, i32 1
  ; printf "%d" gouda . fermtented
  %".46" = load i32, i32* %".44", align 4
  %".47" = bitcast [3 x i8]* @".str.0" to i8*
  %".48" = alloca i32
  store i32 %".46", i32* %".48"
  %".50" = load i32, i32* %".48"
  %".51" = call i32 (i8*, ...) @"printf"(i8* %".47", i32 %".50")
  %".52" = getelementptr inbounds {i32, i32}, {i32, i32}* %".4", i32 0, i32 0
  ;  printf "%d" ementaler . melk
  %".54" = load i32, i32* %".52", align 4
  %".55" = bitcast [3 x i8]* @".str.0" to i8*
  %".56" = alloca i32
  store i32 %".54", i32* %".56"
  %".58" = load i32, i32* %".56"
  %".59" = call i32 (i8*, ...) @"printf"(i8* %".55", i32 %".58")
  %".60" = getelementptr inbounds {i32, i32}, {i32, i32}* %".4", i32 0, i32 1
  ; printf "%d" ementaler . fermtented
  %".62" = load i32, i32* %".60", align 4
  %".63" = bitcast [3 x i8]* @".str.0" to i8*
  %".64" = alloca i32
  store i32 %".62", i32* %".64"
  %".66" = load i32, i32* %".64"
  %".67" = call i32 (i8*, ...) @"printf"(i8* %".63", i32 %".66")
  ; struct kaas* gouda_ptr = &ementaler;
  ;
  ; printf("%d   ", (* (int) (pointer.kaas_ptr + 1 + 2 + 3 )).melk );
  ;
  ; printf("%d   ", (*gouda_ptr).melk );
  ;
  ret i32 0
  ;   return 0
}

@".str.0" = internal constant [3 x i8] c"%d\00"
declare i32 @"printf"(i8* %".1", ...)

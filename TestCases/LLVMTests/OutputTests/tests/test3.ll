; ModuleID = "tests/test3.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 4, i32* %".3", align 4
  ; INT x = 4
  %".6" = alloca i32, align 4
  store i32 5, i32* %".6", align 4
  ; INT y = 5
  %".9" = alloca i32*, align 8
  store i32* %".3", i32** %".9", align 8
  ; INT * ptr = & x
  %".12" = load i32*, i32** %".9", align 8
  ; ptr ++
  %".14" = getelementptr inbounds i32, i32* %".12", i64 1
  store i32* %".14", i32** %".9", align 8
  ;  now points to y
  %".17" = load i32*, i32** %".9", align 8
  ; ptr --
  %".19" = sub i64 0, 1
  %".20" = getelementptr inbounds i32, i32* %".17", i64 %".19"
  store i32* %".20", i32** %".9", align 8
  ;  now points to x
  %".23" = load i32*, i32** %".9", align 8
  ; INT is_x = ptr == & x
  %".25" = icmp eq i32* %".23", %".3"
  %".26" = zext i1 %".25" to i32
  %".27" = alloca i32, align 4
  store i32 %".26", i32* %".27", align 4
  %".29" = load i32*, i32** %".9", align 8
  ; INT is_y = ptr == & y
  %".31" = icmp eq i32* %".29", %".6"
  %".32" = zext i1 %".31" to i32
  %".33" = alloca i32, align 4
  store i32 %".32", i32* %".33", align 4
  %".35" = load i32*, i32** %".9", align 8
  ; is_y = & x != ptr
  %".37" = icmp ne i32* %".3", %".35"
  %".38" = zext i1 %".37" to i32
  store i32 %".38", i32* %".33", align 4
  %".40" = inttoptr i32 0 to float*
  ; FLOAT * ptr2 = 0
  %".42" = alloca float*, align 8
  store float* %".40", float** %".42", align 8
  %".44" = load float*, float** %".42", align 8
  ; ptr2 >= ptr
  %".46" = load i32*, i32** %".9", align 8
  %".47" = bitcast i32* %".46" to float*
  %".48" = icmp sge float* %".44", %".47"
  %".49" = load float*, float** %".42", align 8
  ; ptr2 <= ptr
  %".51" = load i32*, i32** %".9", align 8
  %".52" = bitcast i32* %".51" to float*
  %".53" = icmp sle float* %".49", %".52"
  %".54" = load i32*, i32** %".9", align 8
  ; ptr > & x
  %".56" = icmp sgt i32* %".54", %".3"
  %".57" = load i32*, i32** %".9", align 8
  ; ptr < 32
  %".59" = inttoptr i32 32 to i32*
  %".60" = icmp slt i32* %".57", %".59"
  %".61" = alloca i32, align 4
  store i32 4, i32* %".61", align 4
  ; INT num_skip_elements = 4
  %".64" = load i32*, i32** %".9", align 8
  ; ptr = ptr + 4 * num_skip_elements
  %".66" = getelementptr inbounds i32, i32* %".64", i32 16
  store i32* %".66", i32** %".9", align 8
  ret i32 0
  ; INT main
}

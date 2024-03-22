; ModuleID = "testfiles/basic_tests_123/proj2_man_pass_advancedPointerOperations.c"
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
  %".13" = getelementptr inbounds i32, i32* %".12", i64 1
  store i32* %".13", i32** %".9", align 8
  ;  now points to y
  %".16" = load i32*, i32** %".9", align 8
  %".17" = sub i64 1, 1
  %".18" = getelementptr inbounds i32, i32* %".16", i64 1
  store i32* %".18", i32** %".9", align 8
  ;  now points to x
  %".21" = load i32*, i32** %".9", align 8
  %".22" = icmp eq i32* %".21", %".3"
  %".23" = zext i1 %".22" to i32
  %".24" = alloca i32, align 4
  store i32 %".23", i32* %".24", align 4
  ; INT is_x = ptr == & x
  %".27" = load i32*, i32** %".9", align 8
  %".28" = icmp eq i32* %".27", %".6"
  %".29" = zext i1 %".28" to i32
  %".30" = alloca i32, align 4
  store i32 %".29", i32* %".30", align 4
  ; INT is_y = ptr == & y
  %".33" = load i32*, i32** %".9", align 8
  %".34" = icmp ne i32* %".3", %".33"
  %".35" = zext i1 %".34" to i32
  store i32 %".35", i32* %".30", align 4
  ; is_y = & x != ptr
  %".38" = inttoptr i32 0 to float*
  %".39" = alloca float*, align 8
  store float* %".38", float** %".39", align 8
  ; FLOAT * ptr2 = 0
  %".42" = load float*, float** %".39", align 8
  %".43" = load i32*, i32** %".9", align 8
  %".44" = inttoptr i32* %".43" to float*
  %".45" = icmp sge float* %".42", %".44"
  %".46" = zext i1 %".45" to i32
  %".47" = load float*, float** %".39", align 8
  %".48" = load i32*, i32** %".9", align 8
  %".49" = inttoptr i32* %".48" to float*
  %".50" = icmp sle float* %".47", %".49"
  %".51" = zext i1 %".50" to i32
  %".52" = load i32*, i32** %".9", align 8
  %".53" = icmp sgt i32* %".52", %".3"
  %".54" = zext i1 %".53" to i32
  %".55" = load i32*, i32** %".9", align 8
  %".56" = icmp slt i32* %".55", 32
  %".57" = zext i1 %".56" to i32
  %".58" = alloca i32, align 4
  store i32 4, i32* %".58", align 4
  ; INT num_skip_elements = 4
  %".61" = load i32*, i32** %".9", align 8
  %".62" = getelementptr inbounds i32, i32* %".61", i32 16
  store i32* %".62", i32** %".9", align 8
  ; ptr = ptr + 4 * num_skip_elements
  ret i32 0
}

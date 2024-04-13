; ModuleID = "tests/test3.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;  INT main
  %".4" = alloca i32, align 4
  store i32 4, i32* %".4", align 4
  ; INT x = 4
  %".7" = alloca i32, align 4
  store i32 5, i32* %".7", align 4
  ; INT y = 5
  %".10" = alloca i32*, align 8
  store i32* %".4", i32** %".10", align 8
  ;  INT * ptr = & x
  %".13" = load i32*, i32** %".10", align 8
  ; ptr ++
  %".15" = getelementptr inbounds i32, i32* %".13", i64 1
  store i32* %".15", i32** %".10", align 8
  ;  now points to y
  %".18" = load i32*, i32** %".10", align 8
  ; ptr --
  %".20" = sub i64 0, 1
  %".21" = getelementptr inbounds i32, i32* %".18", i64 %".20"
  store i32* %".21", i32** %".10", align 8
  ;  now points to x
  ;  INT is_x = ptr == & x
  %".25" = load i32*, i32** %".10", align 8
  %".26" = icmp eq i32* %".25", %".4"
  %".27" = zext i1 %".26" to i32
  %".28" = alloca i32, align 4
  store i32 %".27", i32* %".28", align 4
  ; INT is_y = ptr == & y
  %".31" = load i32*, i32** %".10", align 8
  %".32" = icmp eq i32* %".31", %".7"
  %".33" = zext i1 %".32" to i32
  %".34" = alloca i32, align 4
  store i32 %".33", i32* %".34", align 4
  ; is_y = & x != ptr
  %".37" = load i32*, i32** %".10", align 8
  %".38" = icmp ne i32* %".4", %".37"
  %".39" = zext i1 %".38" to i32
  store i32 %".39", i32* %".34", align 4
  ;  FLOAT * ptr2 = 0
  %".42" = inttoptr i32 0 to float*
  %".43" = alloca float*, align 8
  store float* %".42", float** %".43", align 8
  %".45" = load float*, float** %".43", align 8
  ;  ptr2 >= ptr
  %".47" = load i32*, i32** %".10", align 8
  %".48" = bitcast i32* %".47" to float*
  %".49" = icmp sge float* %".45", %".48"
  %".50" = load float*, float** %".43", align 8
  ; ptr2 <= ptr
  %".52" = load i32*, i32** %".10", align 8
  %".53" = bitcast i32* %".52" to float*
  %".54" = icmp sle float* %".50", %".53"
  %".55" = load i32*, i32** %".10", align 8
  ; ptr > & x
  %".57" = icmp sgt i32* %".55", %".4"
  %".58" = load i32*, i32** %".10", align 8
  ; ptr < 32
  %".60" = inttoptr i32 32 to i32*
  %".61" = icmp slt i32* %".58", %".60"
  %".62" = alloca i32, align 4
  store i32 4, i32* %".62", align 4
  ;  INT num_skip_elements = 4
  %".65" = load i32*, i32** %".10", align 8
  ;  ptr = ptr + 4 * num_skip_elements
  %".67" = getelementptr inbounds i32, i32* %".65", i32 16
  store i32* %".67", i32** %".10", align 8
  ret i32 0
  ; return 0
}

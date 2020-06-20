<%@page import="model.makequestDTO"%>
<%@page import="model.solveDTO"%>
<%@page import="model.SomeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
/* 세션에 저장된 사용자 성별을 myGender 변수에 저장 */
String myGender = (String)session.getAttribute("gender");
/* 사용자 성별이 남성이면 상대방 성별 yourGender은 여성, 
사용자 성별이 여성이면 yourGender은 남성 */
String yourGender = "";
if(myGender.equals("남성")){
	yourGender = "여성";
}else{
	yourGender = "남성";
}
/*solve table에서 이성의 데이터 중 랜덤으로 하나 뽑음 */
SomeDAO dao = new SomeDAO();
solveDTO  dto = dao.quizList(yourGender);
/* 뽑은 데이터의 질문과 답변을 변수에 저장 */
String q1 = dto.getQ1();
String q2 = dto.getQ2();
String q3 = dto.getQ3();
String a1 = dto.getA1();
String a2 = dto.getA2();
String a3 = dto.getA3();
/* 각 문제에 해당하는 선택지 가져옴 */
makequestDTO dto1 = dao.answerList(q1);
makequestDTO dto2 = dao.answerList(q2);
makequestDTO dto3 = dao.answerList(q3);
%>
<html>
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

 <title>S.O.M.E</title>
  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.css" rel="stylesheet">
  <!-- Custom styles for this template -->
  <link href="css/full-width-pics.css" rel="stylesheet">

<script type="text/javascript" src="../jquery/jquery-3.4.1.js"></script>
<script type="text/javascript">
$(function(){
	var score = 0
	$("#btn1").click(function(){ /* '제출하기'버튼 클릭 */
		/*선택한 답의 value*/
		a1Value = $("#answer1:checked").val()
		a2Value = $("#answer2:checked").val()
		a3Value = $("#answer3:checked").val()
		/*푸는 사람이 선택한 답과 출제자의 답이 일치하면 문제번호에 맞은 표시,
		일치하지 않으면 틀린 표시 */
		if(a1Value == "<%=a1%>"){
			$("#num1").append("<img style='width:100px; height:100px;' src='img/o.png'></img>")
			score = score + 1
		}else{
			$("#num1").append("<img style='width:100px; height:100px;' src='img/x.png'></img>")
		}
		if(a2Value == "<%=a2%>"){
			$("#num2").append("<img style='width:100px; height:100px;' src='img/o.png'></img>")
			score = score + 1
		}else{
			$("#num2").append("<img style='width:100px; height:100px;' src='img/x.png'></img>")
		}
		if(a3Value == "<%=a3%>"){
			$("#num3").append("<img style='width:100px; height:100px;' src='img/o.png'></img>")
			score = score + 1
		}else{
			$("#num3").append("<img style='width:100px; height:100px;' src='img/x.png'></img>")
		}
		if(score == 3){ /*3문제를 모두 맞춘 경우, '제출하기'버튼을 '프로필 확인하기' 버튼으로 변경 */
			$(".d1").empty()
			$(".d1").append("<button class='btn btn-lg btn-block' id='btn2'>프로필 확인하기</button>")
			$("#btn2").click(function(){/*프로필 확인 페이지로 이동*/
				location.href="profile.jsp?id=<%=dto.getId()%>"
			})
		}
	})
	
	$("#btn3").click(function(){
		location.href="solve.jsp"
	})
})

</script>
<style type="text/css">
.btn{
    Color : black;
    border : 1px solid #ffeae8;
    background : #ffeae8;
    margin : 0px;
    width: 35%;
    display:inline-block;
    margin-top: 20px;
}
tr{
	height: 80px;
}
input[type="radio"]{
  	margin-right:5px;
}
.text {
position:relative;
  font-size: 25px;
  margin-top: 70px;
  vertical-align: middle;
}

.text img {
  position: absolute;
  text-align: center;
  top:25px;
  left:5px;
}
table {
	border-collapse: collapse;
	border: solid #dea0a0;
}
td{
	padding-left: 40px;
}
</style>
</head>
<body>
<jsp:include page="top.jsp"></jsp:include>
  
<!-- Content section -->
 <section class="p-4">
 <div class="container-fluid">
 <div class="row" style="height:700px;">
<div class="col-sm-8 p-2" style="margin:0 auto;">

<table style="margin:0 auto; width: 50%;">
<tr style="height: 70px"><td colspan="3" class="text"><div style="margin:0 auto; width:70%; background-color:#f5edf0;text-align: center;">상대방ID: <%=dto.getId() %></div></td></tr>
<tr><td class="text" id="num1" rowspan="2" style="width:25%;">1번</td><td style="width:15%">Q</td><td><%=q1 %></td></tr>
<tr><td>A</td><td><input type="radio" name="answer1" id="answer1" value="<%=dto1.getAnswer1() %>"><%=dto1.getAnswer1() %><br>
<input type="radio" name="answer1" id="answer1" value="<%=dto1.getAnswer2() %>"><%=dto1.getAnswer2() %><br>
<input type="radio" name="answer1" id="answer1" value="<%=dto1.getAnswer3() %>"><%=dto1.getAnswer3() %></td></tr>
<tr><td class="text" id="num2" rowspan="2">2번</td><td>Q</td><td><%=q2 %></td></tr>
<tr><td>A</td><td><input type="radio" name="answer2" id="answer2" value="<%=dto2.getAnswer1() %>"><%=dto2.getAnswer1() %><br>
<input type="radio" name="answer2" id="answer2" value="<%=dto2.getAnswer2() %>"><%=dto2.getAnswer2() %><br>
<input type="radio" name="answer2" id="answer2" value="<%=dto2.getAnswer3() %>"><%=dto2.getAnswer3() %></td></tr>
<tr><td class="text" id="num3" rowspan="2">3번</td><td>Q</td><td><%=q3 %></td></tr>
<tr><td>A</td><td><input type="radio" name="answer3" id="answer3" value="<%=dto3.getAnswer1() %>"><%=dto3.getAnswer1() %><br>
<input type="radio" name="answer3" id="answer3" value="<%=dto3.getAnswer2() %>"><%=dto3.getAnswer2() %><br>
<input type="radio" name="answer3" id="answer3" value="<%=dto3.getAnswer3() %>"><%=dto3.getAnswer3() %></td></tr>
</table>
<div class="d1" style="text-align:center"><button class="btn btn-lg btn-block" id="btn1">제출하기</button></div>
<div style="text-align:center"><button class="btn btn-lg btn-block" id="btn3" style="margin-top: 20px;">이전 화면</button></div>


</div>
</div>
</div>
</section>

  
  <jsp:include page="bottom.jsp"></jsp:include>

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
<%@page import="model.makequestDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.SomeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

 <title>S.O.M.E</title>
 <script type="text/javascript" src="../jquery/jquery-3.4.1.js"></script>
 <script type="text/javascript">

function change(obj){
	$(obj).next().empty() /* 문제 selectbox 비움 */
	$(obj).next().append("<option>문제를 선택해주세요</option>")
	var selectedText = $(obj).val() /* 선택한 카테고리 value */
	$.ajax({ /* 선택한 카테고리로 makequest table에서 검색하여 질문리스트 가져와서 선택지에 append */
		url:"../control/makequestControl.jsp",
		data:{
			category: selectedText
		},
		success:function(result){
			$(obj).next().append(result)
		}
	})
}

function change2(obj){
	$(obj).next().empty() /* 답변 selectbox 비움 */
	$(obj).next().append("<option>정답을 선택해주세요</option>")
	var selectedText = $(obj).val() /* 선택한 질문 value */
	$.ajax({ /* 선택한 질문으로 makequest table에서 검색하여 답변리스트 가져와서 선택지에 append */
		url:"../control/makequestControl2.jsp",
		data:{
			question: selectedText
			},
		success:function(result){
				$(obj).next().append(result)
			}
		})
}
$(function(){

	$("#btn").click(function(){ /* 만든 문제 저장하기 */
		
		$.ajax({
			url:"../control/solveControl.jsp",
			data:{
				id: "<%=session.getAttribute("id")%>",
				gender: "<%=session.getAttribute("gender")%>",
				q1:$("#q1").val(),
				a1:$("#a1").val(),
				q2:$("#q2").val(),
				a2:$("#a2").val(),
				q3:$("#q3").val(),
				a3:$("#a3").val()
			},
			success:function(){
				alert("저장이 완료되었습니다")
				location.href="solve.jsp"
			}
		})
	})
	
})
		

 </script>
   <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/full-width-pics.css" rel="stylesheet">
<style type="text/css">
#btn{
    Color : black;
    border : 1px solid #ffeae8;
    background : #ffeae8;
    margin : 0px;
    width: 35%;
}
td{
	height: 170px;
	text-align:center;
}
select{
	margin: 7px;
}
table {
	border-collapse: collapse;
	border: solid #dea0a0;
}

</style>
</head>

<body>
<jsp:include page="top.jsp"></jsp:include>
  
<!-- Content section -->
 <section class="p-4">
 <div class="container-fluid">
 <div class="row" style="height:618px;">
	<div class="col-sm-8 p-2" style="margin:0 auto">
	<div style="text-align: center; margin-bottom: 5px">※문제와 정답을 선택하고 저장버튼을 눌러주세요</div>
	<table style="margin:0 auto; width:50%; ">
	<tr>
		<td style="width:20%; font-size: 25px;">1번</td>
		<td><!-- 카테고리 select box -->
			<!-- select value에 따라 onchange 이벤트 -->
			<select name = "category" class="category" onchange="change(this)">
			  		<option value="">카테고리를 선택해주세요</option>
			  		<option value="상황">상황</option>
			    	<option value="연애">연애</option>
			    	<option value="취향">취향</option>
			    	<option value="활동">활동</option></select>
			<!-- 문제 select box -->
			<!-- select value에 따라 onchange 이벤트 -->
		 	<select class="question" id="q1" style="width:80%" onchange="change2(this)">
			    	<option>문제를 선택해주세요</option></select>
			<!-- 정답 select box -->
			<select class="answer" id="a1" style="width:80%">
		  			<option>정답을 선택해주세요</option></select>
		</td>
	</tr>
	<tr>
		<td style="width:10%; font-size: 25px;">2번</td>
		<td>
			<select name = "category" class="category" onchange="change(this)">
			  		<option value="">카테고리를 선택해주세요</option>
			  		<option value="상황">상황</option>
			    	<option value="연애">연애</option>
			    	<option value="취향">취향</option>
			    	<option value="활동">활동</option></select>
			
		 	<select class="question" id="q2" style="width:80%" onchange="change2(this)">
			    	<option>문제를 선택해주세요</option></select>
			
			 <select class="answer" id="a2" style="width:80%">
		  			<option>정답을 선택해주세요</option></select>
		</td>
	</tr>
	<tr>
		<td style="width:10%; font-size: 25px;">3번</td>
		<td>
			<select name = "category" class="category" onchange="change(this)">
			  		<option value="">카테고리를 선택해주세요</option>
			  		<option value="상황">상황</option>
			    	<option value="연애">연애</option>
			    	<option value="취향">취향</option>
			    	<option value="활동">활동</option></select>
			 
		 	 <select class="question" id="q3" style="width:80%" onchange="change2(this)">
			    	<option>문제를 선택해주세요</option></select>
			 
			 <select class="answer" id="a3" style="width:80%">
		  			<option>정답을 선택해주세요</option></select>
		</td>
	</tr>
	</table>
	<div style="text-align:center"><button class="btn btn-lg btn-block" id="btn" style="display:inline-block; margin-top: 20px;">저장하기</button></div>
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
			     
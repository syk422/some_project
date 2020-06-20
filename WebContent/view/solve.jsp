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
 <%
 SomeDAO dao = new SomeDAO();
 String id = (String)session.getAttribute("id");
 int mycount = dao.myCount(id);
 int count = 3 - mycount;
 if(id==null){
%>
	alert("로그인 후 사용해주시길 바랍니다.")
	location.href="login.jsp"
<%
	}
%> 
 $(function(){
	 $("#b1").click(function(){
		 location.href="makeQuest.jsp";
	 })
	 <%if(count == 0){ %>
	 $("#solvebtn").prop("disabled",true)
	 
	 <%}%>
	 $("#solvebtn").click(function(){
		 <% mycount = mycount + 1;
		 if(mycount <=3){
			 dao.updateSC(id, mycount);
		 }else{
			 mycount = 3;
		 }
		 %>
		 location.href="solveQuest.jsp";
	 })
	
 })
 </script>
   <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/full-width-pics.css" rel="stylesheet">
<style type="text/css">
#b1, #solvebtn{
width: 200px;
height: 300px;
margin: 20px 50px;
color: black;
font-size: 25px;
border-radius: 20px;
border : 1px solid #ffeae8;
background : #ffeae8;
}

#b1:hover, #solvebtn:hover{
color: white;
}
</style>
</head>

<body>

  <jsp:include page="top.jsp"></jsp:include>

  <!-- Content section -->
  <section class="p-5">
    <div class="container-fluid">
    	<div class="row" style="height:570px;">
    		<div class="col-sm-2 p-2"></div>
    		<div class="col-sm-8 p-2">
		    	<p style="font-size: 3em; text-align: center; margin-bottom: 50px;">내 마음을 맞춰봐</p>
    		<div class="col-sm-8" style="border-style: solid; border-color:#dea0a0; margin:0 auto; padding:30px 20px;">
    		<table style="margin:0 auto">
    		<tr>
    		<td><button class="btn btn-lg btn-block" id="b1">문제 만들기</button></td>
    		<td><button class="btn btn-lg btn-block" id="solvebtn">문제 풀기<br>(남은 횟수:<%=count %>회)</button></td>
    		</table>
    		</div>
    		<div class="col-sm-2 p-2"></div>
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
			     
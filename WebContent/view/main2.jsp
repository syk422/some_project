<%@page import="org.apache.catalina.ant.SessionsTask"%>
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
  <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
  <script type="text/javascript" src="../jquery/jquery-3.4.1.js"></script>
  <script type="text/javascript" src="../jquery/simpleBanner.js"></script>
  <script type="text/javascript">
	$(function(){
	   $("#signin-btn").click(function(){
	      console.log("1")
	      location.href="signin.jsp";
	   })
	   $("#login-btn").click(function(){
	      location.href="login.jsp";
	   })
	   $("#mypage-btn").click(function(){
	      location.href="mypage.jsp";
	   })
	   $("#logout-btn").click(function(){
		   alert("로그아웃 완료!")
	       location.href="logout.jsp";
	   })
	})
  </script>
  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/full-width-pics.css" rel="stylesheet">
  
  <!-- 배너 관련 css -->
  <link rel="stylesheet" href="css/simpleBanner.css">
  <style type="text/css">
  li{
  	cursor:pointer;
  }
  </style>
</head>

<body>

  <jsp:include page="top2.jsp"></jsp:include>
  

  <!-- Content section -->
  <section class="p-5" style="height: 500px;">
    <div class="container-fluid">
    	<div class="row" style="height: 100%">
    		<div class="col-sm-8" style="height: 100%; padding-left: 130px;">
			      <h1 style="padding-left: 50px">커플 매칭 사이트  SOME 입니다.</h1><br>
					<div class="simple_banner_wrap" >
						<ul>	
							<li onclick="location.href='signin.jsp'" style="background-image:url('img/001.png'); background-color:#9f6;font-size: 1.5em; text-align: center;">
							</li>
							<li onclick="location.href='signin.jsp'" style="background-color:#69f;font-size: 2em; text-align: center;padding-top: 100px;">
							<span style="color : #033dff">한번의 클릭으로 당신의 이상형을 만나보세요!<br>회원가입 바로가기 클릭!</span>
							<li onclick="location.href='signin.jsp'" style="background-image:url('img/그림0.png'); background-color:#9f6;font-size: 3em; text-align: center;">
							<li onclick="location.href='signin.jsp'" style="background-color:#f69;font-size: 2em; text-align: center;padding-top: 100px;">
							<span style="color : #033dff">상대방이 낸 문제를 맞추고 쪽지를 보내보세요!<br>회원가입 바로가기 클릭!</span>
							<li onclick="location.href='https://heydealer.com/'" style= "background-image:url('img/008.png'); background-color:#f96;font-size: 3em; text-align: center;">
						</ul>
					</div>
    		</div>
			
    		<div class="col-sm-4 p-2" style="height: 100%">
    			<div class ="p-1">
			      <h1 style="text-align: center;">사이트 설명</h1>
			      <p style="font-size: 20px; text-align: center;"><br>회원가입을 하시면<br> 매칭 알고리즘을 기반으로 한 매칭 서비스와<br> 하루 3회의 랜덤매칭 서비스를 이용하실 수 있습니다.<br><br>회원가입 후 운명의 상대를 찾아보세요.</p>
			     </div>
			     <%
			     	if(session.getAttribute("id")==null){
			     %>
			     <div class="p-2">
			     	<button id="signin-btn" type="button" class="btn btn-default btn-lg bg-dark" style="width:200px; margin-right:10px;">회원가입</button>
                 	<button id="login-btn" type="button" class="btn btn-default btn-lg bg-dark"style="width:200px; margin-left:10px;">로그인</button>
			     </div>
			     <%
			     	}else{
			     %>
			     <div class="p-2">
			     	<button id="mypage-btn" type="button" class="btn btn-default btn-lg bg-dark" style="width:200px; margin-right:10px;">마이페이지</button>
                 	<button id="logout-btn" type="button" class="btn btn-default btn-lg bg-dark"style="width:200px; margin-left:10px;">로그아웃</button>
			     </div>
			     <%
			     	}
			     %>
			     
			     
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

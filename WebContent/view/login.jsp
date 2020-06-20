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
  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.css" rel="stylesheet">
  <!-- Custom styles for this template -->
  <link href="css/full-width-pics.css" rel="stylesheet">
  
<script type="text/javascript" src="../jquery/jquery-3.4.1.js"></script>
<script type="text/javascript">
$(function(){
$("#btn").click(function(){
	/* 아이디, 비밀번호 입력한 값 가져와 변수에 저장 */
	idValue = $("#id").val()
	pwValue = $("#pw").val()
	$.ajax({ /* 로그인 처리 위해 loginControl.jsp로 데이터 보냄 */
		url:"../control/loginControl.jsp",
		data:{
			id: idValue,
			pw: pwValue
		},
		success:function(result){
			if(result == 1){ /* 아이디, 비밀번호가 일치하면 로그인 성공 */
				alert("로그인 성공")
				location.href="main.jsp"
			}else{ /* 로그인 실패 시 입력한 내용 지움 */
				alert("로그인 실패")
				$("#id").val("")
				$("#pw").val("")
			}
		}
		
	})
})
})
</script>
<style type="text/css">
#btn{
    Color : black;
    border : 1px solid #ffeae8;
    background : #ffeae8;
    margin : 0px;
    width: 35%;
}
input{
	margin: 20px;
	height: 50px;
	width: 80%;
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
			    <h1 style="text-align:center; font-size:60px; letter-spacing: 5px;">SOME</h1>
    			<div style="border-style: solid; border-color:#dea0a0; width:70%; margin:30px auto 0; padding:30px 20px">
    			<div style="text-align:center;">
    				<input name ="id" id="id" placeholder="아이디">
    				<input type="password" name ="pw" id="pw" placeholder="비밀번호">
    			</div>
    		</div>
    		<div class="col-sm-9" style ="text-align: right; margin:20px auto 0; padding: 0 50px;">
    		<a style="color: black;text-decoration: underline;" href="signin.jsp">회원가입</a>
    		</div>
    		
    		<div style="text-align:center"><button class="btn btn-lg btn-block" id="btn" style="display:inline-block; margin-top: 40px;">로그인</button></div>
    		</div>
    		<div class="col-sm-2 p-2"></div>
   		 </div>
    </div>
  </section>
  
 <jsp:include page="bottom.jsp"></jsp:include>
  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>

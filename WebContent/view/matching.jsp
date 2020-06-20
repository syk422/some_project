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
  <script type="text/javascript" src="../jquery/jquery-3.4.1.js" ></script>
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <script type="text/javascript">
  <%
	String id = (String)session.getAttribute("id");
	if(id==null){
%>
	alert("로그인 후 사용해주시길 바랍니다.")
	location.href="login.jsp"
<%
	}
%>
  	function openInNewTab(url) {  // span을 클릭했을 경우 새탭 뛰우는 함수
		var win = window.open(url,'_blank');
		win.focus();
	}
  	$(function() {
		$('#matchingBtn').click(function() {
			actionValue = "matching"
			mbtiValue = $('#mbtitype').val();
			$.ajax({
				url : "../control/matchingcontrol.jsp",
				data : {action : actionValue,
						mbti : mbtiValue							
						} ,
				success : function(result) {
					$('#main-div').empty()
					$("#main-div").append(result)
					
					$('.gomatchbtn').click(function() {
						idValue = $(this).val()
						location.href="gomatch.jsp?id="+idValue;
						
					})
				}
			})

		})
	})
  </script>
  <style type="text/css">
  #main-div{
  		height: 100%;
  	}
  	#mypage-div{
  		width: 100%;
  		height: 100%;
  		padding-top: 15px;
  		padding-bottom: 15px;
  	}
  	#myinfo-div{
  		float: left;
  		width: 48%;
  		height: 50%;
  		border: 2px solid #dea0a0;
  		margin-bottom: 15px;
  		margin-right: 15px;
  		padding: 10px;
  	}
  	#mypf-div{
  		float: right;
  		width: 48%;
  		height: 50%;
  		border: 2px solid #dea0a0;
  		margin-bottom: 15px;
  		margin-left: 15px;
  		padding: 10px;
  	}
 
  	.title-div{
  		width: 100%;
  		height: 15%;
  		padding-left: 15px;
  		padding-top: 5px;
  		padding-bottom: 5px;
  		padding-right: 5px;
  	}
  	.Lspan{
  		float: left;
  		font-size: 27px;
  	}
  	.Rspan{
  		float:right;
  		margin-top : 12px;
  		font-size: 15px;
  	}
  	.Rspan:hover{
  		color:	blue;
  		cursor : pointer;
  		text-decoration: underline;
  	}
  	.con-div{
  		width: 100%;
  		height: 85%;
  	}
  	table{
  		width: 100%;
  		height: 100%;
  	}
  	td{
  		text-align : center;
  		width : 50%;
  		padding-top: 5px;
  		padding-bottom: 10px;
  	}
  	.Lattr{
  		font-size: 20px;
  	}
  	.Rattr{
  		font-size: 20px;
  	}
  	#main-div{
  		height: 100%;
  	}
  	
  	#blood-div{
  		width: 75%;
  		height: 40%;
  		padding: 30px;
  		margin:30px auto;
  		background-color: white;
  	}
  	
  	#mbti-div{
  		width: 75%;
  		height: 40%;
  		padding: 30px;
  		margin:30px auto;
  		background-color: white;
  	}
  	#btn-div{
  		width: 80%;
  		height: 20%;
  		padding-left: 25%;
  		padding-right: 25%;
  		padding-top: 50px;
  	
  	}
  	#matchingBtn{
  		Color : black;
		border : 1px solid #ffeae8;
		background : #ffeae8;
		margin : 0px;
		width: 100%;
  	
  	}
  	.gomatchbtn{
  		Color : black;
		border : 1px solid #ffeae8;
		background : #ffeae8;
		margin : 0px;
		width: 100%;
  	
  	}
	#blood1-div{
		width : 50%;
		height : 100%;
		float: left;
		text-align: center;
		font-size: 30px;
	}  	
	#blood2-div{
		width : 50%;
		height : 100%;
		float: right;
		text-align: center;
		font-size: 30px;
	}  	
  	#mbti1-div{
		width : 50%;
		height : 100%;
		float: left;
		text-align: center;
		font-size: 30px;
	}  	
	#mbti2-div{
		width : 50%;
		height : 100%;
		float: right;
		text-align: center;
		font-size: 30spx;
		padding-left: 15%;
	}  	
  	#aspan{
  		font-size: 15px;
  	}
  	#aspan:hover{
  		color:	blue;
  		cursor : pointer;
  		text-decoration: underline;
  	}
  	
  </style>
</head>

<body>
  <jsp:include page="top.jsp"></jsp:include>
  <!-- Content section -->
  <section class="p-5" >
    <div class="container-fluid" style="height:900px">
    	<div style="height: 100%" class="row">
    		<div class="col-sm-2">
    		</div>
    		<div id="main-div" class="col-sm-8">
    		<p style="font-size: 3em; text-align: center; margin:0 0 40px;">I.Need.Some</p>
    			<div id="inner-div" style="width: 100%; height: 60%; /* padding-top: 10%; padding-bottom: 10% */">
    				<div id="blood-div">
    					<div id="blood1-div">
	    					<p>당신의 혈액형은?</p>
    					</div>
    					<div id="blood2-div">
    						<p><%=session.getAttribute("blood") %>형</p>
    						<span id="aspan" onclick="openInNewTab('mypage.jsp');" >혈액형이 맞지 않나요? 마이페이지에서 수정해주세요.</span>
    					</div>
    				</div>
    				<div id="mbti-div">
    					<div id="mbti1-div">
	    					<p>당신의 MBTI 유형은?</p>
	    					<span id="aspan" onclick="openInNewTab('https://www.16personalities.com/ko');" >MBTI 유형검사 하기.</span>
    					</div>
    					<div id="mbti2-div">
    						<select name="mbtitype" id="mbtitype" class="form-control" style="width: 250px">
    							<option value="INFP">INFP</option>
    							<option value="ENFP">ENFP</option>
    							<option value="INFJ">INFJ</option>
    							<option value="ENFJ">ENFJ</option>
    							<option value="INTJ">INTJ</option>
    							<option value="ENTJ">ENTJ</option>
    							<option value="INTP">INTP</option>
    							<option value="ENTP">ENTP</option>
    							<option value="ISFP">ISFP</option>
    							<option value="ESFP">ESFP</option>
    							<option value="ISTP">ISTP</option>
    							<option value="ESTP">ESTP</option>
    							<option value="ISFJ">ISFJ</option>
    							<option value="ESFJ">ESFJ</option>
    							<option value="ISTJ">ISTJ</option>
    							<option value="ESTJ">ESTJ</option>
    						</select>
    					</div>
    				</div>
    				<div id="btn-div" style="margin:30px auto">
    					<button type="button" id="matchingBtn" class="btn btn-lg btn-block" >매칭 시작</button>
    				</div>
    			</div>
    			
    		</div>
    		<div class="col-sm-2">
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

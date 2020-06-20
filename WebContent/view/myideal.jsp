<%@page import="model.questionDTO"%>
<%@page import="model.mitDTO"%>
<%@page import="model.memberDTO"%>
<%@page import="model.SomeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
 <%--  <%
  	
  	if(session.getAttribute("id")==null){
  %>
	<jsp:forward page="main.jsp"></jsp:forward>  
  <%
  	}
  %> --%>
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
  <script type="text/javascript">
   $(function() {
	 	$("#updateBtn").click(function() {
			actionValue = "idealupdate";
			itallValue = $("#itall").val()
			ireliValue = $("#ireli:checked").val()
			ismokeValue = $("#ismoke:checked").val()
			idrinkValue = $("#idrink:checked").val()
			if (itallValue == "" || ireliValue =="" ||  idrinkValue =="" || ismokeValue =="" ) {
				alert("모든 항목을 작성해주시길 바랍니다.")
			} else {
				$.ajax({
					url : "../control/myPageControl.jsp" ,
					data: {
						action : actionValue,
						id : '<%=session.getAttribute("id")%>',
						itall : itallValue,
						ireli : ireliValue,
						idrink : idrinkValue,
						ismoke : ismokeValue,
					},
					success : function(result) {
						alert("프로필이 변경되었습니다.")
						location.href="mypage.jsp"
					}
					
				})
			}
		})
	})
  </script>
  <style type="text/css">
  	#main-div{
  		height: 100%;
  	}
  	#mypage-div{
  		width: 100%;
  		height: 90%;
  		padding-top: 8%;
  		padding-left: 15%;
  		padding-right: 15%;
  		padding-bottom: 3%;
  	}
  	#myideal-div{
  		float: left;
  		width: 100%;
  		height: 100%;
  		border: 2px solid #dea0a0;
  		margin-bottom: 15px;
  		margin-right: 15px;
  		padding: 10px;
  	}
  	.title-div{
  		width: 100%;
  		height: 15%;
  		padding-left: 30px;
  		padding-top: 30px;
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
  		font-size: 18px;
  	}
  	#btn-div{
  		width: 100%;
  		height: 10%;
  	}
  	#updateBtn{
  		float : right;
  		border : 1px solid #ffeae8;
		background : #ffeae8;
  		width : 40%;
  		height: 40%;
  		padding: 0px;
  	}
  	.d2{
  		font-size: 13px;
  		color : red;
  	}
  	.d3{
  		font-size: 13px;
  		color : red;
  	}
  	.d4{
  		font-size: 13px;
  		color : red;
  	}
  </style>
</head>

<body>
  <jsp:include page="top.jsp"></jsp:include>
  <!-- Content section -->
  <section class="p-5"  >
    <div class="container-fluid" style="height: 1000px">
    	<div style="height: 100%" class="row">
    		<div class="col-sm-2">
    		</div>
    		<div id="main-div" class="col-sm-8" style="background: white;">
    			<p style="font-size: 4em; text-align: center;">MY PAGE</p>
    			<div id="mypage-div">
	    			<div id="myideal-div">
	    				<%	
	    					String id = (String) session.getAttribute("id");
	    					SomeDAO dao = new SomeDAO();
	    					mitDTO idto = new mitDTO();
	    					//위에서 id 그리고 dao 객체 생성을 해뒀기 때문에 dto만 만들어서 값저장
	    					idto = dao.Iinfo(id);   
	    					String idrink = "";
	    					if(idto.getIdrink()==1)
	    						idrink = "전혀 마시지 않았으면 좋겠어요.";
	    					else if(idto.getIdrink()==2)
	    						idrink = "어쩔 수 없을때만 마시면 좋겠어요.";
	    					else if(idto.getIdrink()==3)
	    						idrink = "가끔 마셨으면 좋겠어요.";
	    					else if(idto.getIdrink()==4)
	    						idrink = "어느정도 즐기면 좋겠어요.";
	    					else if (idto.getIdrink()==5)
	    						idrink = "자주 술자리를 가지면 좋겠어요.";
	    					else
	    						idrink = "상관없음.";
	    					String ismoke =""; 
	    					if(idto.getIsmoke()==1)
	    						ismoke = "예";
	    					else if(idto.getIsmoke()==2)
	    						ismoke = "아니오";
	    					else
	    						ismoke = "상관없음";
	    					%>
	    					<div class="title-div">
	    						<span class="Lspan">이상형 정보</span>
	    						<button type="button" id="updateBtn" class="btn btn-lg btn-block" >수정완료</button>
		    				</div>
	    					<div class="con-div">
	    					<table>
	    							<tr>
	    								<td class="Lattr">
	    									이상형 키  :
	    								</td>
	    								<td class="Rattr">
	    									<select name ="itall" id="itall" class="form-control" style="width:100%">
								    			<option value="150">150 이상</option>
								    			<option value="160">160 이상</option>
								    			<option value="170">170 이상</option>
								    			<option value="180">180 이상</option>
								    			<option value="190">190 이상</option>
								    			<option value="0">상관 없음</option>
								    		</select>
	    								</td>
	    							</tr>
	    							<tr>
	    								<td class="Lattr">
	    									이상형 종교  :
	    								</td>
	    								<td class="Rattr">
	    									<input type="radio" name ="ireli" id="ireli" value="기독교">기독교
						    				<input type="radio" name ="ireli" id="ireli" value="천주교" style="margin-left:10px">천주교
						    				<input type="radio" name ="ireli" id="ireli" value="불교" style="margin-left:10px">불교<br>
						    				<input type="radio" name ="ireli" id="ireli" value="무교" style="margin-left:10px">무교
						    				<input type="radio" name ="ireli" id="ireli" value="기타" style="margin-left:10px">기타
						    				<input type="radio" name ="ireli" id="ireli" value="상관없음" style="margin-left:10px">상관 없음
	    								</td>
	    							</tr>
	    							<tr>
	    								<td class="Lattr">
	    									이상형 음주여부  :
	    								</td>
	    								<td style="font-size: 15px; text-align: left;" class="Rattr">
	    									<input type="radio" name ="idrink" id="idrink" value="1">전혀 마시지 않았으면 좋겠어요<br>
						    				<input type="radio" name ="idrink" id="idrink" value="2">어쩔 수 없을때만 마시면 좋겠어요<br>
						    				<input type="radio" name ="idrink" id="idrink" value="3">가끔 마셨으면 좋겠어요<br>
						    				<input type="radio" name ="idrink" id="idrink" value="4">어느정도 즐기면 좋겠어요<br>
						    				<input type="radio" name ="idrink" id="idrink" value="5">자주 술자리를 가지면 좋겠어요<br>
						    				<input type="radio" name ="idrink" id="idrink" value="0">상관 없음
	    								</td>
	    							</tr>
	    							<tr>
	    								<td class="Lattr">
	    									이상형 흡연 여부
	    								</td>
	    								<td class="Rattr">
	    									<input type="radio" name ="ismoke" id="ismoke" value="1">예
    										<input type="radio" name ="ismoke" id="ismoke" value="2" style="margin-left:60px">아니오
    										<input type="radio" name ="ismoke" id="ismoke" value="0" style="margin-left:30px">상관 없음
	    								</td>
	    							</tr>
	    						</table>
	    					</div>
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

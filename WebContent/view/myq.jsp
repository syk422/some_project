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
			actionValue = "questionupdate";
			q1Value = $("#q1:checked").val()
			q2Value = $("#q2:checked").val()
			q3Value = $("#q3:checked").val()
			q4Value = $("#q4:checked").val()
			q5Value = $("#q5:checked").val()
			console.log(q1Value + q2Value + q3Value)
			if (q1Value == "" || q2Value =="" ||  q3Value =="" || q4Value ==""|| q5Value =="" ) {
				alert("모든 항목을 작성해주시길 바랍니다.")
			} else {
				$.ajax({
					url : "../control/myPageControl.jsp" ,
					data: {
						action : actionValue,
						id : '<%=session.getAttribute("id")%>',
						q1 : q1Value,
						q2 : q2Value,
						q3 : q3Value,
						q4 : q4Value,
						q5 : q5Value,
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
  	#myq-div{
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
    				<div id="myq-div">
    					<%
    					SomeDAO dao = new SomeDAO();
    					String id = (String) session.getAttribute("id");
    					questionDTO qdto = new questionDTO();
    					//위에서 id 그리고 dao 객체 생성을 해뒀기 때문에 dto만 만들어서 값저장
    					qdto = dao.qInfo(id);   
    				%>
    					<div class="title-div">
    						<span class="Lspan">개인질문 정보</span>
    						<button type="button" id="updateBtn" class="btn btn-lg btn-block" >수정완료</button>
	    				</div>
    					<div class="con-div">
    					<table>
    							<tr>
    								<td class="Lattr">
    									Q1. 부먹  vs 찍먹
    								</td>
    								<td class="Rattr">
    									<input type="radio" name="q1" id="q1" value="부먹">부먹
										<input type="radio" name="q1" id="q1" value="찍먹" style="margin-left:40px">찍먹
    								</td>
    							</tr>
    							<tr>
    								<td class="Lattr">
    									Q2. 여름  vs 겨울
    								</td>
    								<td class="Rattr">
    									<input type="radio" name="q2" id="q2" value="여름">여름
    									<input type="radio" name="q2" id="q2" value="겨울" style="margin-left:40px">겨울
    								</td>
    							</tr>
    							<tr>
    								<td class="Lattr">
    									Q3. 실내  vs 야외
    								</td>
    								<td class="Rattr">
   										<input type="radio" name="q3" id="q3" value="실내">실내
    									<input type="radio" name="q3" id="q3" value="야외" style="margin-left:40px">야외
    								</td>
    							</tr>
    							<tr>
    								<td class="Lattr">
    									Q4. 카톡  vs 전화
    								</td>
    								<td class="Rattr">
    									<input type="radio" name="q4" id="q4" value="카톡">카톡
    									<input type="radio" name="q4" id="q4" value="전화" style="margin-left:40px">전화
    								</td>
    							</tr>
    							<tr>
    								<td class="Lattr">
    									Q5. 소주  vs 맥주
    								</td>
    								<td class="Rattr">
    									<input type="radio" name="q5" id="q5" value="소주">소주
    									<input type="radio" name="q5" id="q5" value="맥주" style="margin-left:40px">맥주
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

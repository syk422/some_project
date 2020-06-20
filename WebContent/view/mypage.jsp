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
  	function openInNewTab(url) {  // span을 클릭했을 경우 새탭 뛰우는 함수
  		location.href=url;
	}
  
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
  		height: 43%;
  		border: 2px solid #dea0a0;
  		margin-bottom: 15px;
  		margin-right: 15px;
  		padding: 10px;
  	}
  	#mypf-div{
  		float: right;
  		width: 48%;
  		height: 43%;
  		border: 2px solid #dea0a0;
  		margin-bottom: 15px;
  		margin-left: 15px;
  		padding: 10px;
  	}
  	#myideal-div{
  		float: left;
  		width: 48%;
  		height: 43%;
  		border: 2px solid #dea0a0;
  		margin-top: 25px;
  		margin-right: 15px;
  		padding: 10px;
  	}
  	#myq-div{
  		float: right;
  		width: 48%;
  		height: 43%;
  		border: 2px solid #dea0a0;
  		margin-top: 25px;
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
  	#btn{
    Color : black;
    border : 1px solid #ffeae8;
    background : #ffeae8;
    margin : 0px;
    width: 100px;
    height: 80px;
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
    			<p style="font-size: 4em; text-align: center;">MY PAGE
    			<button style="float:right; margin-top:25px" class="btn btn-lg btn-block" id="btn" onclick="location.href='mailbox.jsp'">쪽지함</button></p>
    			<div id="mypage-div">
    				<div id="myinfo-div">
    				<%
    					SomeDAO dao = new SomeDAO();  //select를 이용하기 위해 dao 객체 생성
    					memberDTO mdto = new memberDTO();
    					String id = (String) session.getAttribute("id");   //string으로 변환
    					mdto = dao.myInfo(id);
    				%>
    					<div class="title-div">
    						<span class="Lspan">본인정보</span>
    						<span class="Rspan" onclick="location.href='myinfo.jsp'">보안 정보 변경</span>
    					</div>
    					<div class="con-div">
    						<table>
    							<tr>
    								<td class="Lattr">
    									아이디  :
    								</td>
    								<td class="Rattr">
    									<%= session.getAttribute("id") %>
    								</td>
    							</tr>
    							<tr>
    								<td class="Lattr">
    									이름  :
    								</td>
    								<td class="Rattr">
										<%= mdto.getName() %>
    								</td>
    							</tr>
    							<tr>
    								<td class="Lattr">
    									나이  :
    								</td>
    								<td class="Rattr">
    									<%= mdto.getAge() %>
    								</td>
    							</tr>
    							<tr>
    								<td class="Lattr">
    									성별  :
    								</td>
    								<td class="Rattr">
    									<%= mdto.getGender() %>
    								</td>
    							</tr>
    						</table>
    					</div>
    				</div>
    				<div id="mypf-div">
    					<%
    					memberDTO pdto = null;
    					//위에서 id 그리고 dao 객체 생성을 해뒀기 때문에 dto만 만들어서 값저장
    					pdto = dao.myProfile(id);   
    					
    					String drink = "";
    					if(mdto.getDrink()==1)
    						drink = "전혀 마시지 않았으면 좋겠어요.";
    					else if(mdto.getDrink()==2)
    						drink = "어쩔 수 없을때만 마시면 좋겠어요.";
    					else if(mdto.getDrink()==3)
    						drink = "가끔 마셨으면 좋겠어요.";
    					else if(mdto.getDrink()==4)
    						drink = "어느정도 즐기면 좋겠어요.";
    					else 
    						drink = "자주 술자리를 가지면 좋겠어요.";
    					String smoke =""; 
    					if(mdto.getSmoke()==1)
    						smoke = "예";
    					else
    						smoke = "아니오";
    					%>
	    				<div class="title-div">
    						<span class="Lspan">본인 프로필</span>
    						<span class="Rspan" onclick="location.href='mypf.jsp'">본인 프로필 변경</span>
	    				</div>
    					<div class="con-div">
    					<table>
    							<tr>
    								<td class="Lattr">
    									지역  :
    								</td>
    								<td class="Rattr">
    									<%= pdto.getLoc() %>
    								</td>
    							</tr>
    							<tr>
    								<td class="Lattr">
    									혈액형  :
    								</td>
    								<td class="Rattr">
    									<%= pdto.getBlood() %>
    								</td>
    							</tr>
    							<tr>
    								<td class="Lattr">
    									키  :
    								</td>
    								<td class="Rattr">
    									<%= pdto.getTall() %>
    								</td>
    							</tr>
    							<tr>
    								<td class="Lattr">
    									종교  :
    								</td>
    								<td class="Rattr">
    									<%= pdto.getReli() %>
    								</td>
    							</tr>
    							<tr>
    								<td class="Lattr">
    									음주여부  :
    								</td>
    								<td style="font-size: 15px" class="Rattr">
    									<%= drink %>
    								</td>
    							</tr>
    							<tr>
    								<td class="Lattr">
    									흡연 여부
    								</td>
    								<td class="Rattr">
    									<%= smoke %>
    								</td>
    							</tr>
    							<tr>
    								<td class="Lattr">
    									MBTI 유형  :
    								</td>
    								<td class="Rattr">
    									<%= pdto.getMbtitype() %>
    								</td>
    							</tr>
    						</table>
    					</div>
    				</div>
    				<div id="myideal-div">
    				<%
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
    						<span class="Rspan" onclick="location.href='myideal.jsp'">이상형 정보 변경</span>
	    				</div>
    					<div class="con-div">
    					<table>
    							<tr>
    								<td class="Lattr">
    									이상형 키  :
    								</td>
    								<td class="Rattr">
    									<%= idto.getItall() %>
    								</td>
    							</tr>
    							<tr>
    								<td class="Lattr">
    									이상형 종교  :
    								</td>
    								<td class="Rattr">
    									<%= idto.getIreli() %>
    								</td>
    							</tr>
    							<tr>
    								<td class="Lattr">
    									이상형 음주여부  :
    								</td>
    								<td style="font-size: 15px" class="Rattr">
    									<%= idrink %>
    								</td>
    							</tr>
    							<tr>
    								<td class="Lattr">
    									이상형 흡연 여부
    								</td>
    								<td class="Rattr">
    									<%= ismoke%>
    								</td>
    							</tr>
    						</table>
    					</div>
    				</div>
    				<div id="myq-div">
    					<%
    					questionDTO qdto = new questionDTO();
    					//위에서 id 그리고 dao 객체 생성을 해뒀기 때문에 dto만 만들어서 값저장
    					qdto = dao.qInfo(id);   
    				%>
    					<div class="title-div">
    						<span class="Lspan">개인질문 정보</span>
    						<span class="Rspan" onclick="location.href='myq.jsp'">개인질문 수정</span>
	    				</div>
    					<div class="con-div">
    					<table>
    							<tr>
    								<td class="Lattr">
    									Q1. 부먹  vs 찍먹
    								</td>
    								<td class="Rattr">
    									<%= qdto.getQ1() %>
    								</td>
    							</tr>
    							<tr>
    								<td class="Lattr">
    									Q2. 여름  vs 겨울
    								</td>
    								<td class="Rattr">
    									<%= qdto.getQ2() %>
    								</td>
    							</tr>
    							<tr>
    								<td class="Lattr">
    									Q3. 실내  vs 야외
    								</td>
    								<td class="Rattr">
    									<%= qdto.getQ3() %>
    								</td>
    							</tr>
    							<tr>
    								<td class="Lattr">
    									Q4. 카톡  vs 전화
    								</td>
    								<td class="Rattr">
    									<%= qdto.getQ4() %>
    								</td>
    							</tr>
    							<tr>
    								<td class="Lattr">
    									Q5. 소주  vs 맥주
    								</td>
    								<td class="Rattr">
    									<%= qdto.getQ5() %>
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

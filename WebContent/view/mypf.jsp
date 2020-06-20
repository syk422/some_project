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
			actionValue = "pfupdate";
			locValue = $("#loc").val()
			bloodValue = $("#blood:checked").val()
			tallValue = $('#tall').val();
			reliValue = $("#reli:checked").val()
			smokeValue = $("#smoke:checked").val()
			drinkValue = $("#drink:checked").val()
			mbtitypeValue = $('#mbtitype').val();
			if (locValue == "" || bloodValue =="" ||  tallValue =="" || reliValue =="" || drinkValue =="" || smokeValue =="" || mbtitypeValue =="" ) {
				alert("모든 항목을 작성해주시길 바랍니다.")
			} else {
				$.ajax({
					url : "../control/myPageControl.jsp" ,
					data: {
						action : actionValue,
						id : '<%=session.getAttribute("id")%>',
						loc : locValue,
						blood : bloodValue,
						tall : tallValue,
						reli : reliValue,
						drink : drinkValue,
						smoke : smokeValue,
						mbtitype : mbtitypeValue
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
  	#mypf-div{
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
    				<div id="mypf-div">
    					<%
    					String id = (String) session.getAttribute("id");
    					memberDTO pdto = null;
    					memberDTO mdto = null;
    					SomeDAO dao = new SomeDAO();
    					//위에서 id 그리고 dao 객체 생성을 해뒀기 때문에 dto만 만들어서 값저장
    					pdto = dao.myProfile(id);   
    					mdto = dao.myInfo(id);
    					
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
    						<button type="button" id="updateBtn" class="btn btn-lg btn-block" >수정완료</button>
	    				</div>
    					<div class="con-div">
    					<table>
    							<tr>
    								<td class="Lattr">
    									지역  :
    								</td>
    								<td class="Rattr">
    									<select name ="loc" id="loc"  class="form-control" style="width:100%">
			    							<option value="서울">서울</option>
			    							<option value="경기">경기</option>
			    							<option value="강원">강원</option>
			    							<option value="인천">인천</option>
			    							<option value="세종">세종</option>
			    							<option value="충북">충북</option>
			    							<option value="충남">충남</option>
			    							<option value="전북">전북</option>
			    							<option value="전남">전남</option>
			    							<option value="경북">경북</option>
			    							<option value="경남">경남</option>
			    							<option value="대전">대전</option>
			    							<option value="대구">대구</option>
			    							<option value="광주">광주</option>
			    							<option value="울산">울산</option>
			    							<option value="부산">부산</option>
			    							<option value="제주">제주</option>
    									</select>
    								</td>
    							</tr>
    							<tr>
    								<td class="Lattr">
    									혈액형  :
    								</td>
    								<td class="Rattr">
    									<input type="radio" name ="blood" id="blood" value="A">A형
					    				<input type="radio" name ="blood" id="blood" value="B" style="margin-left:20px">B형
					    				<input type="radio" name ="blood" id="blood" value="O" style="margin-left:20px">O형
					    				<input type="radio" name ="blood" id="blood" value="AB" style="margin-left:20px">AB형
    								</td>
    							</tr>
    							<tr>
    								<td class="Lattr">
    									키  :
    								</td>
    								<td class="Rattr">
    									<input type="text" name="tall" id="tall" style="width: 50%"> cm
    								</td>
    							</tr>
    							<tr>
    								<td class="Lattr">
    									종교  :
    								</td>
    								<td class="Rattr">
    									<input type="radio" name ="reli" id="reli" value="기독교" style=" font-size:12px">기독교
					    				<input type="radio" name ="reli" id="reli" value="천주교" style="font-size:12px; margin-left:5px">천주교
					    				<input type="radio" name ="reli" id="reli" value="불교" style="margin-left:5px; font-size:12px">불교
					    				<input type="radio" name ="reli" id="reli" value="무교" style="margin-left:5px; font-size:12px">무교
					    				<input type="radio" name ="reli" id="reli" value="기타" style="margin-left:5px; font-size:12px">기타
    								</td>
    							</tr>
    							<tr>
    								<td class="Lattr">
    									음주여부  :
    								</td>
    								<td style="font-size: 15px" class="Rattr">
    									<select name ="drink" id="drink" class="form-control" style="width:100%">
			    							<option value="1">전혀 마시지 않아요</option>
			    							<option value="2">어쩔 수 없을때만 마셔요</option>
			    							<option value="3">가끔 마셔요</option>
			    							<option value="4">어느정도 즐기는 편이에요</option>
			    							<option value="5">자주 술자리를 가져요</option>
    									</select>
    								</td>
    							</tr>
    							<tr>
    								<td class="Lattr">
    									흡연 여부
    								</td>
    								<td class="Rattr">
    									<input type="radio" name ="smoke" id="smoke" value="1">예
    									<input type="radio" name ="smoke" id="smoke" value="2" style="margin-left:60px">아니오
    								</td>
    							</tr>
    							<tr>
    								<td class="Lattr">
    										MBTI 유형  :
    								</td>
    								<td class="Rattr">
    									<select name="mbtitype" id="mbtitype" class="form-control" style="width: 100%; ">
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

<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="model.MatAlgori"%>
<%@page import="model.allscoreDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.myidealDTO"%>
<%@page import="model.scoreDTO"%>
<%@page import="model.SomeDAO"%>
<%@page import="model.memberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String action = request.getParameter("action");
	String me = "";
	String id = request.getParameter("id");
	String gender = "";
	SomeDAO dao = new SomeDAO();
	scoreDTO dto = new scoreDTO();
	myidealDTO medto = new myidealDTO();
	myidealDTO subdto, subdto2;
	id = request.getParameter("id");
	ArrayList<allscoreDTO> score = new ArrayList<allscoreDTO>();
	int idx=0;
	me = (String) session.getAttribute("id");
	gender = (String) session.getAttribute("gender");
	subdto = dao.myMatchinginfo(me);
	subdto2 = dao.myMatchinginfo2(me);
	medto.setGender(gender);
	medto.setId(subdto.getId());
	medto.setLoc(subdto.getLoc());
	medto.setQ1(subdto.getQ1());
	medto.setQ2(subdto.getQ2());
	medto.setQ3(subdto.getQ3());
	medto.setQ4(subdto.getQ4());
	medto.setQ5(subdto.getQ5());
	medto.setBlood(subdto.getBlood());
	medto.setMbtitype(subdto.getMbtitype());
	medto.setIdrink(subdto2.getIdrink());
	medto.setIreli(subdto2.getIreli());
	medto.setIsmoke(subdto2.getIsmoke());
	medto.setItall(subdto2.getItall());
	ArrayList<scoreDTO> list = new ArrayList<scoreDTO>();
	list = dao.selectgender(gender); // 매칭 알고리즘에 필요한 이성의 정보를 불러와 arraylist에 저장.
	MatAlgori algori = new MatAlgori();
	score = algori.matAlgori(medto, list);
	for(int i = 0 ; i<score.size() ; i++){
		if(id.equals(score.get(i).getId())){
			idx = i;
		}
	}
	
    %>
<!DOCTYPE html>
<html lang="en">

<head>
  <script type="text/javascript" src="../jquery/jquery-3.4.1.js" ></script>
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <script type="text/javascript">
    google.charts.load("current", {packages:['corechart']});
    google.charts.setOnLoadCallback(drawChart);
	 function drawChart() {
	      var data = google.visualization.arrayToDataTable([
	        ["Element", "점수", { role: "style" } ],
	        ["프로필 점수", <%= score.get(idx).getPscore()%> , "#ffeae8"],
	        ["질문 점수", <%= score.get(idx).getQscore()%>, "#ffeae8"],
	        ["혈액형 점수", <%= score.get(idx).getBscore()%>, "#ffeae8"],
	        ["MBTI점수", <%= score.get(idx).getMscore()%>, "#ffeae8"]
	      ]);

	      var view = new google.visualization.DataView(data);
	      view.setColumns([0, 1,
	                       { calc: "stringify",
	                         sourceColumn: 1,
	                         type: "string",
	                         role: "annotation" },
	                       2]);

	      var options = {
	        title: "상세 점수",
	        width: 500,
	        height: 400,
	        bar: {groupWidth: "80%"},
	        legend: { position: "none" },
	      };
	      var chart = new google.visualization.ColumnChart(document.getElementById("columnchart_values"));
	      chart.draw(view, options);
	  }
	
  </script>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>S.O.M.E</title>

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/full-width-pics.css" rel="stylesheet">
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
  		height: 45%;
  		border: 2px solid #dea0a0;
  		margin-bottom: 15px;
  		margin-right: 15px;
  		padding: 10px;
  	}
  	#mypf-div{
  		float: right;
  		width: 48%;
  		height: 45%;
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
  		width: 100%;
  		height: 40%;
  		padding-top: 30px;
  		padding-bottom: 30px;
  		padding-left: 60px;
  		padding-right: 60px;
  	}
  	
  	#mbti-div{
  		width: 100%;
  		height: 40%;
  		padding-top: 30px;
  		padding-bottom: 30px;
  		padding-left: 60px;
  		padding-right: 60px;
  	}
  	#btn-div{
  		width: 100%;
  		height: 20%;
  		padding-left: 25%;
  		padding-right: 25%;
  		padding-top: 30px;
  	
  	}
  	#matchingBtn{
  		Color : balck;
		border : 1px solid #ffeae8;
		background : #ffeae8;
		margin : 0px;
		width: 100%;
  	
  	}
  	.gomatchbtn{
  		Color : balck;
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
  	
  	#explain{
  		width: 100%;
  		height: 100%;
  	}
  	
  	
  </style>
</head>

<body>
  <jsp:include page="top.jsp"></jsp:include>
  <!-- Content section -->
  <section class="p-5" >
    <div class="container-fluid" style="height: 950px">
    	<div style="height: 100%" class="row">
    		<div class="col-sm-2">
    		</div>
    				<%
    					memberDTO mdto = new memberDTO();
    					dao = new SomeDAO();
    					mdto = dao.myInfo(id);
    				%>
    		<div id="main-div" class="col-sm-8">
    				<p style="font-size: 3em; text-align: center;"><%=id %>님과 매칭되었습니다.</p>
    			<div id="mypage-div">
    				<div id="myinfo-div">
    					<div class="title-div">
    						<span class="Lspan"><%=id %>님의 정보</span>
    					</div>
    					<div class="con-div">
    						<table>
    							<tr>
    								<td class="Lattr">
    									아이디  :
    								</td>
    								<td class="Rattr">
    									<%= id %>
    								</td>
    							</tr>
    							<tr>
    								<td class="Lattr">
    									이름  :
    								</td>
    								<td class="Rattr">
										<%= mdto.getName()%>
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
    							<tr >
    								<td colspan=2 rowspan=2 class="Lattr">
    									<button onclick="window.open('message.jsp?id=<%=id %>','쪽지 보내기','width=500; height=400; top=100; left = 500; menubar=no; scrollbars=no;')" id="message-btn" type="button" class="btn btn-default btn-lg bg-dark" style="width:200px; margin-right:10px;">쪽지보내기</button>
    								</td>
    							</tr>
    						</table>
    					</div>
    				</div>
    				<div id="mypf-div">
    					<%
    					memberDTO pdto = new memberDTO();
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
    						<span class="Lspan"><%=id %>님의 프로필</span>
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
    				<div style="width: 50%;height: 45%;float: left;">
	    				<div id="columnchart_values" style="width: 100%; height: 100%;"></div>
    				</div>
    				<div style="width: 50%;height: 45%;float: left;">
	    				<div style="width: 100%; height: 100%; padding-left: 10%">
	    					<table id="explain">
	    						<tr>
	    							<td>프로필 점수 란?</td>
	    						</tr>
	    						<tr>
	    							<td style="font-size: 13px">지역 , 키 , 음주량 , 흠연여부 , 종교를 기반으로 점수를 부여했습니다.</td>
	    						</tr>
	    						<tr>
	    							<td>질문 점수란?</td>
	    						</tr>
	    						<tr>
	    							<td style="font-size: 13px">회원 가입시 실시 했던 질문들을 기반으로 점수를 부여했습니다.</td>
	    						</tr>
	    						<tr>
	    							<td>혈액형 궁합 점수란?</td>
	    						</tr>
	    						<tr>
	    							<td style="font-size: 13px">서로의 혈액형 궁합을 기반으로 점수를 부여했습니다.</td>
	    						</tr>
	    						<tr>
	    							<td>MBTI궁합 점수란?</td>
	    						</tr>
	    						<tr>
	    							<td style="font-size: 13px">서로의 MBTI 유형검사 결과를 기반으로 점수를 부여했습니다.</td>
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

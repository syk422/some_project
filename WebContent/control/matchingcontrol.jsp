<%@page import="model.MatAlgori"%>
<%@page import="model.allscoreDTO"%>
<%@page import="model.myidealDTO"%>
<%@page import="model.scoreDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.questionDTO"%>
<%@page import="model.mitDTO"%>
<%@page import="model.memberDTO"%>
<%@page import="model.SomeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%
	String action = request.getParameter("action");
	String mbtitype = request.getParameter("mbti");
	String id = "";
	String gender = "";
	SomeDAO dao = new SomeDAO();
	scoreDTO dto = new scoreDTO();
	myidealDTO medto = new myidealDTO();
	myidealDTO subdto, subdto2;
	ArrayList<allscoreDTO> score = new ArrayList<allscoreDTO>();
	int[] rank = null;
	int idx1 = 0;
	int idx2 = 0;
	int idx3 = 0;

	if (action.equals("matching")) {
		id = (String) session.getAttribute("id");
		dao.myMbtiUpdate(id, mbtitype);
		gender = (String) session.getAttribute("gender");
		subdto = dao.myMatchinginfo(id);
		subdto2 = dao.myMatchinginfo2(id);
		medto.setGender(gender);
		medto.setId(subdto.getId());
		medto.setLoc(subdto.getLoc());
		medto.setQ1(subdto.getQ1());
		medto.setQ2(subdto.getQ2());
		medto.setQ3(subdto.getQ3());
		medto.setQ4(subdto.getQ4());
		medto.setQ5(subdto.getQ5());
		medto.setBlood(subdto.getBlood());
		medto.setMbtitype(mbtitype);
		medto.setIdrink(subdto2.getIdrink());
		medto.setIreli(subdto2.getIreli());
		medto.setIsmoke(subdto2.getIsmoke());
		medto.setItall(subdto2.getItall());
		ArrayList<scoreDTO> list = new ArrayList<scoreDTO>();
		list = dao.selectgender(gender); // 매칭 알고리즘에 필요한 이성의 정보를 불러와 arraylist에 저장.

		MatAlgori algori = new MatAlgori();
		score = algori.matAlgori(medto, list);
		rank = new int[score.size()];
		for (int i = 0; i < score.size(); i++) {
			rank[i] = score.get(i).getTscore();
		}
		int max = rank[0];
		
		for (int j = 1; j < rank.length; j++) {
			if (max < rank[j]) {
				max = rank[j];
				idx1 = j;
			}
		}
		max = rank[0];

		for (int m = 1; m < rank.length; m++) {
		
			if (max < rank[m] && m != idx1) {
				max = rank[m];
				idx2 = m;
			}

		}
		max = rank[0];

		for (int n = 1; n < rank.length; n++) {
			if (max < rank[n] && n != idx1 && n != idx2) {
				max = rank[n];
				idx3 = n;
			}
		}
		int index = 0;
		
 %>

  <script type="text/javascript" src="../jquery/jquery-3.4.1.js" ></script>
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <script type="text/javascript">
	  google.charts.load('current', {'packages':['bar']});
	  google.charts.setOnLoadCallback(drawChart);
		
	  function drawChart() {
	    var data = google.visualization.arrayToDataTable([
	      ['상위 3명 회원', '프로필 점수', '질문 점수', '혈액형 궁합 점수','MBTI 궁합 점수'],
	      ['<%=score.get(idx1).getId()%>', <%=score.get(idx1).getPscore()%>, <%=score.get(idx1).getQscore()%>,<%=score.get(idx1).getBscore()%>,<%=score.get(idx1).getMscore()%>],
	      ['<%=score.get(idx2).getId()%>', <%=score.get(idx2).getPscore()%>, <%=score.get(idx2).getQscore()%>,<%=score.get(idx2).getBscore()%>,<%=score.get(idx2).getMscore()%>],
	      ['<%=score.get(idx3).getId()%>', <%=score.get(idx3).getPscore()%>, <%=score.get(idx3).getQscore()%>,<%=score.get(idx3).getBscore()%>,<%=score.get(idx3).getMscore()%>]
	    ]);  /*   <%=score.get(idx2).getTscore()%>점 <%=score.get(idx3).getTscore()%>점 */
	
	    var options = {
	      chart: {
    	    width: 1000,
	        height: 400,
	        fontSize:30,
	        title: '매칭 점수',
	        subtitle: '회원님과 잘 맞는 상위 3명의 이성입니다.',
	      },
	      hAxis:{
	    	  textStyle:{
	    		  fontSize : 20
	    	  }
	      }
	
	    };
	
	    var chart = new google.charts.Bar(document.getElementById('columnchart_material'));
	
	    chart.draw(data, google.charts.Bar.convertOptions(options));
	  }
    
  </script>


   			<div style="width: 100%; height: 10%;">
    			</div>
    			<div id="inner-div" style="width: 100%; height: 50%; /* padding-top: 10%; padding-bottom: 10% */">
    				<div id="rank1" style="width: 33%; height: 100%; float: left; text-align: center; font-size: 25px;">
    					1번 <%=score.get(idx1).getId() %> 님 
    					<br><br>
    					<div style="width: 100% ; height: 60%;">
    					<%
							if(list.get(idx1).getGender().equals("여성")){
						%>
						<img style="width: 80%; height: 100%" alt="" src="../view/img/suji.png">
						<%
							}else{
						%>	
						<img style="width: 80%; height: 100%" alt="" src="https://pbs.twimg.com/media/DwdkgT6UUAAVy4D.jpg">
						<%	
							}
    					%>
    					</div>
    					<br>
    					<span style="color : #d62e00;font-size: 20px">총점<%=score.get(idx1).getTscore()%>점</span>
    					<br>
    					<button value="<%=score.get(idx1).getId() %>" style="margin-left: 15%; margin-right: 15%; width: 70%" type="button" class="gomatchbtn" class="btn btn-lg btn-block" >매칭 시작</button>
    				</div>
    				<div id="rank2" style="width: 33%;  height: 100%; float: left; text-align: center;font-size: 25px;">
    					2번  <%=score.get(idx2).getId() %> 님
    					<br><br>
    					<div style="width: 100% ; height: 60%;">
    					<%
							if(list.get(idx1).getGender().equals("여성")){
						%>
						<img style="width: 80%; height: 100%" alt="" src="https://img.insight.co.kr/static/2019/06/28/700/07q5g2a3p3582nriafee.jpg">
						<%
							}else{
						%>	
						<img style="width: 80%; height: 100%" alt="" src="https://lh3.googleusercontent.com/proxy/KrGEVucWhhYaPL_JYwFwL9K_pUf0UZOGY4ZD8sgPSGiVOPtJ_uy8eOm9uTh3FwFfYmJimaQs1K1gp9quUmlX7LTzg5Sdx1hboFChkruOF2kARLN7ZMNzLjmI4hPFC75A4WFVSbnVvclBKqVFjNetZWi_yh4AY3GDfPQ30-TCmppfN3qZmNjMPkzp-E5taTIQbPXPC44nvIbCVCfWnJzJPb8B4cfm4ytLn8q3e8hfumvnwN5EcRqrbpNMKmBwsMmmF0TbDKp5GAdvfcSN4ZreIAzRBTev9tcFMalwknURXkT4iyoiOlcfUasDsGU_7OaV7OjS634rcK3UgghWsGOA1FanIzr23KbZ5Uiw_na4RPGxB5NeWkdFnDc">
						<%	
							}
    					%>
    					</div>
    					<br>
    					<span style="color : #d62e00;font-size: 20px">총점<%=score.get(idx2).getTscore()%>점</span>
    					<br>
    					 <button style="margin-left: 15%; margin-right: 15%; width: 70%" value="<%=score.get(idx2).getId() %>" type="button" class="gomatchbtn" class="btn btn-lg btn-block" >매칭 시작</button>
    				</div>
    				<div id="rank3" style="width: 33%;  height: 100%; float: left; text-align: center;font-size: 25px;">
    					3번 <%=score.get(idx3).getId() %> 님 	
    					<br><br>
    					<div style="width: 100% ; height: 60%;">
    					<%
							if(list.get(idx1).getGender().equals("여성")){
						%>
						<img style="width: 80%; height: 100%" alt="" src="https://cphoto.asiae.co.kr/listimglink/1/2019081123114893592_1565532708.jpg">
						<%
							}else{
						%>	
						<img style="width: 80%; height: 100%" alt="" src="https://i.pinimg.com/originals/12/23/2e/12232ee2ee317ab521134379d297b663.jpg">
						<%	
							}
    					%>
    					</div>
    					<br>
    					<span style="color : #d62e00;font-size: 20px">총점<%=score.get(idx3).getTscore()%>점</span>
    					<br>
    					<button value="<%=score.get(idx3).getId() %>" style="margin-left: 15%; margin-right: 15%; width: 70%" type="button" class="gomatchbtn" class="btn btn-lg btn-block" >매칭 시작</button>
    				</div>
    			</div>
    			<div style="width: 100%; height: 5%; padding-left:10% ; padding-right:10%;"></div>
    			<div id="columnchart_material" style="width: 100%; height: 35%; padding-left:10% ; padding-right:10%;">
   			</div>

<%
	}
	
%>


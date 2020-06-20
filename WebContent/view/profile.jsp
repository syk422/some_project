<%@page import="model.memberDTO"%>
<%@page import="model.SomeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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


<style>
.btn{
    Color : black;
    border : 1px solid #ffeae8;
    background : #ffeae8;
    margin : 0 auto;
    width: 10%;
    display:inline-block;
    margin-top: 30px;
}

#myinfo-div{
   float: left;
   width: 48%;
   height: 400px;
   border: 2px solid #dea0a0;
   padding: 10px;
}

#mypf-div{
   float: right;
   width: 48%;
   height: 400px;
   border: 2px solid #dea0a0;
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
   color:   blue;
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
   padding-top: 10px;
   padding-bottom: 10px;
}
.attr{
   font-size: 20px;
}

</style>
</head>
<body>
<jsp:include page="top.jsp"></jsp:include>
  <!-- Content section -->
<section class="p-5">
<div class="container-fluid" style="height: 570px">
<div style="height: 100%" class="row">
<div class="col-sm-2"></div>
<div id="main-div" class="col-sm-8" style="background: white;">
	
<%
   SomeDAO dao = new SomeDAO();
   memberDTO mdto = new memberDTO();
   //solveQuest.jsp에서 넘겨받은 id
   String idvalue = request.getParameter("id"); 
   //id로 검색하여 회원 데이터 mdto에 받아옴
   mdto.setId(idvalue);
   mdto = dao.select(mdto); 
   
   String drink = "";
   if(mdto.getDrink()==1)
      drink = "전혀 마시지 않아요.";
   else if(mdto.getDrink()==2)
      drink = "어쩔 수 없을때만 마셔요.";
   else if(mdto.getDrink()==3)
      drink = "가끔 마셔요.";
   else if(mdto.getDrink()==4)
      drink = "어느정도 즐기는 편이에요.";
   else 
      drink = "자주 술자리를 가져요.";
   String smoke =""; 
   if(mdto.getSmoke()==1)
      smoke = "예";
   else
      smoke = "아니오";
   
%>
<p style="font-size: 40px; text-align: center; margin:10px 0 25px;"><%=idvalue %>님의 프로필</p>
<div id="mypage-div">
<div id="myinfo-div">
		<div class="con-div">
               <table>
                  <tr>
                     <td class="attr">아이디  :</td>
                     <td class="attr"><%= idvalue%></td>
                  </tr>
                  <tr>
                     <td class="attr">이름  :</td>
                     <td class="attr"><%= mdto.getName() %></td>
                  </tr>
                  <tr>
                     <td class="attr">나이  :</td>
                     <td class="attr"><%= mdto.getAge() %></td>
                  </tr>
                  <tr>
                     <td class="attr">성별  :</td>
                     <td class="attr"><%= mdto.getGender() %></td>
                  </tr>
                  <tr>
	                 <td class="attr">사는 지역  :</td>
	                 <td class="attr"><%= mdto.getLoc() %></td>
	              </tr>
               </table>
          </div>
      </div>
<div id="mypf-div">
		<div class="con-div">
	        <table>
	              <tr>
	                 <td class="attr">혈액형  :</td>
	                 <td class="attr"><%= mdto.getBlood() %></td>
	              </tr>
	              <tr>
	                 <td class="attr">키  :</td>
	                 <td class="attr"><%= mdto.getTall() %></td>
	              </tr>
	              <tr>
	                 <td class="attr">종교  :</td>
	                 <td class="attr"><%= mdto.getReli() %></td>
	              </tr>
	              <tr>
	                 <td class="attr">음주여부  :</td>
	                 <td class="attr"><%= drink %></td>
	              </tr>
	              <tr>
	                 <td class="attr">흡연 여부</td>
	                 <td class="attr"><%= smoke %></td>
	              </tr>
	              <tr>
	                 <td class="attr">MBTI 유형  :</td>
	                 <td class="attr"><%= mdto.getMbtitype() %></td>
	              </tr>
	           </table>
			</div>
</div>
</div> <!-- mypagediv -->
</div> <!-- maindiv -->
<div class="col-sm-2"></div>
<button class="btn btn-lg btn-block" onclick="window.open('message.jsp?id=<%=idvalue %>','쪽지 보내기','width=500; height=400; top=100; left = 500; menubar=no; scrollbars=no;')">쪽지 보내기</button>
</div>
</div>
</section>
  <jsp:include page="bottom.jsp"></jsp:include>
  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


</body>
</html>
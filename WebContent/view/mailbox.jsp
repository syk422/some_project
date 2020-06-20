<%@page import="model.MessageDTO"%>
<%@page import="java.util.ArrayList"%>
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
table{
width: 60%;
margin:0 auto;
border: 3px solid #dea0a0;
}
tr {
height: 50px;
}
.btn1{
    Color : black;
    background : #ffeae8;
    width: 80%;
    height: 80%;
    margin: auto;
}
</style>
</head>
<body>
<jsp:include page="top.jsp"></jsp:include>
  <!-- Content section -->
<section class="p-5">
<div class="container-fluid" style="height: 570px;">
<div style="height: 100%;" class="row">
<div class="col-sm-1 p-2"></div>
<div class="col-sm-9" style="margin: 0, auto; background: white; text-align:center;">
<p style="font-size: 40px; text-align: center; margin:10px 0 25px;">나의 쪽지함</p>
<table border = "1">
<tr><td style="width:15%">보낸 사람</td><td style="width:70%">내용</td><td>답장하기</td></tr>
<%
String id = (String)session.getAttribute("id"); /* session에 저장된 id */
/* 본인이 받은 쪽지리스트를 보기 위해
message table에서 받은 사람 id와 일치하는 데이터 모두 검색 */
SomeDAO dao = new SomeDAO();
ArrayList<MessageDTO> list = dao.messageList(id);
/* list의 dto에서 보낸 사람 id와 쪽지내용 table에 출력 */
for(MessageDTO dto: list){
%>
<tr>
<td><%=dto.getSendid() %></td>
<td><%=dto.getContent() %></td>
<td><button class="btn1" onclick="window.open('message.jsp?id=<%=dto.getSendid() %>','쪽지 보내기','width=500; height=400; top=100; left = 500; menubar=no; scrollbars=no;')">답장하기</button></td>
</tr>
<%
}
%>
</table>
</div>
<div class="col-sm-1 p-2"></div>
</div>
</div>
</section>
<jsp:include page="bottom.jsp"></jsp:include>
  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
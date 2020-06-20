<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../jquery/jquery-3.4.1.js"></script>
<script type="text/javascript">

$(function(){
	$("#btn").click(function(){
		var inputValue = $("#input").val() /* 작성한 쪽지 내용 */
		var actionValue = "insert"
		$.ajax({
			url:"../control/messageControl.jsp",
			data:{
				/* 보내는 사람 id: 사용자 */
				sendid: "<%=session.getAttribute("id")%>", 
				/* 받는사람 id */
				receiveid: "<%=request.getParameter("id")%>",
				content: inputValue,
				action: actionValue
			},
			success:function(){
				alert("전송을 완료하였습니다")
				self.close()
			}
		})
	})
	
})
</script>
<style>
.btn{
    Color : black;
    border : 1px solid #ffeae8;
    background : #ffeae8;
    margin : 0 auto;
    width: 30%;
    height: 40px;
    display:inline-block;
    font-size: 20px;
}
#input{
	border-style: solid;
	border-color:#dea0a0;
	margin:15px auto;
	width:400px;
	height:300px;
	font-size: 15px;
}
</style>
</head>
<body>
<div style="margin:0 auto; text-align:center;">
<input id="input" placeholder="메시지를 입력해주세요">
<br>
<button class="btn btn-lg btn-block" id="btn">보내기</button>
</div>
</body>
</html>
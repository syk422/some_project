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
	  $("#pw").keyup(function() {
			pwValue = $("#pw").val()
			actionValue = "pwcheck";
			this.value = this.value.replace(/[^0-9]/g,'') /* 정수만 입력받음 */
			/* 4자리 체크 */
			if(pwValue.length == 4){
				$.ajax({
					url : "../control/myPageControl.jsp" ,
					data : {
						action : actionValue,
						id : '<%=session.getAttribute("id")%>' ,
						pw : pwValue
					},
					success : function(result) {
						if (result==0) {
							$(".d2").html("비밀번호가 같지 않습니다.")
						} else {
							$(".d2").html("<font color=green>비밀번호가 확인되었습니다.</font>")
						}
					}
				})
			}else{
				$(".d2").html("숫자 4자리를 입력해주세요")
			}
		})
		
		$("#nPw").keyup(function() {
			pwValue = $("#nPw").val()
			this.value = this.value.replace(/[^0-9]/g,'') /* 정수만 입력받음 */
			/* 4자리 체크 */
			if(pwValue.length == 4){
				$(".d3").remove()
			}else{
				$(".d3").html("숫자 4자리를 입력해주세요")
			}
		})
		$("#cnPw").keyup(function() {
			pwValue = $("#cnPw").val()
			pwValue2 = $("#nPw").val()
			this.value = this.value.replace(/[^0-9]/g,'') /* 정수만 입력받음 */
			/* 4자리 체크 */
			if(pwValue.length == 4){
				if (pwValue == pwValue2) {
					$(".d4").html("<font color=green>비밀번호가 일치합니다.</font>")
				} else {
					$(".d4").html("비밀번호가 일치하지 않습니다.")
				}

			}else{
				$(".d4").html("숫자 4자리를 입력해주세요")
			}
		})
		
		$("#updateBtn").click(function() {
			actionValue = "update"
			pw = $("#pw").val()
			pwValue2 = $("#nPw").val()
			pwValue = $("#cnPw").val()
			emailValue = $('#Email').val() +"@"+ $("#addr").val()
			telValue = $('#nTel').val()
			check = $(".d2").text()
			check2 =$(".d4").text()
			front = $('#Email').val()
			back = $("#addr").val()
			if (front=="" || back == "" || telValue=="" || pwValue2 =="" || pw =="") {
				alert("모든 값들을 입력해주시길 바랍니다.")
			} else {
				if (check=="비밀번호가 확인되었습니다." && check2 == "비밀번호가 일치합니다.") {
					$.ajax({
						url : "../control/myPageControl.jsp",
						data : {
							action : actionValue,
							pw : pwValue,
							email : emailValue,
							tel : telValue,
							id : "<%=session.getAttribute("id")%>"
						},
						success : function() {
							alert("정보 수정이 완료되었습니다")
							location.href="mypage.jsp"
						}
						
					})
				} else {
					alert("비밀번호 일치 여부 혹은 새 비밀번호 일치 여부를 확인해주시길 바랍니다.")
				}
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
  	#myinfo-div{
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
  		font-size: 20px;
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
    				<div id="myinfo-div">
    				<%
    					SomeDAO dao = new SomeDAO();  //select를 이용하기 위해 dao 객체 생성
    					memberDTO mdto = null;
    					Object Id =	session.getAttribute("id");   //object로 세션의 value값을 받아오고
    					String id = (String) Id;   //string으로 변환
    					mdto = dao.myInfo(id);
    				%>
    					<div class="title-div">
    						<span class="Lspan">본인정보</span>
    						<button type="button" id="updateBtn" class="btn btn-lg btn-block" >수정완료</button>
    					</div>
    					<div class="con-div">
    						<table>
    							<tr>
    								<td class="Lattr">
    									현재 비밀번호 확인 
    								</td>
    								<td class="Rattr">
    									<input style="text-align:center;width: 100%; height: 50%;" 
    									type="password" name="pw" id="pw" ><br>
    									<div class="d2"></div>
    								</td>
    							</tr>
    							<tr>
    								<td class="Lattr">
    									새 비밀번호
    								</td>
    								<td class="Rattr">
										<input style="text-align:center;width: 100%; height: 50%;" 
										type="password" name="nPw" id="nPw">
										<div class="d3"></div>
    								</td>
    							</tr>
    							<tr>
    								<td class="Lattr">
    									새 비밀번호 확인 
    								</td>
    								<td class="Rattr">
    									<input style="text-align:center;width: 100%; height: 50%;" 
    									type="password" name="cnPw" id="cnPw">
    									<div class="d4"></div>
    								</td>
    							</tr>
    							<tr>
    								<td class="Lattr">
    									이메일 
    								</td>
    								<td class="Rattr">
    									<%
    										String email = "";
    										if(mdto.getEmail()==null)
    											email = "없음";
    										else
    											email = mdto.getEmail();
    									%>
    									<%= email %>
    								</td>
    							</tr>
    							<tr>
    								<td class="Lattr">
    									새 이메일
    								</td>
    								<td class="Rattr" id="nEmail">
    									<input style="text-align:center; width : 40%; height: 50%;" 
    									type="text" name="Email" id="Email"> @
    									<input style="text-align:center; width : 40%; height: 50%;" 
    									type="text" name="addr" id="addr">
    								</td>
    							</tr>
    							<tr>
    								<td class="Lattr">
    									전화번호 
    								</td>
    								<td class="Rattr">
    									<%= mdto.getTel() %>
    								</td>
    							</tr>
    							<tr>
    								<td class="Lattr">
    									새 전화번호 
    								</td>
    								<td class="Rattr">
    									<input style=" text-align:center;width: 100%; height: 50%;" 
    									type="text" name="nTel" id="nTel">
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

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% int count = 0; %>
<html lang="en">

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
  
<script type="text/javascript" src="../jquery/jquery-3.4.1.js"></script>
<script type="text/javascript">

$(function(){
/* 아이디 중복 체크 */
$("#id").keyup(function(){
	var idValue = $("#id").val();
	actionValue = "idcheck";
	/* db에서 아이디 검색하여 있는지 없는지 체크 */
	$.ajax({
		url: "../control/signinControl.jsp",
		data : {
			id : idValue,
			action: actionValue
		},
		success:function(result){
			if(result == 1){/* 아이디가 존재할 경우 */
				$('.d1').html("중복된 아이디입니다.")
			}else{/* 아이디가 존재하지 않는 경우 */
				$('.d1').html("<font color=blue>사용하실 수 있는 아이디입니다.</font>")
			}
		}
	})
})
/* 비밀번호 조건 - 정수 4자리 체크 */
$("#pw").keyup(function() {
	pwValue = $("#pw").val()
	this.value = this.value.replace(/[^0-9]/g,'') /* 정수만 입력받음 */
	/* 4자리 체크 */
	if(pwValue.length == 4){
		$(".d2").html("<font color=blue>올바른 입력입니다</font>")
	}else{
		$(".d2").html("숫자 4자리를 입력해주세요")
	}
})
/* 회원가입 버튼 클릭 */
$("#btn").click(function(){
	/* 입력값 받아서 변수에 저장 */
	nameValue = $("#name").val()
	idValue = $("#id").val()
	pwValue = $("#pw").val()
	ageValue = $("#age").val()
	genderValue = $("#gender:checked").val()
	telValue = $("#tel").val()
	emailValue = $("#email").val()
	locValue = $("#loc").val()
	bloodValue = $("#blood:checked").val()
	tallValue = $("#tall").val()
	reliValue = $("#reli:checked").val()
	smokeValue = $("#smoke:checked").val()
	drinkValue = $("#drink:checked").val()
	itallValue = $("#itall").val()
	ireliValue = $("#ireli:checked").val()
	ismokeValue = $("#ismoke:checked").val()
	idrinkValue = $("#idrink:checked").val()
	q1Value = $("#q1:checked").val()
	q2Value = $("#q2:checked").val()
	q3Value = $("#q3:checked").val()
	q4Value = $("#q4:checked").val()
	q5Value = $("#q5:checked").val()
	scValue = 0
	actionValue = "insert"
	/* 하나라도 입력 안했을 경우, 모든 항목 입력 메시지 띄움 */
	if(nameValue==""||idValue==""||pwValue==""||ageValue==""||genderValue==null
			||telValue==""||emailValue==""||locValue==""||bloodValue==null||tallValue==""
			||reliValue==null||smokeValue==null||drinkValue==null||itallValue==""
			||ireliValue==null||ismokeValue==null||idrinkValue==null||q1Value==null
			||q2Value==null||q3Value==null||q4Value==null||q5Value==null){
		alert("모든 항목을 입력해주세요")
	}else{
	/* 모두 입력한 경우, db에 저장 */
		$.ajax({
		url: "../control/signinControl.jsp",
		data: {
			action: actionValue,
			name: nameValue,
			id: idValue,
			pw: pwValue,
			age: ageValue,
			gender: genderValue,
			tel: telValue,
			email: emailValue,
			loc: locValue,
			blood: bloodValue,
			tall: tallValue,
			reli: reliValue,
			smoke: smokeValue,
			drink: drinkValue,
			itall: itallValue,
			ireli: ireliValue,
			ismoke: ismokeValue,
			idrink: idrinkValue,
			q1: q1Value,
			q2: q2Value,
			q3: q3Value,
			q4: q4Value,
			q5: q5Value,
			sc: scValue
		},
		success:function(){
			alert("회원가입 완료")
			location.href="login.jsp"
		}
	})
	}
})
})
</script>

<style type="text/css">
tr{
	height: 40px;
}
.d1, .d2{
  	font-size:7px;
  	color: red;
  	margin-top:1px;
}
input[type="radio"]{
  	margin-right:3px;
}
#btn{
    Color : balck;
    border : 1px solid #ffeae8;
    background : #ffeae8;
    margin : 0px;
    width: 35%;
}
h1{
	text-align:center;
	font-size:60px;
	letter-spacing: 4px;
	margin: 0 0 30px;
}
</style>
</head>

<body>
  <jsp:include page="top.jsp"></jsp:include>
 
  <!-- Content section -->
  <section class="p-5">
    <div class="container-fluid">
    	<div class="row" style="height:1400px;">
    		<div class="col-sm-2 p-2"></div>
    		<div class="col-sm-8 p-2">
    		<h1>SOME</h1>
    			<div class="col-sm-10 p-2" style="border-style: solid; border-color:#dea0a0; margin:0 auto;">
    			<!-- 본인 정보 테이블 -->
    			<table style="margin:0 auto; width: 85%;">
    				<tr><td rowspan="13" style="padding-top : 12px;  vertical-align:top; width: 30%"><h4>개인 정보</h4></td>
    					<td style="width: 20%">이름</td>
    					<td style="width: 50%"><input name ="name" id="name" style="width:90%"></td></tr>
    				<tr><td>아이디</td><td><input name ="id" id="id" style="width:90%"><br>
    				<div class="d1"></div></td></tr>
    				<tr><td>비밀번호</td><td><input name ="pw" id="pw" style="width:90%"><br>
    				<div class="d2">숫자 4자리를 입력해주세요</div></td></tr>
    				<tr><td>나이</td><td><input name ="age" id="age" style="width:90%"></td></tr>
    				<tr><td>성별</td><td><input type="radio" name="gender" id="gender" value="남성">남성  
    				<input type="radio" name="gender" id="gender" value="여성">여성</td></tr>
    				<tr><td>전화번호</td><td><input name ="tel" id="tel" style="width:90%"></td></tr>
    				<tr><td>이메일</td><td><input name ="email" id="email" style="width:90%"></td></tr>
    				<tr>
    					<td>사는 지역</td>
    					<td><select name ="loc" id="loc" style="width:20%">
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
    						</select></td></tr>
    				<tr><td>혈액형</td><td><input type="radio" name ="blood" id="blood" value="A">A형
    				<input type="radio" name ="blood" id="blood" value="B" style="margin-left:40px">B형
    				<input type="radio" name ="blood" id="blood" value="O" style="margin-left:40px">O형
    				<input type="radio" name ="blood" id="blood" value="AB" style="margin-left:40px">AB형</td></tr>
    				<tr><td>키</td><td><input name ="tall" id="tall" style="width:90%"></td></tr>
    				<tr><td>종교</td><td><input type="radio" name ="reli" id="reli" value="기독교">기독교
    				<input type="radio" name ="reli" id="reli" value="천주교" style="margin-left:7px">천주교
    				<input type="radio" name ="reli" id="reli" value="불교" style="margin-left:7px">불교
    				<input type="radio" name ="reli" id="reli" value="무교" style="margin-left:7px">무교
    				<input type="radio" name ="reli" id="reli" value="기타" style="margin-left:7px">기타</td></tr>
    				<tr><td>흡연여부</td><td><input type="radio" name ="smoke" id="smoke" value="1">예
    				<input type="radio" name ="smoke" id="smoke" value="2" style="margin-left:60px">아니오</td></tr>
    				<tr><td>음주</td><td style="text-align:left"><input type="radio" name ="drink" id="drink" value="1">전혀 마시지 않아요<br>
    				<input type="radio" name ="drink" id="drink" value="2">어쩔 수 없을때만 마셔요<br>
    				<input type="radio" name ="drink" id="drink" value="3">가끔 마셔요<br>
    				<input type="radio" name ="drink" id="drink" value="4">어느정도 즐기는 편이에요<br>
    				<input type="radio" name ="drink" id="drink" value="5">자주 술자리를 가져요</td></tr>
    			</table>
    			<hr color="#dea0a0" style="border:0px; height:1px;">
    			<!-- 이상형 테이블 -->
    			<table style="margin:0 auto; width: 85%;">
    				<tr><td rowspan="4" style="padding-top : 12px; vertical-align:top; width: 30%"><h4>이상형 정보</h4></td>
    					<td style="width: 20%">키</td>
    					<td style="width: 50%"><select name ="itall" id="itall" style="width:90%">
		    			<option value="150">150 이상</option>
		    			<option value="160">160 이상</option>
		    			<option value="170">170 이상</option>
		    			<option value="180">180 이상</option>
		    			<option value="190">190 이상</option>
		    			<option value="0">상관 없음</option></select></td></tr>
    				<tr><td>종교</td><td><input type="radio" name ="ireli" id="ireli" value="기독교">기독교
    				<input type="radio" name ="ireli" id="ireli" value="천주교" style="margin-left:30px">천주교
    				<input type="radio" name ="ireli" id="ireli" value="불교" style="margin-left:30px">불교<br>
    				<input type="radio" name ="ireli" id="ireli" value="무교">무교
    				<input type="radio" name ="ireli" id="ireli" value="기타" style="margin-left:45px">기타
    				<input type="radio" name ="ireli" id="ireli" value="상관없음" style="margin-left:45px">상관 없음</td></tr>
    				<tr><td>흡연여부</td><td><input type="radio" name ="ismoke" id="ismoke" value="1">예
    				<input type="radio" name ="ismoke" id="ismoke" value="2" style="margin-left:60px">아니오
    				<input type="radio" name ="ismoke" id="ismoke" value="0" style="margin-left:30px">상관 없음</td></tr>
    				<tr><td>음주</td><td><input type="radio" name ="idrink" id="idrink" value="1">전혀 마시지 않았으면 좋겠어요<br>
    				<input type="radio" name ="idrink" id="idrink" value="2">어쩔 수 없을때만 마시면 좋겠어요<br>
    				<input type="radio" name ="idrink" id="idrink" value="3">가끔 마셨으면 좋겠어요<br>
    				<input type="radio" name ="idrink" id="idrink" value="4">어느정도 즐기면 좋겠어요<br>
    				<input type="radio" name ="idrink" id="idrink" value="5">자주 술자리를 가지면 좋겠어요<br>
    				<input type="radio" name ="idrink" id="idrink" value="0">상관 없음</td></tr>
    			</table>
    			<hr color="#dea0a0" style="border:0px; height:1px;">
    			<!-- 개인 질문 테이블 -->
    			<table style="margin:0 auto; width: 85%;">
    				<tr><td rowspan="10" style="padding-top : 12px; vertical-align:top; width: 30%"><h4>개인 질문</h4></td>
    					<td style="width: 20%">Q1.  소스</td>
    					<td style="width: 50%"><input type="radio" name="q1" id="q1" value="부먹">부먹
    											<input type="radio" name="q1" id="q1" value="찍먹" style="margin-left:40px">찍먹</td></tr>
    			<tr><td>Q2.  계절</td><td><input type="radio" name="q2" id="q2" value="여름">여름
    			<input type="radio" name="q2" id="q2" value="겨울" style="margin-left:40px">겨울</td></tr>
    			<tr><td>Q3.  데이트</td><td><input type="radio" name="q3" id="q3" value="실내">실내
    			<input type="radio" name="q3" id="q3" value="야외" style="margin-left:40px">야외</td></tr>
    			<tr><td>Q4.  연락</td><td><input type="radio" name="q4" id="q4" value="카톡">카톡
    			<input type="radio" name="q4" id="q4" value="전화" style="margin-left:40px">전화</td></tr>
    			<tr><td>Q5.  술</td><td><input type="radio" name="q5" id="q5" value="소주">소주
    			<input type="radio" name="q5" id="q5" value="맥주" style="margin-left:40px">맥주</td></tr>
    			
    			</table>
    			</div>
    			<div style="text-align:center"><button class="btn btn-lg btn-block" id="btn" style="display:inline-block; margin-top: 60px;">회원가입</button></div>
    			
    		</div>
    		<div class="col-sm-2 p-2"></div>
   		 </div>
    </div>
  </section>
  
  <jsp:include page="bottom.jsp"></jsp:include>

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>

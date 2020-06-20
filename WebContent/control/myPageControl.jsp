<%@page import="model.memberDTO"%>
<%@page import="model.SomeDAO"%><%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%><%
	String action = request.getParameter("action");
	int result = 0;
	SomeDAO dao = new SomeDAO();
	if(action.equals("pwcheck")){
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		result = dao.pwCheck(id, pw);
	}
	if(action.equals("update")){
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		memberDTO dto = new memberDTO();
		dto.setId(id);
		dto.setPw(pw);
		dto.setEmail(email);
		dto.setTel(tel);
		dao.myInfoUpdate(dto);
	}
	if(action.equals("pfupdate")){
	%>
	<jsp:useBean id="dto" class="model.memberDTO"></jsp:useBean>
	<jsp:setProperty property="loc" name="dto"/>
	<jsp:setProperty property="blood" name="dto"/>
	<jsp:setProperty property="tall" name="dto"/>
	<jsp:setProperty property="reli" name="dto"/>
	<jsp:setProperty property="drink" name="dto"/>
	<jsp:setProperty property="smoke" name="dto"/>
	<jsp:setProperty property="mbtitype" name="dto"/>
	<jsp:setProperty property="id" name="dto"/>
	<%
	dao.myProfileUpdate(dto);
	}
	if(action.equals("idealupdate")){
	%>
	<jsp:useBean id="dto2" class="model.mitDTO"></jsp:useBean>
	<jsp:setProperty property="itall" name="dto2"/>
	<jsp:setProperty property="ireli" name="dto2"/>
	<jsp:setProperty property="idrink" name="dto2"/>
	<jsp:setProperty property="ismoke" name="dto2"/>
	<jsp:setProperty property="id" name="dto2"/>
	<%
	dao.myidealUpdate(dto2);
	}
	if(action.equals("questionupdate")){
	%>	
	<jsp:useBean id="dto3" class="model.questionDTO"></jsp:useBean>
	<jsp:setProperty property="q1" name="dto3"/>
	<jsp:setProperty property="q2" name="dto3"/>
	<jsp:setProperty property="q3" name="dto3"/>
	<jsp:setProperty property="q4" name="dto3"/>
	<jsp:setProperty property="q5" name="dto3"/>
	<jsp:setProperty property="id" name="dto3"/>
	<%
	dao.myquestionUpdate(dto3);
	}
%><%=result %>

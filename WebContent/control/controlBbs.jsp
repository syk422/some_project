<%@page import="model.SomeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<jsp:useBean id="dto" class="model.BbsDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>
<%
	String action = request.getParameter("action");	

	if(action.equals("insert")){
		SomeDAO dao = new SomeDAO();
		int result = dao.insert(dto);
		response.sendRedirect("../view/bbs.jsp");
	}
	
%>

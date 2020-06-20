<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//세션 끊어줌.
	session.invalidate();
%>
<jsp:forward page="main.jsp"></jsp:forward>
<%@page import="model.SomeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dto" class="model.MessageDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>
<%
String action=request.getParameter("action");
SomeDAO dao = new SomeDAO();
if(action.equals("insert")){
	dao.messageInsert(dto);
}
%>
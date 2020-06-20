<%@page import="model.SomeDAO"%><%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><jsp:useBean id="dto1" class="model.memberDTO"></jsp:useBean><jsp:setProperty property="*" name="dto1"/><jsp:useBean id="dto2" class="model.mitDTO"></jsp:useBean><jsp:setProperty property="*" name="dto2"/><jsp:useBean id="dto3" class="model.questionDTO"></jsp:useBean><jsp:setProperty property="*" name="dto3"/><%
 	SomeDAO dao = new SomeDAO();
 	String action=request.getParameter("action");
 	/* insert 처리 */
 	if(action.equals("insert")){
 		dao.memberInsert(dto1);
 		dao.mitInsert(dto2);
 		dao.questInsert(dto3);
 	}
 	/* 아이디 중복체크 처리 */
 	int result = 0;
 	if(action.equals("idcheck")){
 		result = dao.idOver(dto1);
 	}
%><%=result %>
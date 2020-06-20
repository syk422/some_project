<%@page import="model.SomeDAO"%>
<%@page import="model.solveDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dto" class="model.solveDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>
<%
SomeDAO dao = new SomeDAO();
dao.solveInsert(dto);
%>
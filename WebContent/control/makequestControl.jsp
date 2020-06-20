<%@page import="model.makequestDTO"%><%@page import="java.util.ArrayList"%><%@page import="model.SomeDAO"%><%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><jsp:useBean id="dto" class="model.makequestDTO"></jsp:useBean><jsp:setProperty property="category" name="dto"/>
<%
	SomeDAO dao = new SomeDAO();
	/* makequest table에서 category로 검색 */
	ArrayList<makequestDTO> list = dao.questionList(dto); 
	/* 질문 리스트 하나씩 꺼내서 select box의 option으로 내보냄 */
%><% for(makequestDTO dto2:list){ %>
<option value='<%=dto2.getQuestion()%>'><%=dto2.getQuestion()%></option>
<% } %>
		    		
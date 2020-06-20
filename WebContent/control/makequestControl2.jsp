<%@page import="model.makequestDTO"%><%@page import="java.util.ArrayList"%><%@page import="model.SomeDAO"%><%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%
String question = request.getParameter("question");
SomeDAO dao = new SomeDAO();
/* makequest table에서 question으로 검색 */
makequestDTO dto2 = dao.answerList(question); 
/* dto에서 하나씩 꺼내서 selectbox의 option으로 내보냄 */
%><option value='<%=dto2.getAnswer1()%>'><%=dto2.getAnswer1()%></option>
<option value='<%=dto2.getAnswer2()%>'><%=dto2.getAnswer2()%></option>
<option value='<%=dto2.getAnswer3()%>'><%=dto2.getAnswer3()%></option>

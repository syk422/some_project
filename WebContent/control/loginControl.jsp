<%@page import="model.memberDTO"%>
<%@page import="model.SomeDAO"%><%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><jsp:useBean id="dto" class="model.memberDTO"></jsp:useBean><jsp:setProperty property="id" name="dto"/><jsp:setProperty property="pw" name="dto"/><%
 	SomeDAO dao = new SomeDAO();
    /* id, pw로 검색하여 존재여부 int로 받아옴 */
 	int result = dao.loginCheck(dto);
 	/* 해당 id의 gender, blood 데이터 dto로 가져옴 */
    String id = request.getParameter("id");
    memberDTO dto2 = new memberDTO();
    dto2 = dao.myInfo(id); 
 	if(result==1){ /* 존재하면 세션에 id, gender, blood 저장 */
 		session.setAttribute("id", dto.getId());
 		session.setAttribute("gender", dto2.getGender());
 		session.setAttribute("blood", dto2.getBlood());
 	}
%><%=result %>
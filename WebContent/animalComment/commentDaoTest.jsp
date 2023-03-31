<%@page import="com.lec.animalAdoption.dao.AnimalCommentDao"%>
<%@page import="com.lec.animalAdoption.dto.AnimalCommentDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%
	AnimalCommentDao acDao = AnimalCommentDao.getInstance();
	int result = 0;
	%>

	<h2>1. 댓글 리스트 출력</h2>
	<%
	int ano = 2;
	ArrayList<AnimalCommentDto> commentList = acDao.getCommentList(ano);
	for(AnimalCommentDto comment : commentList){
		out.print(comment + "<br>");
	}
	%>
	
	<h2>2. 댓글 작성</h2>
	<%
	String mid = "member";
	ano = 3;
	String accontent = "제가 입양하고 싶어요";
	String acip = "195.0.0.1";
	AnimalCommentDto comment = new AnimalCommentDto(0, mid, ano, accontent, null, acip);
	result = acDao.writeComment(comment);
	%>
	<%=result == 0 ? "댓글 작성 실패" : "댓글 작성 성공" %>
	
	<h2>3. 댓글 수정</h2>
	<%
	accontent = "다른 강아지들이랑 잘 지내나요?";
	acip = "195.0.0.1";
	int acno = 3;
	AnimalCommentDto modifyComment = new AnimalCommentDto(acno, "0", 0, accontent, null, acip);
	
	result = acDao.modifyComment(modifyComment);
	%>
	<%=result == 0 ? "댓글 수정 실패" : "댓글 수정 성공" %>
	<%-- 
	<h2>4. 댓글 삭제</h2>
	<%
	acno = 2;
	result = acDao.deleteComment(acno);
	%>
	<%=result == 0 ? "댓글 삭제 실패" : "댓글 삭제 성공" %>
	 --%>
</body>
</html>
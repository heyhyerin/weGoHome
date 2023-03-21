<%@page import="com.lec.animalAdoption.dto.LikeListDto"%>
<%@page import="com.lec.animalAdoption.dao.LikeListDao"%>
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
	LikeListDao lDao = LikeListDao.getInstance();
	int result = 0;
	%>
	
	<h2>1. 관심동물 등록</h2>
	<%
	String mid = "test2";
	int ano = 10;
	LikeListDto likeList = new LikeListDto(0, mid, ano);
	result = lDao.addLikeList(likeList);
	%>
	<%=result == 0 ? "관심동물 등록 실패" : "관심동물 등록 성공" %>
	<%-- 
	<h2>2. 관심동물 해제</h2>
	<%
	result = lDao.removeLikeList(ano);
	%>
	<%=result == 0 ? "관심동물 해제 실패" : "관심동물 해제 성공" %> --%>
	
</body>
</html>
<%@page import="com.lec.animalAdoption.dto.ShelterDto"%>
<%@page import="com.lec.animalAdoption.dao.ShelterDao"%>
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
	<h2>1. 보호소 로그인</h2>
	<%
	ShelterDao sDao = ShelterDao.getInstance();
	String sid = "SHELTER1";
	String spw = "111";
	int result = ShelterDao.FAIL;
	
	result = sDao.loginShelter(sid, spw);
	%>
	sid: <%=sid %>  |  spw: <%=spw %>
	<%=result == 0 ? "로그인 실패" : "로그인 성공"%>
	
	<h2>2. 보호소 정보 조회</h2>
	<%
	ShelterDto shelter = sDao.getShelter(sid);
	%>
	SHELTER1 :<%=shelter %>
	
	<h2>3. 보호소 정보 수정</h2>
	<%
	spw = "111";
	String sname = "서울 유기동물 보호소";
	String stel = "02-975-1111";
	String semail = "seoul@animal.co.kr";
	String saddress = "서울시 용산구";
	sid = "SHELTER1";
	
	result = sDao.modifyShelter(shelter);
	%>
	<%=result == 0 ? "보호소 정보수정 실패" : "보호소 정보수정 성공"%><br>
	<%=shelter %>
</body>
</html>
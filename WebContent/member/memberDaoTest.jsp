<%@page import="com.lec.animalAdoption.dto.MemberDto"%>
<%@page import="com.lec.animalAdoption.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%-- 	
	<h2>1. 사용자 회원가입</h2>
	<h4>1-1. id 중복확인</h4>
	<%
	String midConfirm = "test2";
	int result = MemberDao.EXISTENT;
	MemberDao mDao = MemberDao.getInstance();
	result = mDao.idConfirm(midConfirm);
	%>
	<%=midConfirm%>는
	<%=result == 1 ? "중복된 id 입니다" : "사용 가능한 id 입니다"%>

	<h4>1-2. email 중복확인</h4>
	<%
	String memailConfirm = "test2@gmail.com";
	result = mDao.emailConfirm(memailConfirm);
	%>
	<%=memailConfirm%>는
	<%=result == 1 ? "중복된 email 입니다" : "사용 가능한 email 입니다"%>

	<h4>1-3. 회원가입</h4>
	<%
	String mid = "bbb";
	String mpw = "111";
	String mname = "김지우";
	String mtel = "010-3333-3333";
	String memail = "pokett@gmail.com";
	String mgender = "M";
	String maddress = "서울시 종로구";
	MemberDto member = new MemberDto(mid, mpw, mname, mtel, memail, mgender, null, maddress);
	
	result = mDao.joinMember(member);
	%>
	<%=result == 0 ? "회원가입 실패" : "회원가입 성공"%><br>
	<%=member %>

	<h2>2. 로그인</h2>
	<%
	result = mDao.loginMember(mid, mpw);
	%>
	mid: <%=mid %>  |  mpw: <%=mpw %>
	<%=result == 0 ? "로그인 실패" : "로그인 성공"%>

	<h2>3. 회원정보 조회</h2>
	<%
	mid = "aaa";
	member = mDao.getMember(mid);
	%>
	mid : aaa<%=member %> --%>
	<%-- 
	<h2>4. 회원정보 수정</h2>
	<%
	MemberDao mDao = MemberDao.getInstance();
	int result = 0;
	
	String mid = "bbb";
	String mpw = "111";
	String mtel = "010-3333-3333";
	String memail = "poket@gmail.com";
	String mgender = "M";
	String maddress = "서울시 종로구";
	MemberDto member = new MemberDto(mid, mpw, null, mtel, memail, mgender, null, maddress);
	
	result = mDao.modifyMember(member);
	%> 
	<%=result == 0 ? "회원 정보수정 실패" : "회원 정보수정 성공"%><br>
	<%=member %>
	 --%>
	<h2>5. 회원탈퇴</h2>
	<%
	MemberDao mDao = MemberDao.getInstance();
	String mid = "kim";
	String mpw = "111";
	%>
	
	<%int result = mDao.withDrawalMember(mid);%>
	<%=result == 0 ? "회원 탈퇴 실패" : "회원 탈퇴 성공"%><br>
	
</body>
</html>
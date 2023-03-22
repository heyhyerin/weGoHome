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
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&family=Outfit:wght@400;500;600&display=swap"
	rel="stylesheet">
<style type="text/css">
header {
	background-color: white;
	border-bottom: 3px solid #FF5514;
}

header a {
	text-decoration: none;
	font-weight: 500;
}

header li {
	list-style: none;
}

/* container */
header .container {
	width: 1100px;
	margin: 0 auto;
	padding: 10px;
	display: flex;
	align-items: center;
	justify-content: space-between;
}

/* .logo */
header .logo {
	cursor: pointer;
	flex-grow: 1;
}

/* .lnb */
header .lnb {
	position: relative;
	flex-grow: 2;
}

header .lnb ul>li {
	float: left;
	padding: 5px;
	margin-right: 30px;
}

header .lnb li a {
	color: black;
	font-size: 16pt;
}

header .lnb li a:hover {
	color: #FF5514;
	font-weight: bold;
}

/* .lnb .dropdown */
header .lnb ul li .dropdown {
	display: none;
}

header .lnb ul li:hover .dropdown {
	display: block;
	margin-top: 10px;
}

header .lnb ul li:hover .dropdown li {
	margin-top: 8px;
}

header .lnb ul li:hover .dropdown li a {
	font-size: 12pt;
	font-weight: 400;
}

header .lnb ul li:hover .dropdown li a:hover {
	color: #FF5514;
	font-weight: 500;
}

/* .gnb */
header .gnb {
	flex-grow: 1;
}

header .gnb button {
	float: right;
	margin-left: 10px;
	font-size: 14px;
}

header .gnb ul li {
	float: right;
	margin-left: 20px;
}

header .gnb li a {
	color: black;
}
</style>
</head>
<body>
	<header>
		<div class="container">
			<div class="logo">
				<img alt="logo" src="${conPath }/img/logo.png"
					onclick="location.href='${conPath}/main.do'">
			</div>
			<div class="lnb">
				<ul>
					<li><a href="">위고홈 소개</a></li>
					<li><a href="">활동</a></li>
					<li><a href="">참여⋅봉사</a>
						<ol class="dropdown">
							<li><a href="">길고양이</a></li>
							<li><a href="">동물실험</a></li>
							<li><a href="">법과정책</a></li>
							<li><a href="">전시동물</a></li>
						</ol></li>
					<li><a href="">입양하기</a></li>
					<li><a href="">입양 후기</a></li>
				</ul>
			</div>
			<c:if test="${empty member }">
				<div class="gnb">
					<button class="btn"
						onclick="location.href='${conPath}/loginView.do'" >Sign-up</button>
					<button class="btn-outline" 
						onclick="location.href='${conPath}/joinView.do'" >Register</button>
				</div>
			</c:if>
			<c:if test="${not empty member}">
				<div class="gnb">
					<ul>
						<li><a href="${conPath }/logout.do">로그아웃</a></li>
						<li><a href="">정보 수정</a></li>
						<li><b>${member.mname }</b>님</li>
					</ul>
				</div>
			</c:if>
		</div>
		<!-- container -->
	</header>
</body>
</html>
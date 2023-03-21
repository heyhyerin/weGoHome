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
<style type="text/css">
* {
	padding: 0;
	margin: 0;
}

header {
	background-color: #FF5514;
}

header a {
	text-decoration: none;
	font-weight: bold;
}

header li {
	list-style: none;
}

/* .gnb */
header .gnb {
	width: 1100px;
	margin: 0 auto;
	overflow: hidden;
}

header .gnb ul {
	float: right;
	width: 260px;
	height: 30px;
	line-height: 30px;
}

header .gnb ul li {
	float: right;
	margin-left: 30px;
	font-size: 12px;
}

header .gnb ul li a{
	color: white;
}

/* wrap */
header .wrap {
	width: 1100px;
	margin: 0 auto;
	overflow: hidden;
}

/* .logo */
header .logo {
	float: left;
	width: 240px;
	height: 100px;
	font-size: 30px;
	cursor: pointer;
	color: white;
}

/* .lnb */
header .lnb {
	float: left;
	height: 100px;
	top: 60px;
	position: relative; /*서브메뉴가 main영역 위로 */
	/* overflow: hidden; */
}

header .lnb ul {
	width: 750px;
	float: right;
}

header .lnb ul > li {
	float: left;
	padding: 5px;
	line-height: 25px;
	margin-right: 30px;
}

header .lnb ul li:hover{
	border-bottom: 3px solid white; 
}

header .lnb li a {
	color: white;
}

/* .lnb .subMenu */
header .lnb ul li .subMenu {
	display: none;
}

header .lnb ul li:hover .subMenu {
	display: block;
	background-color: #FF5514;
}

header .lnb ul li:hover .subMenu li a{
	display: block;
	background-color: #white;
}

</style>
</head>
<body>
	<header>
		<div class="gnb">
			<ul>
				<li><a href="">English</a></li>
				<li><a href="">회원가입</a></li>
				<li><a href="">로그인</a></li>
			</ul>
		</div>
		<div class="wrap">
			<div class="logo">
				<b>Wego<br>Home!</b>
			</div>
			<div class="lnb">
				<ul>
					<li><a href="">소개말</a></li>
					<li><a href="">활동</a></li>
					<li><a href="">참여⋅봉사</a>
						<ol class="subMenu">
							<li><a href="">교육⋅문화</a></li>
							<li><a href="">길고양이</a></li>
							<li><a href="">동물실험</a></li>
							<li><a href="">반려동물</a></li>
							<li><a href="">법과정책</a></li>
							<li><a href="">전시⋅야생동물</a></li>
						</ol>
					</li>
					<li><a href="">입양하기</a></li>
					<li><a href="">정보⋅소식</a></li>
				</ul>
			</div>
		</div><!-- wrap -->
	</header>
</body>
</html>
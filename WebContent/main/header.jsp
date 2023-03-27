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
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&family=Outfit:wght@400;500;600&display=swap"
	rel="stylesheet">

<style>
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

/* ---------- 회원 메뉴 드롭다운 ---------- */
.dropdown{
  position : relative;
  display : inline-block;
}

.dropbtn{
  cursor : pointer;
}

.dropdown-content{
  display : none;
  position : absolute;
  z-index : 1; /*다른 요소들보다 앞에 배치*/
  font-weight: 400;
  background-color: #ffffff;
  min-width : 150px;
  border-radius: 10px;
  border: 1px solid #eeeeee;
  overflow: hidden;
}

.dropdown-content a{
  display : block;
  text-decoration : none;
  color : #444444;
  font-size: 14px;
  padding : 12px 20px;
}

.dropdown-content a:hover{
 	background-color: #efefef;
}

.dropdown:hover .dropdown-content {
  display: block;
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
					<li><a href="">참여⋅봉사</a></li>
					<li>
						<c:if test="${not empty member }">
							<a href="${conPath }/animalBoardList.do?mid=${member.mid}">입양하기</a>
						</c:if>
						<c:if test="${empty member }">
							<a href="${conPath }/animalBoardList.do">입양하기</a>
						</c:if>
					</li>
					<li><a href="${conPath }/reviewBoardList.do">입양 후기</a></li>
				</ul>
			</div>
			<!-- 로그아웃 gnb -->
			<c:if test="${empty member && empty shelter}">
				<div class="gnb">
					<button class="signBtn"
						onclick="location.href='${conPath}/loginView.do'" >Sign-in</button>
					<button class="signBtn-outline" 
						onclick="location.href='${conPath}/joinView.do'" >Register</button>
				</div>
			</c:if>
			
			<!-- 회원 gnb -->
			<c:if test="${not empty member}">
				<div class="gnb">
					<ul>
						<li><a href="${conPath }/logout.do">로그아웃</a></li>
						<!-- 회원 메뉴 드롭 다운 -->
						<li class="nav-item dropdown">
							<a class="dropbtn">
								<b>${member.mname }</b>님▾
							</a>
							<div class="dropdown-content">
								<a class="dropdown-item" href="${conPath }/memberView.do">회원정보 수정</a> 
								<a class="dropdown-item" href="#">나의 관심 동물</a> 
								<a class="dropdown-item" href="#">내가 작성한 글</a>
							</div> 
						</li>
					</ul>
				</div>
			</c:if>

			<!-- 보호소 로그온 gnb -->
			<c:if test="${not empty shelter}">
				<div class="gnb">
					<ul>
						<li><a href="${conPath }/logout.do">로그아웃</a></li>
						<!-- 회원 메뉴 드롭 다운 -->
						<li class="nav-item dropdown">
							<a class="dropbtn">
								<b>${shelter.sname }</b>님▾
							</a>
							<div class="dropdown-content">
								<a class="dropdown-item" href="${conPath }/shelterView.do">보호소 정보 수정</a> 
								<a class="dropdown-item" href="#">보호 동물 현황 관리</a> 
							</div> 
						</li>
					</ul>
				</div>
			</c:if>
			
		</div>
		<!-- container -->
	</header>
</body>
</html>
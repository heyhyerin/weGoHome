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
<style type="text/css">
.main {
	/* background: #aaaaaa; */
}

.main .container {
	width: 1200px;
	height: 480px;
	margin: 0 auto;
	background-image: url(${conPath}/img/main_img.png);
	display: flex;
	align-items: center;
}

/* content */
.main .container .content {
	flex-wrap: wrap;
	margin-left: 60px;
}

.main .container .content h1 {
	font-size: 24pt;
	color: white;
}

.main .container .content b {
	color: white;
	font-family: 'Outfit', sans-serif;
	font-size: 16pt;
	padding-top: 10px;
}

.main .container .content button.btn-outline {
	color: white;
	border: 2px solid white;
	margin-top: 15px;
}

/* section */
.main .section {
	width: 1200px;
	height: 80px;
	background-color: #FF4600;
	margin: 20px auto;
}

.main .section p {
	color: white;
	position: absolute;
	margin-top: 15px;
	margin-left: 60px;
}

.main .absolute {
	position: absolute;
    bottom: 50px; 
    right: 50px;
}

</style>
</head>
<body>
	<c:if test="${not empty logoutMsg }">
		<script>
			alert('${logoutMsg}');
		</script>
	</c:if>

	<jsp:include page="../main/header.jsp" />
	<div class="main">
		<div class="container">
			<div class="content">
				<b>We Go Home Together!</b>
				<h1>
					위고홈은 전국의<br>보호소의 유기동물과 사람을 이어주는<br>따듯한 서비스입니다.
				</h1>
				<button class="btn-outline">보호중인 동물 확인하기&#128073;</button>
			</div><!-- content -->
		</div><!-- container -->
		<div class="section">
			<p>
				위고홈은 정부후원금 없이 오직 시민의 후원으로 활동합니다.<br>
				한국 가이드스타에서 동물단체 중 유일하게 2020 2021 연속 책무성 및 투명성, 재무안정성 및 효율성 모두 최고 별점을 받았습니다.
			</p>
		</div>
		<div class="absolute">
			<img alt="문의하기" src="${conPath }/img/QnA_icon.png">
		</div>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>
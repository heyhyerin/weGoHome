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
div#main {
	width: 1100px;
	margin: 0 auto;
	display: flex;
	flex-direction: column;
	justify-content: center;
}

/* 메인배너 */
div.main-banner {
	width: 1100px;
	height: 420px;
	background-image: url(${conPath}/img/main_img.png);
	padding: 40px;
	display: flex;
	flex-direction: column;
	justify-content: center;
	box-sizing: border-box;
	
}

.main-banner .content{
	color: white;
}

.main-banner .content h1{
	margin: 5px 0 12px;
}

.main-banner .content button.signBtn-outline{
	color: #222222;
	font-weight: bold;
}

/* 하단 2분할 배너 */
.half-banner:nth-child(1) {
	background-image: url(${conPath}/img/sub_img01.png);
}

.half-banner:nth-child(2) {
	background-image: url(${conPath}/img/sub_img02.png);
}

.half-banner p {
	color: white;
	font-size: 18px;
}

</style>
</head>
<body>
	<!-- --------------- user --------------- -->
	<!-- 로그인 결과 출력 -->
	<!-- 로그아웃 결과 출력 -->
	<!-- 회원탈퇴 결과 출력 -->
	<c:if test="${not empty resultMsg }">
		<script>
			alert('${resultMsg}');
		</script>
	</c:if>
	<c:if test="${not empty resultErrorMsg }">
		<script>
			alert('${resultErrorMsg}');
			history.back();
		</script>
	</c:if>

	<jsp:include page="../main/header.jsp" />
	<div id="main">
		<div class="main-banner">
			<div class="content">
				<b>We Go Home Together!</b>
				<h1>
					위고홈은 전국의<br>보호소의 유기동물과 사람을 이어주는<br>따뜻한 서비스입니다.
				</h1>
				<button class="signBtn-outline">보호중인 동물 확인하기&#128073;</button>
			</div>
		</div>
		<!-- main-banner -->
		<div class="red-banner">
			<p>
				<b>위고홈은 정부후원금 없이 오직 시민의 후원으로 활동합니다.</b><br> 한국 가이드스타에서 동물단체 중 유일하게
				2020 2021 연속 책무성 및 투명성, 재무안정성 및 효율성 모두 최고 별점을 받았습니다.
			</p>
		</div>
		<div class="container-col">
			<div class="half-banner">
				<p>위고홈은 더 나은<br><b>반려문화를 위해 노력합니다.</b></p>
			</div>	
			<div class="half-banner">
				<p>[3월] 더 홈 센터 단체/기업 봉사 후기</p>
			</div>	
		</div>
		<!-- container-col -->
	</div>
	<div class="launcher">
		<img alt="문의하기" src="${conPath }/img/QnA_icon.png">
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>
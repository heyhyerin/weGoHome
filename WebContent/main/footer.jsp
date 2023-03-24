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
<style type="text/css">
footer {
	background-color: #eeeeee;
}

/* container */
footer .container {
	width: 1100px;
	margin: 0 auto;
	padding: 20px 10px;
	display: flex;
	align-items: flex-end;
	justify-content: space-between;
}

footer .container p{
	font-size: 8pt;
	font-weight: 400;
	color: gray;
	margin: 10px;
}


/* footer-left */
footer .container .footer-left{
	flex-grow: 1;
}

/* footer-right */
footer .container .right{
	flex-grow: 1;
}

</style>
</head>
<body>
	<footer>
		<div class="container">
			<div class="footer-left">
				<p>
					<span><b>사)WEGOHOME 위고홈</b></span>
					<span>서울특별시 성동구 독서당로 166 (우)04736</span>
					<span>대표: 김밤</span>
					<br>
					<span>MAIL  info@wegohome.org</span>
					<span>TEL  02-2018-0401</span>
					<span>FAX  02-2018-0401</span>
					<span>사업자등록번호  410-82-11332</span>
				</p>
				<p class="font-Outfit">
					COPYRIGHT 2023 WEGOHOME. ALL RIGHT RESERVED
				</p>
			</div>
			<div class="footer-right">
				<p>
					본 사이트는 개인 프로젝트를 위한 비상업용 사이트입니다.
				<br>
					데이터 출처 <b>농림축산식품부 / 포인핸드 / 동물권행동 카라</b>
				</p>
			</div>
		</div>
	</footer>
</body>
</html>
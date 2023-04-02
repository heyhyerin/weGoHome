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
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
</head>
<body>
	<div id="wrap">
		<div class="error">
			<img alt="에러이미지" src="${conPath }/img/500error_img.png">
			<h2 class="margin">잠시 후 다시 확인해 주세요!</h2>
			<p>지금 이 서비스와 연결할 수 없습니다.<br>
			문제를 해결하기 위해 열심히 노력하고 있습니다.<br>
			잠시 후 다시 확인해 주세요.</p>
			<p class="margin">
				<button class="btn" 
					onclick="location.href='${conPath}/main.do'">메인으로</button>
			</p>
		</div>
	</div>
</body>
</html>
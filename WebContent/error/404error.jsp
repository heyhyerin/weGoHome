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
			<img alt="에러이미지" src="${conPath }/img/404error_img.png">
			<h2 class="margin">다시 한번 확인해 주세요!</h2>
			<p>지금 입력하신 주소의 페이지는<br>
			사라졌거나 다른 페이지로 변경되었습니다.<br>
			주소를 다시 확인해 주세요.</p>
			<p class="margin">
				<button class="btn" 
					onclick="location.href='${conPath}/main.do'">메인으로</button>
			</p>
		</div>
	</div>
</body>
</html>
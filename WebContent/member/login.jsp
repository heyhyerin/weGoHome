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
.container_center table p {
	height: 40px;
	line-height: 40px;
}
</style>
</head>
<body>
	<c:if test="${not empty joinResult }">
		<script>
			alert('${joinResult}');
		</script>
	</c:if>

	<jsp:include page="../main/header.jsp" />
	<div id="content_form">
		<!-- 로그인 form -->
		<form action="${conPath }/login.do" method="post">
			<div class="container_center">
				<table>
					<caption>Sign up</caption>
					<tr>
						<td>
						<p>아이디:</p> 
						<c:if test="${empty mid }">
							<input type="text" name="mid">
						</c:if>
						<c:if test="${not empty mid }">
							<input type="text" name="mid" value="${mid }">
						</c:if>
						</td>
					</tr>
					<tr>
						<td>
						<p>비밀번호:</p>
						<input type="password" name="mpw"></td>
					</tr>
					<tr>
						<td>
							<input type="submit" value="로그인" class="btn-submit">
						</td>
					</tr>
				</table>
			</div>
		</form>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>
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
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<style>
.dataTable .data-input {
	width: 95%
}

.dataTable th {
	width: 200px;
}

.dataTable td.center {
	padding: 40px;
}
</style>
</head>
<body>
	<c:if test="${empty member }">
		<script>
			location.href = '${conPath}/loginView.do?next=reviewBoardWriteView.do';
		</script>
	</c:if>
	
	<jsp:include page="../main/header.jsp" />
	<div id="wrap">
		<h2>게시물 작성</h2>
		<form action="${conPath }/reviewBoardWrite.do" method="post" enctype="multipart/form-data">
			<table class="dataTable">
				<tr>
					<th>제목<b class="red">&nbsp;*</b></th>
					<td>
						<input type="text" name="rtitle" class="data-input" required="required">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<textarea name="rcontent" required="required"
							placeholder="인터넷은 우리가 함께 만들어가는 소중한 공간입니다. 글 작성 시 타인에 대한 배려와 책임을 담아주세요."></textarea>
					</td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td>
						<input type="file" name="rphoto">
					</td>
				</tr>
				<tr>
					<th>비밀번호<b class="red">&nbsp;*</b></th>
					<td>
						<input type="password" name="rpw" class="data-input" required="required"
							placeholder="비밀번호는 글 삭제 시 작성해야 합니다.">
					</td>
				<tr>
					<td colspan="2" class="center">
						<input type="submit" value="작성" class="btn">
						<input type="button" value="글목록" class="btn-grey" onclick="${conPath}/reviewBoardList.do">
					</td>
				</tr>
			</table>
		</form>

	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>
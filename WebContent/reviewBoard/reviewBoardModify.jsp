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
	<c:if test="${empty member && empty shelter}">
		<script>
			location.href = '${conPath}/loginView.do?next=reviewBoardList.do';
		</script>
	</c:if>
	
	<jsp:include page="../main/header.jsp" />
	<div id="wrap">
		<h2>게시물 수정</h2>
		<form action="${conPath }/reviewBoardModify.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="pageNum" value="${param.pageNum }">
			<input type="hidden" name="rno" value="${review.rno }">
			<input type="hidden" name="rphoto" value="${review.rphoto }">
			
			<table class="dataTable">
				<tr>
					<th>제목<b class="red">&nbsp;*</b></th>
					<td>
						<input type="text" name="rtitle" class="data-input" required="required" value="${review.rtitle }">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<textarea name="rcontent" required="required">${review.rcontent }</textarea>
					</td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td>
						<input type="file" name="rphoto">
					</td>
				</tr>
				<tr>
					<td colspan="2" class="center">
						<input type="submit" value="수정" class="btn">
						<input type="button" value="글목록" class="btn-grey" onclick="location.href='${conPath}/reviewBoardList.do'">
					</td>
				</tr>
			</table>
		</form>

	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>
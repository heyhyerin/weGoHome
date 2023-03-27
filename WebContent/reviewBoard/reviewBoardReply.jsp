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
	<c:if test="${empty member && empty shelter }">
		<script>
			location.href = '${conPath}/loginView.do?next=reviewBoardWriteView.do';
		</script>
	</c:if>
	
	<jsp:include page="../main/header.jsp" />
	<div id="wrap">
		<h2>답변 게시물 작성</h2>
		<form action="${conPath }/reviewBoardReply.do" method="post" enctype="multipart/form-data">
			<input type="text" name="rgroup" value="${originReview.rgroup }">
			<input type="text" name="rstep" value="${originReview.rstep }">
			<input type="text" name="rindent" value="${originReview.rindent }">
			<input type="text" name="pageNum" value="${param.pageNum }">
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
							><&nbsp;${originReview.rtitle }&nbsp;> 답변글입니다. &#10;</textarea>
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
							placeholder="비밀번호는 글 수정 시 사용됩니다.">
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
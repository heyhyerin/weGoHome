<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<div class="commentContent">
		<form action="${conPath }/commentModify.do">
			<input type="hidden" name="acno" value="${comment.acno }">
			<input type="hidden" name="mid" value="${comment.mid }">
			<input type="hidden" name="ano" value="${comment.ano }">
			<textarea name="accontent" required="required" class="textarea-comment" >${comment.accontent }</textarea>
			<span class="span-comment">${comment.mid }<span>|</span>${comment.acrdate }</span>
			<span class="span-comment">
				<input type="submit" value="문의글 수정" class="btn">
				<input type="button" value="취소" class="btn-grey" onclick="history.back()">
			</span>
		</form>
	</div>
</body>
</html>
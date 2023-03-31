<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<div class="commentContent">
		<form action="${conPath }/commentReply.do">
			<input type="hidden" name="ano" value="${originComment.ano }">
			<input type="hidden" name="acgroup" value="${originComment.acgroup }">
			<input type="hidden" name="acstep" value="${originComment.acstep}">
			
			<textarea name="accontent" required="required" class="textarea-comment" >안녕하세요 ${originComment.name }님,</textarea>
			<span class="span-comment">
				<input type="button" value="취소" class="btn-grey" onclick="location.reload()">
				<input type="submit" value="작성" class="btn">
			</span>
		</form>
	</div>
</body>
</html>
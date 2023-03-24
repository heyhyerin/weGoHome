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
<style>
</style>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
	
</script>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div id="wrap">
		<h2>입양 후기 게시판</h2>
			<table class="contentTable">
				<tr>
					<td>
						<h1>${review.rtitle }</h1>
					</td>
				</tr>
				<tr>
					<td>
						${review.name }<span>|</span>
						${review.rrdate }<span>|</span>
						<b>조회수&nbsp;</b>${review.rhit }
					</td>
				</tr>
				<tr>
					<td>
						<textarea name="rcontent" required="required"
							>${review.rcontent }</textarea>
					</td>
				</tr>
				<!-- 멤버로 로그인 시 -->
				<c:if test="${review.mid eq member.mid }">
					<tr>
						<td>
							<input type="button" value="삭제" name="deleteBtn" class="btn-grey" onclick="location.href='${conPath}/reviewBoardDelete.do?rno=${review.rno }'">
							<input type="button" value="수정" class="btn-grey" onclick="${conPath}/reviewBoardList.do">
						</td>
					</tr>
				</c:if>
				
				<!-- 보호소 계정으로 로그인 시 -->
				<c:if test="${review.sid eq member.sid }">
					<tr>
						<td>
							<input type="button" value="삭제" class="btn-grey" onclick="location.href='${conPath}/reviewBoardDelete.do?rno=${review.rno }'">
							<input type="button" value="수정" class="btn-grey" onclick="${conPath}/reviewBoardList.do">
						</td>
					</tr>
				</c:if>
				
				<!-- 내가 작성한 글이 아닌 경우 -->
				<c:if test="${review.mid != member.mid || review.sid != shelter.sid}">
					<tr>
						<td>
							<input type="button" value="답변작성" class="btn-grey" onclick="location.href='${conPath}/reviewBoardList.do'">
							<input type="button" value="목록" class="btn-grey" onclick="${conPath}/reviewBoardList.do">
						</td>
					</tr>
				</c:if>
			</table>

	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>
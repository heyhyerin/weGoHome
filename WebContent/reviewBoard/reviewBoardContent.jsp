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
</head>
<body>
	<!-- 게시글 수정 결과 출력 -->
	<c:if test="${not empty resultMsg }">
		<script>
			alert('${resultMsg}')
		</script>
	</c:if>
	<c:if test="${not empty resultErrorMsg }">
		<script>
			alert('${resultErrorMsg}')
			history.back();
		</script>
	</c:if>

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
				<td>${review.name }<span>|</span> ${review.rrdate }<span>|</span>
					<b>조회수&nbsp;</b>${review.rhit }
				</td>
			</tr>
			<tr>
				<td><textarea name="rcontent" required="required"
						disabled="disabled">${review.rcontent }</textarea></td>
			</tr>
			<!-- 첨부 이미지가 있는 경우 -->
			<c:if test="${not empty review.rphoto}">
				<tr>
					<td class="center"><img alt="첨부이미지"
						src="${conPath }/reviewBoardUp/${review.rphoto}"></td>
				</tr>
			</c:if>
			<!-- 로그아웃 상태인 경우 -->
			<c:if test="${empty member && empty shelter}">
				<tr>
					<td><b>답글은 로그인 후 작성할 수 있습니다.</b></td>
				</tr>
			</c:if>

			<!-- 멤버로 로그인 시 -->
			<c:if test="${not empty member && review.mid eq member.mid }">
				<tr>
					<td><input type="button" value="수정" class="btn-grey"
							onclick="location.href='${conPath}/reviewBoardModifyView.do?rno=${review.rno }&pageNum=${param.pageNum }'">
						<input type="button" value="글목록" class="btn-grey"
							onclick="location.href='${conPath}/reviewBoardList.do'">
					</td>
				</tr>
			</c:if>
			<!-- 보호소 계정으로 로그인 시 -->
			<c:if test="${not empty shelter && review.sid eq shelter.sid }">
				<tr>
					<td><input type="button" value="수정" class="btn-grey"
							onclick="location.href='${conPath}/reviewBoardModifyView.do?rno=${review.rno }&pageNum=${param.pageNum }'">
						<input type="button" value="글목록" class="btn-grey"
							onclick="location.href='${conPath}/reviewBoardList.do'">
					</td>
				</tr>
			</c:if>

			<!-- 내가 작성한 글이 아닌 경우 -->
			<c:if test="${review.mid != member.mid && review.sid != shelter.sid}">
				<tr>
					<td><input type="button" value="답변작성" class="btn-grey"
							onclick="location.href='${conPath}/reviewBoardReplyView.do'">
						<input type="button" value="목록" class="btn-grey"
							onclick="location.href='${conPath}/reviewBoardList.do'">
					</td>
				</tr>
			</c:if>

		</table>

	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>
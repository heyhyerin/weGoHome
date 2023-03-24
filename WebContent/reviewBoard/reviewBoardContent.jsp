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
	/* 게시글 삭제 시 비밀번호 확인 */
	$(function() {
		$('#deleteBtn').click(function() {
			var pwChk = $('#pwChk').val();
			if(pwChk == ""){
				alert("게시글 삭제 시 비밀번호를 입력해 주세요.");
				return false;
			} else if (pwChk != '${review.rpw}'){
				alert("비밀번호가 일치하지 않습니다.");
				return false;
			} else {
				location.href='${conPath}/reviewBoardDelete.do?rno=${review.rno }';
			}
		});
	});
</script>
</head>
<body>
	<!-- 게시글 수정 결과 출력 -->
	<c:if test="${not empty withDrawalResult }">
		<script>
			alert('${withDrawalResult}')
		</script>
	</c:if>
	<c:if test="${not empty withDrawalResultError }">
		<script>
			alert('${withDrawalResultError}')
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
					<td>
						${review.name }<span>|</span>
						${review.rrdate }<span>|</span>
						<b>조회수&nbsp;</b>${review.rhit }
					</td>
				</tr>
				<tr>
					<td>
						<textarea name="rcontent" required="required" disabled="disabled"
							>${review.rcontent }</textarea>
					</td>
				</tr>
				<!-- 첨부 이미지가 있는 경우 -->
				<c:if test="${not empty review.rphoto}">
					<tr>
						<td class="center">
							<img alt="첨부이미지" src="${conPath }/reviewBoardUp/${review.rphoto}">
						</td>
					</tr>
				</c:if>
				<!-- 로그아웃 상태인 경우 -->
				
				<!-- 멤버로 로그인 시 -->
				<c:if test="${not empty member && review.mid eq member.mid }">
					<tr>
						<td>
							<input type="button" value="수정" class="btn-grey" 
								onclick="location.href='${conPath}/reviewBoardModifyView.do?rno=${review.rno }&pageNum=${param.pageNum }'">
							<input type="button" value="삭제" id="deleteBtn" class="btn-grey">
							<input type="password" id="pwChk" class="data-input" placeholder="삭제시 비밀번호를 입력해 주세요.">
						</td>
					</tr>
				</c:if>
				
				<!-- 보호소 계정으로 로그인 시 -->
				<c:if test="${not empty shelter && review.sid eq shelter.sid }">
					<tr>
						<td>
							<input type="button" value="수정" class="btn-grey" onclick="location.href='${conPath}/reviewBoardModifyView.do?rno=${review.rno }pageNum=${param.pageNum }'">
							<input type="button" value="삭제" id="deleteBtn" class="btn-grey">
							<input type="password" id="pwChk" class="data-input" placeholder="삭제시 비밀번호를 입력해 주세요.">
						</td>
					</tr>
				</c:if>
				
				<!-- 내가 작성한 글이 아닌 경우 -->
				<c:if test="${review.mid != member.mid && review.sid != shelter.sid}">
					<tr>
						<td>
							<input type="button" value="답변작성" class="btn-grey" onclick="location.href='${conPath}/reviewBoardList.do'">
							<input type="button" value="목록" class="btn-grey" onclick="location.href='${conPath}/reviewBoardList.do'">
						</td>
					</tr>
				</c:if>
				
			</table>

	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>
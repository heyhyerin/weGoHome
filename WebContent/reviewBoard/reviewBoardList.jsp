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
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<style>
.dataTable td:not(.td-tltle) {
	text-align: center;
}

.dataTable h4{
	color: #bbbbbb;
	padding: 20px;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
	$(document).ready(function() {
		$('tr').click(function() {
			var rno = Number($(this).children().eq(0).text()); // 0번째 td안의 있는 text;
			// alert(rid);
			if (!isNaN(rno)) {
				location.href = '${conPath }/reviewBoardContent.do?rno='+ rno
					+ '&pageNum=${pageNum}';
			}
		});
	});
</script>
</head>
<body>
	<!-- 게시물 작성 결과 출력 -->
	<!-- 게시물 수정 결과 출력 -->
	<c:if test="${not empty resultMsg}">
		<script>
			alert('${resultMsg}')
		</script>
	</c:if>
	<c:if test="${not empty resultErrorMsg}">
		<script>
			alert('${resultErrorMsg}')
			history.back();
		</script>
	</c:if>

	<jsp:include page="../main/header.jsp" />
	<div id="wrap">
		<h1>입양 후기 게시판</h1>
		<div class="div-search">
			<form action="${conPath}/reviewSearch.do">
				<input type="text" name="searchBox" id="searchBox" class="data-input" placeholder="검색어를 입력하세요">
				<button class="btn-grey">검색</button>
				<c:if test="${not empty member || not empty shelter }">
					<input type="button" value="글 작성" class="btn" onclick="location.href='reviewBoardWriteView.do'">
				</c:if>
			</form>
		</div>
		
		<table class="dataTable">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>날짜</th>
			</tr>
			<c:if test="${totCnt == 0}">
				<tr>
					<td colspan="5"><h4>등록된 게시글이 없습니다.</h4></td>
				</tr>
			</c:if>
			<c:if test="${totCnt != 0}">
				<c:forEach var="review" items="${reviewList }">
					<tr>
						<td>${review.rno }</td>
						<td class="td-tltle">
							<c:forEach var="i" begin="1" end="${review.rindent }">
								<c:if test="${i == review.rindent }">
									 &nbsp; ㄴ
									</c:if>
								<c:if test="${i != review.rindent }">
									 &nbsp; &nbsp; 
									</c:if>
							</c:forEach>${review.rtitle }</td>
						<td>${review.name }</td>
						<td>${review.rhit }</td>
						<td>
							<fmt:formatDate value="${review.rrdate }" type="date" dateStyle="short" />
						</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>

		<div class="paging">
			<c:if test="${startPage > BLOCKSIZE }">
				<a href="${conPath }/boardList.do?pageNum=${startPage-1}"> 이전 </a>
			</c:if>
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<c:if test="${i == pageNum }">
					<b class="red"> ${i } </b>
				</c:if>
				<c:if test="${i != pageNum }">
					<a href="${conPath }/boardList.do?pageNum=${i}"> ${i } </a>
				</c:if>
			</c:forEach>
			<c:if test="${endPage<pageCnt }">
				<a href="${conPath }/boardList.do?pageNum=${endPage+1}"> 다음 </a>
			</c:if>
		</div>

	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>
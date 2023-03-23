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
	<jsp:include page="../main/header.jsp" />
	<div id="content_form">
		<div class="container_center">
			<div class="div_title">
				<h2>입양후기 게시판</h2>
			</div>
			<table class="board">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>조회수</th>
					<th>날짜</th>
				</tr>
				<c:if test="${totCnt == 0}">
					<tr>
						<td colspan="5">등록된 게시글이 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${totCnt != 0}">
					<c:forEach var="review" items="${reviewList }">
						<tr>
							<td>${review.rno }</td>
							<td><c:forEach var="i" begin="1" end="${review.rindent }">
									<c:if test="${i == review.rindent }">
										ㄴ
									</c:if>
									<c:if test="${i != review.rindent }">
										 &nbsp; &nbsp; 
									</c:if>
								</c:forEach>${review.rtitle }</td>
							<td>${review.mname }</td>
							<td>${review.rhit }</td>
							<td><fmt:formatDate value="${review.rdate }" type="date"
									dateStyle="short" /></td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
		</div>
		<div class="paging">
			<c:if test="${startPage > BLOCKSIZE }">
				[ <a href="${conPath }/boardList.do?pageNum=${startPage-1}"> 이전
				</a> ]
			</c:if>
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<c:if test="${i == pageNum }">
					<b> [ ${i } ] </b>
				</c:if>
				<c:if test="${i != pageNum }">
					[ <a href="${conPath }/boardList.do?pageNum=${i}"> ${i } </a> ]
				</c:if>
			</c:forEach>
			<c:if test="${endPage<pageCnt }">
			  [ <a href="${conPath }/boardList.do?pageNum=${endPage+1}"> 다음 </a> ]
			</c:if>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>
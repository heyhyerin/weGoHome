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
	.div-search span{
		color: #aaaaaa;
		line-height: 34px;
		margin-right: 10px;
	}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
	$(document).ready(function() {
		$('tr').click(function() {
			var ano = Number($(this).children().eq(0).text().substr(4));
			if (!isNaN(ano)){
				location.href='${conPath}/animalContent.do?ano='+ano;
			}
		});
	});

</script>
</head>
<body>
	<!-- 로그아웃 상태일 경우 로그인 페이지로  -->
	<c:if test="${empty shelter }">
		<script>
			location.href = '${conPath}/loginView.do?next=animalList.do';
		</script>
	</c:if>

	<!-- 보호동물 게시글 작성 결과 출력 -->
	<!-- 보호동물 게시물 수정 결과 출력 -->
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
	
		<h1>보호 동물 관리</h1>
		<div class="div-search">
			<input type="button" value="글 작성" class="btn" onclick="location.href='animalWriteView.do'">
			<span>total: ${totCnt }</span>
		</div>
		
		<table class="dataTable">
			<tr>
				<th>공고번호</th>
				<th>품종</th>
				<th>성별(중성화)</th>
				<th>추정나이</th>
				<th>몸무게</th>
				<th>등록일</th>
				<th>입양현황</th>
				<th>관심수</th>
			</tr>
			
			<!-- 등록된 보호 동물 수 == 0 -->
			<c:if test="${totCnt == 0}">
				<tr>
					<td colspan="8">등록된 게시글이 없습니다.</td>
				</tr>
			</c:if>
			
			<!-- 등록된 보호 동물 수 > 0 -->
			<c:if test="${totCnt != 0}">
				<c:forEach var="animal" items="${animalList }">
					<tr>
						<td>wgh-${animal.ano }</td>
						<td>${animal.abreed }</td>
						<td>${animal.agender }</td>
						<td>${animal.aage }</td>
						<td>${animal.aweight }</td>
						<td>
							<fmt:formatDate value="${animal.ardate }" type="date" dateStyle="short" />
						</td>
						<td>
							<c:if test="${animal.aadopt eq 'PROTECT'}">
								<b class="red">보호중</b>
							</c:if>
							<c:if test="${animal.aadopt eq 'ADOPT'}">
								<b>입양완료</b>
							</c:if>
						</td>
						<td>${animal.likeChk }</td>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
/* 검색창 */
.container-col:first-child{
	padding: 20px;
	background-color: #eeeeee;
	border-radius: 10px;
	box-sizing: border-box;
	align-items: flex-end;
}

.animalBox {
	width: 250px;
	height: 335px;
	box-shadow: 0 0 2px 0 #bbbbbb;
	margin-bottom: 30px;
	border-radius: 10px;
	overflow: hidden;
	cursor: pointer;
}

.animalBox:not(:nth-child(4n)){
	margin-right:33.3px;
}

.animalBox img.board-img{
	width: 250px;
	height: 200px;
}

.animalBox .content {
	width: 160px;
	padding: 10px 20px;
	font-size: 12pt;
}

.animalBox .content b {
	color: #aaaaaa;
	font-size: 10pt;
}

.animalBox span.heart{
	position: relative;
	bottom: 112px;
	left: 200px;
	cursor: pointer;
}

.serchBox{
	width: 180px;
	padding: 10px;
}

.serchBox select, .search-input {
	width: 180px;
	height: 34px;
	padding: 5px 10px;
	margin-top: 15px;
	outline: none;
	border: 2px solid #dddddd;
	border-radius: 8px;
	box-sizing: border-box;
}

</style>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
	$(function() {
		// 상세보기
		$('div.animalBox').click(function() {
			var ano = $(this).children().eq(0).val();
			// alert(ano);
			location.href="${conPath}/animalContent.do?ano="+ano;
		});
		
		
		// 관심동물 등록
		$('.heart').click(function() {
			var ano = $(this).children().eq(0).val();
			// var mid = document.getElementById("member");
			// 세션에 있는 member의 mid 필요 **
			var mid = sessionStorage.getItem('mid');
			alert(ano);
			alert(mid);
			$.ajax({
				url: '${conPath}/LikeListAdd.do',
				data: 'mid=' + mid + '&ano=' + ano,
				type: 'get',
				dataType: 'html',
				success: function() {
					$('.heart').html(data);
				},
				/* error: function() {
					alert('로그인 이후 이용가능한 서비스 입니다.');
				}, */
			}); // ajax
		});
	});

</script>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div id="wrap">
		<h1>입양하기</h1>
		<!-- 유기동물 검색 -->
		<form action="${conPath }/animalSearch.do">
		<div class="container-col">
			<div class="serchBox">
				<h3>동물구분</h3>
				<p>개/고양이<p>
				<select name="abreed" >
					<option value="" selected="selected">ALL</option>
					<option value="개">개</option>
					<option value="고양이">고양이</option>
				</select>
			</div>
			<div class="serchBox">
				<h3>성별</h3>
				<p>수컷/암컷<p>
				<select name="agender" >
					<option value="" selected="selected">ALL</option>
					<option value="수컷">수컷</option>
					<option value="암컷">암컷</option>
				</select>
			</div>
			<div class="serchBox">
				<h3>크기</h3>
				<p>대/중/소<p>
				<select name="aweight" >
					<option value="0/99" selected="selected">ALL</option>
					<option value="0/8">소형견(8kg 미만)</option>
					<option value="8/18">중형견(8~18kg 미만)</option>
					<option value="18/99">대형견 (18kg 이상)</option>
				</select>
			</div>
			<div class="serchBox">
				<h3>보호소명</h3>
				<p>animal adoption<p>
				<input type="search" name="sname" class="search-input">
			</div>
			<div class="serchBox">
				<input type="submit" value="검색" class="btn">
				<input type="reset" value="취소" class="btn-grey">
			</div>
		</div>
		</form>
	
		<!-- 유기동물 목록 4x3 -->
		<div class="container-image">
			<c:if test="${not empty animalList }">
				<c:forEach var="animal" items="${animalList }">
					<div class="animalBox">
						<input type="hidden" name="ano" value="${animal.ano }">
						<img alt="보호 동물 프로필 사진" src="${conPath }/animalImgUp/${animal.aphoto }" class="board-img">
						<div class="content">
							<h2>${animal.abreed }</h2>
							<p>
								${animal.agender }<br>
								${animal.aage }살 추정 / ${animal.aweight }kg<br>
								<b>${animal.sname }</b>
							</p>
						</div>
						<span class="heart">
							<input type="hidden" name="ano" value="${animal.ano }">
							<img alt="관심동물 표시" src="${conPath }/img/heart-line.png">
						</span>
					</div>
				</c:forEach>
			</c:if>
		</div><!-- 유기동물 목록 -->
		
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
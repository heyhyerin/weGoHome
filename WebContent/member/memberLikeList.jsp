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
.container-col{
	padding: 20px 30px;
	height: 158px;
	color: white;
	border-radius: 10px;
	box-sizing: border-box;
	align-items: flex-end;
	background-image: url(${conPath}/img/content-banner.png);
}

.container-col p{
	margin: 10px 0;
	font-size: 12.5px;
}

.container-col span{
	margin: 10px 0;
	font-size: 18px;
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

.animalBox .clickBox{
	width: 250px;
	height: 200px;
	overflow: hidden;
}

.animalBox .clickBox img.board-img{
	width: 250px;
	position: center;
}

.animalBox .content {
	padding: 10px 20px;
	font-size: 12pt;
}

.animalBox .content b {
	color: #aaaaaa;
	font-size: 10pt;
}

.animalBox div.heart{
	position: relative;
	bottom: 40px;
	left: 198px;
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
		$('.clickBox').click(function() {
			var ano = $(this).children().eq(0).val();
			location.href='${conPath}/animalContent.do?ano=' + ano;
		});
		
		$('div.heart-fill').click(function() {
			var ano = $(this).children().eq(0).val();
			location.href='${conPath}/mlikeListRemove.do?mid=${member.mid}&ano=' + ano;
		});
		
	});

</script>
</head>
<body>
	<!-- 로그아웃 상태일 경우 로그인 페이지로  -->
	<c:if test="${empty member }">
		<script>
			location.href = '${conPath}/loginView.do?next=memberView.do';
		</script>
	</c:if>

	<jsp:include page="../main/header.jsp" />
	<div id="wrap">
		<h1>나의 관심 동물</h1>
		
		<div class="container-col">
			<div>
				<p>
					<span>
					펫숍 쇼윈도에 진열된 동물의 이면에는 또 다른 생명의 고통이 있을 수 있습니다.<br>
					입양은 가장 실천적인 동물구호 활동입니다.
					</span>
				</p>
				<p>
					보호중인 동물 소유자는 자세히 보기를 참고하시어 해당시군구 및 동물보호센터로 문의하시기 바랍니다.<br> 동물보호센터 및 동물병원
					근무시간은 09:00 ~ 18:00이므로 문의전화는 근무시간에만 가능합니다.
				</p>
			</div>
		</div>
		
		<!-- 유기동물 목록 4x3 -->
		<div class="container-image">
		
			<!-- 검색 결과가 없을 때 -->
			<c:if test="${empty animalList}">
				<div class="center">
					<img alt="검색결과없음 이미지" src="${conPath }/img/sch-noimg.png"><br>
					<h1>아직 관심있는 동물이 없어요!</h1>
				</div>
			</c:if>
		
			<c:if test="${not empty animalList }">
				<c:forEach var="animal" items="${animalList }">
					<div class="animalBox">
						<div class="clickBox">
							<input type="hidden" name="ano" value="${animal.ano }">
							<img alt="보호 동물 프로필 사진" src="${conPath }/animalImgUp/${animal.aphoto }" class="board-img">
						</div>
						<div class="content">
							<h2>${animal.abreed }</h2>
							<p>
								${animal.agender }<br>
								${animal.aage }살 추정 / ${animal.aweight }kg<br>
								<b>${animal.sname }</b>
							</p>
						</div>

						<div class="heart">
							<c:if test="${animal.likeChk != 0}">
								<div class="heart-fill">
									<input type="hidden" name="ano" value="${animal.ano }">
									<img alt="관심동물 표시" src="${conPath }/img/heart-fill.png">
								</div>
							</c:if>
						</div>
					</div>
				</c:forEach>
			</c:if>
		</div>

		<div class="paging" >
			<c:if test="${startPage > BLOCKSIZE }">
				<a href="${conPath }/memberLikeList.do?pageNum=${startPage-1}"><b class="grey" > 이전 &nbsp;&nbsp;</b></a>
			</c:if>
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<c:if test="${i == pageNum }">
					<b class="red" > ${i }&nbsp; </b>
				</c:if>
				<c:if test="${i != pageNum }">
					<a href="${conPath }/memberLikeList.do?pageNum=${i}&order_by=${order_by}">
					<b class="grey" > ${i }&nbsp; </b></a>
				</c:if>
			</c:forEach>
			<c:if test="${endPage < pageCnt }">
				<a href="${conPath }/memberLikeList.do?pageNum=${endPage+1}"><b class="grey" >&nbsp;&nbsp; 다음 </b></a>
			</c:if>
		</div>
		
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>

</html>
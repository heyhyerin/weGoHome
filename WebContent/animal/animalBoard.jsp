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
		var member = '${member}'
		// 상세보기
		$('.clickBox').click(function() {
			var ano = $(this).children().eq(0).val();
			location.href='${conPath}/animalContent.do?ano=' + ano;
		});
		
		$('div.heart-line').click(function() {
			if(!member){
				alert('로그인 후 이용 가능한 서비스입니다.');
				location.href='${conPath}/loginView.do';
			} else {
				var ano = $(this).children().eq(0).val();
				location.href='${conPath}/likeListAdd.do?mid=${member.mid}&ano=' + ano;
			};
		});
		
		$('div.heart-fill').click(function() {
			var ano = $(this).children().eq(0).val();
			location.href='${conPath}/likeListRemove.do?mid=${member.mid}&ano=' + ano;
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
		<input type="hidden" name="pageNum" value="${pageNum }">
			<div class="serchBox">
				<h3>동물 구분</h3>
				<p>개/고양이<p>
				<select name="abreed">
					<option value="" <c:if test="${param.abreed == ''}">selected="selected"</c:if>>ALL</option>
					<option value="개" <c:if test="${param.abreed == '개' }">selected="selected"</c:if>>개</option>
					<option value="고양이" <c:if test="${param.abreed == '고양이' }">selected="selected"</c:if>>고양이</option>
				</select>
			</div>
			<div class="serchBox">
				<h3>성별</h3>
				<p>수컷/암컷<p>
				<select name="agender" >
					<option value="" <c:if test="${param.agender == '' }">selected="selected"</c:if>>ALL</option>
					<option value="수컷" <c:if test="${param.agender == '수컷' }">selected="selected"</c:if>>수컷</option>
					<option value="암컷" <c:if test="${param.agender == '암컷' }">selected="selected"</c:if>>암컷</option>
				</select>
			</div>
			<div class="serchBox">
				<h3>크기</h3>
				<p>대/중/소<p>
				<select name="aweight" >
					<option value="0/99" <c:if test="${param.aweight == '' }">selected="selected"</c:if>>ALL</option>
					<option value="0/8" <c:if test="${param.aweight == '0/8' }">selected="selected"</c:if>>소형견(8kg 미만)</option>
					<option value="8/18" <c:if test="${param.aweight == '8/8' }">selected="selected"</c:if>>중형견(8~18kg 미만)</option>
					<option value="18/99" <c:if test="${param.aweight == '18/99' }">selected="selected"</c:if>>대형견 (18kg 이상)</option>
				</select>
			</div>
			<div class="serchBox">
				<h3>보호소 명</h3>
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
		
			<!-- 검색 결과가 없을 때 -->
			<c:if test="${empty animalList}">
				<div class="center">
					<img alt="검색결과없음 이미지" src="${conPath }/img/sch-noimg.png"><br>
					<h1>검색 결과가 없습니다.</h1>
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
						
						<!-- 사용자 로그인 또는 비로그인 시 관심동물 표시 -->
						<c:if test="${empty shelter }">
							<div class="heart">
								<c:if test="${animal.likeChk eq 0}">
									<div class="heart-line">
										<input type="hidden" name="ano" value="${animal.ano }">
										<img alt="관심동물 표시" src="${conPath }/img/heart-line.png">
									</div>
								</c:if>
								<c:if test="${animal.likeChk != 0}">
									<div class="heart-fill">
										<input type="hidden" name="ano" value="${animal.ano }">
										<img alt="관심동물 표시" src="${conPath }/img/heart-fill.png">
									</div>
								</c:if>
							</div>
						</c:if>
					</div>
				</c:forEach>
			</c:if>
		</div>
		
		<div class="paging" >
			<c:if test="${startPage > BLOCKSIZE }">
				<a href="${conPath }/animalBoardList.do?pageNum=${startPage-1}"><b class="grey" > 이전 &nbsp;&nbsp;</b></a>
			</c:if>
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<c:if test="${i == pageNum }">
					<b class="red" > ${i }&nbsp; </b>
				</c:if>
				<c:if test="${i != pageNum }">
					<a href="${conPath }/animalBoardList.do?pageNum=${i}&order_by=${order_by}">
					<b class="grey" > ${i }&nbsp; </b></a>
				</c:if>
			</c:forEach>
			<c:if test="${endPage < pageCnt }">
				<a href="${conPath }/animalBoardList.do?pageNum=${endPage+1}"><b class="grey" >&nbsp;&nbsp; 다음 </b></a>
			</c:if>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>
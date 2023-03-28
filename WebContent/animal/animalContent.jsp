<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
.animal-content{
	width: 800px;
	height: 340px;
	border-top: none;
}

/* 탭 전체 스타일 */
.tabs {
	padding-top: 40px;
	width: 800px;
	margin: 0 auto;
}

/* 탭 스타일 */
.tab_item {
	width: calc(100%/ 2);
	height: 50px;
	border-bottom: 3px solid #FF4600;
	line-height: 50px;
	font-size: 16px;
	text-align: center;
	color: #aaaaaa;
	display: block;
	float: left;
	text-align: center;
	font-weight: bold;
	transition: all 0.3s ease;
}

/* 라디오 버튼 UI삭제*/
input[name="tab_item"] {
	display: none;
}

/* 탭 컨텐츠 스타일 */
.tab_content {
	display: none;
	clear: both;
	overflow: hidden;
}

/* 선택 된 탭 콘텐츠를 표시 */
#all:checked ~ #all_content, #programming:checked ~ #programming_content, #design:checked 
	 ~ #design_content {
	display: block;
}

/* 선택된 탭 스타일 */
.tabs input:checked+.tab_item {
	background-color: #FF4600;
	color: #ffffff;
	border-radius: 8px 8px 0 0;
}

.commentBox {
	width: 700px;
	height: auto;
	padding:20px;
	margin-top: 20px;
	background-color: #eeeeee;
	border-radius: 10px;
	margin: 0 auto;
} 

.commentBox:last-child {
	height: 135px;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
</head>
<body>
	<!-- 댓글 작성 결과 -->
	<c:if test="${not empty resultMsg }">
		<script>
			alert('${resultMsg}');
		</script>
	</c:if>
	<c:if test="${not empty resultErrorMsg }">
		<script>
			alert('${resultErrorMsg}');
			history.back();
		</script>
	</c:if>

	<jsp:include page="../main/header.jsp" />
	<div id="wrap">
		<h1>보호동물 정보</h1>
		<table class="contentTable">
			<tr>
				<td colspan="2">
					<h1>${animal.abreed }</h1>
					<b class="red">WGH-${animal.ano }</b>
				</td>
				<th colspan="2" rowspan="7" class="board-img">
					<img alt="보호동물 사진" src="${conPath }/animalImgUp/${animal.aphoto}">
				</th>
			</tr>
			<tr>
				<th>성별(중성화)</th>
				<td>${animal.agender }</td>
			</tr>
			<tr>
				<th>추정나이</th>
				<td>${animal.aage }살</td>
			</tr>
			<tr>
				<th>몸무게</th>
				<td>${animal.aweight }kg</td>
			</tr>
			<tr>
				<th>구조장소</th>
				<td>${animal.aaddress}</td>
			</tr>
			<tr>
				<th>등록일</th>
				<td>${animal.ardate}</td>
			</tr>
			<tr>
				<th>입양현황</th>
				<td>${animal.aadopt}</td>
			</tr>
			<tr>
				<td colspan="4">
			
			<div class="tabs">
				<input id="all" type="radio" name="tab_item" checked>
				<label class="tab_item" for="all">상세정보</label>
				<input id="programming" type="radio" name="tab_item">
				<label class="tab_item" for="programming">문의</label>

				<!-- 상세정보 -->
				<div class="tab_content" id="all_content">
					<div class="textarea-comment">
						<pre>${animal.acontent }</pre>
					</div>
				</div>
				
				<!-- 문의 -->
				<div class="tab_content" id="programming_content">
						<!-- 문의글 출력 -->
						<c:if test="${not empty commentList }">
							<c:forEach var="comment" items="${commentList }">
								<div class="commentBox">
									<pre>${comment.accontent }</pre>
									${comment.mid }<span>|</span>${comment.acrdate }
								</div>	
							</c:forEach>
						</c:if>
						
					<form action="${conPath }/commentWrite.do">
						<div class="commentBox">
							<input type="hidden" name="mid" value="${member.mid }">
							<input type="hidden" name="ano" value="${animal.ano }">
							<textarea name="accontent" required="required" class="textarea-comment" ></textarea>
							
							<c:if test="${empty member }">
								<pre>문의글은 로그인 후 작성할 수 있습니다.</pre>
							</c:if>
							<c:if test="${not empty member }">
								<input type="submit" value="문의 작성" class="btn">
							</c:if>
						</div>
					</form>
				</div>
				
			</div><!-- tabs -->
				</td>
			</tr>
			<tr>
				<td colspan="4"><hr></td>
			</tr>
			<tr>
				<th>보호소명</th>
				<td>${animal.sname }</td>
				<th>보호소 이메일</th>
				<td>${animal.semail }</td>
			</tr>
			<tr>
				<th>보호소 전화번호</th>
				<td>${animal.stel }</td>
				<th>보호소 주소</th>
				<td>${animal.saddress }</td>
			</tr>
			
			<!-- 공고를 작성한 해당 보호소만 수정 및 삭제 가능 -->
			<c:if test="${not empty shelter && shelter.sid eq animal.sid}">
				<tr>
					<td colspan="4" class="center">
						<input type="button" value="수정" class="btn" 
							onclick="location.href='${conPath}/animalModifyView.do?ano=${animal.ano }'">
					</td>
				</tr>
			</c:if>
		</table>

	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>
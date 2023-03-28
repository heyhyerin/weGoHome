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
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
</head>
<body>
	<c:if test="${empty shelter }">
		<script>
			location.href = '${conPath}/loginView.do?next=reviewBoardWriteView.do';
		</script>
	</c:if>
	
	<jsp:include page="../main/header.jsp" />
	<div id="wrap">
		<h2>보호동물 공고 수정</h2>
		<form action="${conPath }/animalModify.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="ano" value="${animal.ano}">
			<input type="hidden" name="pageNum" value="${param.pageNum }">
			<input type="hidden" name="aphoto" value="${animal.aphoto }">
			<table class="dataTable">
				<tr>
					<th>공고번호</th>
					<td>${animal.ano }</td>
				</tr>
				<tr>
					<th>품종<b class="red">&nbsp;*</b></th>
					<td>
						<select name="abreed" class="data-input" required="required" >
							<optgroup label="개">
								<option value="개/골든리트리버">골든리트리버</option>
								<option value="개/닥스훈트">닥스훈트</option>
								<option value="개/도베르만">도베르만</option>
								<option value="개/롯트와일러">롯트와일러</option>
								<option value="개/말라뮤트">말라뮤트</option>
								<option value="개/말티즈">말티즈</option>
								<option value="개/보더콜리">보더콜리</option>
								<option value="개/불독">불독</option>
								<option value="개/비글">비글</option>
								<option value="개/사모예드">사모예드</option>
								<option value="개/삽살개">삽살개</option>
								<option value="개/셰퍼트">셰퍼트</option>
								<option value="개/슈나우저">슈나우저</option>
								<option value="개/시바이누">시바이누</option>
								<option value="개/시츄">시츄</option>
								<option value="개/코커스파니엘">코커스파니엘</option>
								<option value="개/요크셔테리어">요크셔테리어</option>
								<option value="개/웰시코기">웰시코기</option>
								<option value="개/제페니즈 스피츠">제페니즈 스피츠</option>
								<option value="개/진돗개">진돗개</option>
								<option value="개/치와와">치와와</option>
								<option value="개/페키니즈">페키니즈</option>
								<option value="개/포메라니안">포메라니안</option>
								<option value="개/푸들">푸들</option>
								<option value="개/풍산개">풍산개</option>
								<option value="개/허스키">허스키</option>
								<option value="개/믹스">믹스</option>
								<option value="개/" >그 외 견종</option>
							</optgroup>
							<optgroup label="고양이">
								<option value="고양이/노르웨이 숲">노르웨이 숲</option>
								<option value="고양이/도메스틱 숏헤어">도메스틱 숏헤어</option>
								<option value="고양이/라가머핀">라가머핀</option>
								<option value="고양이/랙돌">랙돌</option>
								<option value="고양이/러시안블루">러시안블루</option>
								<option value="고양이/메인쿤">메인쿤</option>
								<option value="고양이/뱅갈고양이">뱅갈고양이</option>
								<option value="고양이/브리티쉬 숏헤어">브리티쉬 숏헤어</option>
								<option value="고양이/샴">샴</option>
								<option value="고양이/셀커크 렉스">셀커크 렉스</option>
								<option value="고양이/스코티쉬 폴드">스코티쉬 폴드</option>
								<option value="고양이/아메리칸 숏헤어">아메리칸 숏헤어</option>
								<option value="고양이/아비시니안">아비시니안</option>
								<option value="고양이/컬러포인트 롱헤어">컬러포인트 롱헤어</option>
								<option value="고양이/티쿼시 앙고라">티쿼시 앙고라</option>
								<option value="고양이/페르시안">페르시안</option>
								<option value="고양이/믹스">믹스</option>
							</optgroup>
						</select>
					</td>
				</tr>
				<tr>
					<th>사진</th>
					<td>
						<input type="file" name="aphoto"><br>
						<span>* 사진 수정 시 수정할 이미지를 첨부해 주세요.</span>
					</td>
				</tr>
				<tr>
					<th>성별(중성화 유무)<b class="red">&nbsp;*</b></th>
					<c:if test="${animal.agender eq '수컷'}">
						<td>
							<input type="radio" name="agender" value="수컷">수컷 &nbsp;
							<input type="radio" name="agender" value="수컷(중성화 O)">수컷(중성화 O) &nbsp;
							<input type="radio" name="agender" value="암컷">암컷 &nbsp;
							<input type="radio" name="agender" value="암컷(중성화 O)">암컷(중성화 O)
						</td>
					</c:if>
					<c:if test="${animal.agender eq '수컷(중성화 O)'}">
						<td>
							<input type="radio" name="agender" value="수컷" >수컷 &nbsp;
							<input type="radio" name="agender" value="수컷(중성화 O)" checked="checked">수컷(중성화 O) &nbsp;
							<input type="radio" name="agender" value="암컷">암컷 &nbsp;
							<input type="radio" name="agender" value="암컷(중성화 O)">암컷(중성화 O)
						</td>
					</c:if>
					<c:if test="${animal.agender eq '암컷'}">
						<td>
							<input type="radio" name="agender" value="수컷">수컷 &nbsp;
							<input type="radio" name="agender" value="수컷(중성화 O)">수컷(중성화 O) &nbsp;
							<input type="radio" name="agender" value="암컷" checked="checked">암컷 &nbsp;
							<input type="radio" name="agender" value="암컷(중성화 O)">암컷(중성화 O)
						</td>
					</c:if>
					<c:if test="${animal.agender eq '암컷(중성화 O)'}">
						<td>
							<input type="radio" name="agender" value="수컷">수컷 &nbsp;
							<input type="radio" name="agender" value="수컷(중성화 O)">수컷(중성화 O) &nbsp;
							<input type="radio" name="agender" value="암컷">암컷 &nbsp;
							<input type="radio" name="agender" value="암컷(중성화 O)" checked="checked">암컷(중성화 O)
						</td>
					</c:if>
				</tr>
				<tr>
					<th>추정나이<b class="red">&nbsp;*</b></th>
					<td>
						<input type="number" name="aage" class="data-input" value="${animal.aage }" required="required">
					</td>
				</tr>
				<tr>
					<th>몸무게<b class="red">&nbsp;*</b></th>
					<td>
						<input type="number" name="aweight" class="data-input" value="${animal.aweight }" required="required">
					</td>
				</tr>
				<tr>
					<th>구조장소<b class="red">&nbsp;*</b></th>
					<td>
						<input type="text" name="aaddress" class="data-input" value="${animal.aaddress }" required="required">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<textarea name="acontent" required="required" required="required"
							placeholder="보호 동물의 관한 정보를 자세하게 적어주세요." >${animal.acontent }</textarea>
					</td>
				</tr>
				<tr>
					<th>입양현황</th>
					<c:if test="${animal.aadopt eq 'PROTECT'}">
						<td>
							<input type="radio" name="aadopt" value="PROTECT" checked="checked">보호중 &nbsp;
							<input type="radio" name="aadopt" value="ADOPT">입양완료
					</c:if>
					<c:if test="${animal.aadopt eq 'ADOPT'}">
						<td>
							<input type="radio" name="aadopt" value="PROTECT">보호중 &nbsp;
							<input type="radio" name="aadopt" value="ADOPT" checked="checked">입양완료
						</td>
					</c:if>
				</tr>
				<tr>
					<td colspan="2" class="center">
						<input type="submit" value="수정" class="btn">
						<input type="button" value="삭제" class="btn-grey" onclick="${conPath}/animalDelete.do?ano=${animal.ano}">
						<input type="button" value="글목록" class="btn-grey" onclick="${conPath}/animalList.do">
					</td>
				</tr>
			</table>
		</form>

	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>
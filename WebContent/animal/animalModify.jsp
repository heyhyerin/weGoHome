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
			<input type="hidden" name="dbfilename" value="${animal.aphoto }">
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
								<option value="개/골든리트리버"
									<c:if test="${animal.abreed == '개/골든리트리버'}">selected="selected"</c:if>>골든리트리버</option>
								<option value="개/닥스훈트"
									<c:if test="${animal.abreed == '개/닥스훈트'}">selected="selected"</c:if>>닥스훈트</option>
								<option value="개/도베르만"
									<c:if test="${animal.abreed == '개/도베르만'}">selected="selected"</c:if>>도베르만</option>
								<option value="개/롯트와일러"
									<c:if test="${animal.abreed == '개/롯트와일러'}">selected="selected"</c:if>>롯트와일러</option>
								<option value="개/말라뮤트"
									<c:if test="${animal.abreed == '개/말라뮤트'}">selected="selected"</c:if>>말라뮤트</option>
								<option value="개/말티즈"
									<c:if test="${animal.abreed == '개/말티즈'}">selected="selected"</c:if>>말티즈</option>
								<option value="개/보더콜리"
									<c:if test="${animal.abreed == '개/보더콜리'}">selected="selected"</c:if>>보더콜리</option>
								<option value="개/불독"
									<c:if test="${animal.abreed == '개/불독'}">selected="selected"</c:if>>불독</option>
								<option value="개/비글"
									<c:if test="${animal.abreed == '개/비글'}">selected="selected"</c:if>>비글</option>
								<option value="개/사모예드"
									<c:if test="${animal.abreed == '개/사모예드'}">selected="selected"</c:if>>사모예드</option>
								<option value="개/삽살개"
									<c:if test="${animal.abreed == '개/삽살개'}">selected="selected"</c:if>>삽살개</option>
								<option value="개/셰퍼트"
									<c:if test="${animal.abreed == '개/셰퍼트'}">selected="selected"</c:if>>셰퍼트</option>
								<option value="개/슈나우저"
									<c:if test="${animal.abreed == '개/슈나우저'}">selected="selected"</c:if>>슈나우저</option>
								<option value="개/시바이누"
									<c:if test="${animal.abreed == '개/시바이누'}">selected="selected"</c:if>>시바이누</option>
								<option value="개/시츄"
									<c:if test="${animal.abreed == '개/시츄'}">selected="selected"</c:if>>시츄</option>
								<option value="개/코커스파니엘"
									<c:if test="${animal.abreed == '개/코커스파니엘'}">selected="selected"</c:if>>코커스파니엘</option>
								<option value="개/요크셔테리어"
									<c:if test="${animal.abreed == '개/요크셔테리어'}">selected="selected"</c:if>>요크셔테리어</option>
								<option value="개/웰시코기"
									<c:if test="${animal.abreed == '개/웰시코기'}">selected="selected"</c:if>>웰시코기</option>
								<option value="개/제페니즈 스피츠"
									<c:if test="${animal.abreed == '개/제페니즈 스피츠'}">selected="selected"</c:if>>제페니즈 스피츠</option>
								<option value="개/진돗개"
									<c:if test="${animal.abreed == '개/진돗개'}">selected="selected"</c:if>>진돗개</option>
								<option value="개/치와와"
									<c:if test="${animal.abreed == '개/치와와'}">selected="selected"</c:if>>치와와</option>
								<option value="개/페키니즈"
									<c:if test="${animal.abreed == '개/페키니즈'}">selected="selected"</c:if>>페키니즈</option>
								<option value="개/포메라니안"
									<c:if test="${animal.abreed == '개/포메라니안'}">selected="selected"</c:if>>포메라니안</option>
								<option value="개/푸들"
									<c:if test="${animal.abreed == '개/푸들'}">selected="selected"</c:if>>푸들</option>
								<option value="개/풍산개"
									<c:if test="${animal.abreed == '개/풍산개'}">selected="selected"</c:if>>풍산개</option>
								<option value="개/허스키"
									<c:if test="${animal.abreed == '개/허스키'}">selected="selected"</c:if>>허스키</option>
								<option value="개/믹스" 
									<c:if test="${animal.abreed == '개/믹스'}">selected="selected"</c:if>>믹스</option>
							</optgroup>
							<optgroup label="고양이">
								<option value="고양이/노르웨이 숲"
									<c:if test="${animal.abreed == '고양이/노르웨이 숲'}">selected="selected"</c:if>>노르웨이 숲</option>
								<option value="고양이/도메스틱 숏헤어"
									<c:if test="${animal.abreed == '고양이/도메스틱 숏헤어'}">selected="selected"</c:if>>도메스틱 숏헤어</option>
								<option value="고양이/라가머핀"
									<c:if test="${animal.abreed == '고양이/라가머핀'}">selected="selected"</c:if>>라가머핀</option>
								<option value="고양이/랙돌"
									<c:if test="${animal.abreed == '고양이/랙돌'}">selected="selected"</c:if>>랙돌</option>
								<option value="고양이/러시안블루"
									<c:if test="${animal.abreed == '고양이/러시안블루'}">selected="selected"</c:if>>러시안블루</option>
								<option value="고양이/메인쿤"
									<c:if test="${animal.abreed == '고양이/메인쿤'}">selected="selected"</c:if>>메인쿤</option>
								<option value="고양이/뱅갈고양이"
									<c:if test="${animal.abreed == '고양이/뱅갈고양이'}">selected="selected"</c:if>>뱅갈고양이</option>
								<option value="고양이/브리티쉬 숏헤어"
									<c:if test="${animal.abreed == '고양이/브리티쉬 숏헤어'}">selected="selected"</c:if>>브리티쉬 숏헤어</option>
								<option value="고양이/샴"
									<c:if test="${animal.abreed == '고양이/브리티쉬 숏헤어'}">selected="selected"</c:if>>샴</option>
								<option value="고양이/셀커크 렉스"
									<c:if test="${animal.abreed == '고양이/셀커크 렉스'}">selected="selected"</c:if>>셀커크 렉스</option>
								<option value="고양이/스코티쉬 폴드"
									<c:if test="${animal.abreed == '고양이/스코티쉬 폴드'}">selected="selected"</c:if>>스코티쉬 폴드</option>
								<option value="고양이/아메리칸 숏헤어"
									<c:if test="${animal.abreed == '고양이/아메리칸 숏헤어'}">selected="selected"</c:if>>아메리칸 숏헤어</option>
								<option value="고양이/아비시니안"
									<c:if test="${animal.abreed == '고양이/아비시니안'}">selected="selected"</c:if>>아비시니안</option>
								<option value="고양이/컬러포인트 롱헤어"
									<c:if test="${animal.abreed == '고양이/컬러포인트 롱헤어'}">selected="selected"</c:if>>컬러포인트 롱헤어</option>
								<option value="고양이/티쿼시 앙고라"
									<c:if test="${animal.abreed == '고양이/티쿼시 앙고라'}">selected="selected"</c:if>>티쿼시 앙고라</option>
								<option value="고양이/페르시안"
									<c:if test="${animal.abreed == '고양이/페르시안'}">selected="selected"</c:if>>페르시안</option>
								<option value="고양이/믹스"
									<c:if test="${animal.abreed == '고양이/믹스'}">selected="selected"</c:if>>믹스</option>
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
						<td>
							<input type="radio" name="agender" value="수컷"
								<c:if test="${animal.agender eq '수컷'}">checked="checked"</c:if>>수컷 &nbsp;
							<input type="radio" name="agender" value="수컷(중성화 O)"
								<c:if test="${animal.agender eq '수컷(중성화 O)'}">checked="checked"</c:if>>수컷(중성화 O) &nbsp;
							<input type="radio" name="agender" value="암컷"
							<c:if test="${animal.agender eq '암컷'}">checked="checked"</c:if>>암컷 &nbsp;
							<input type="radio" name="agender" value="암컷(중성화 O)"
							<c:if test="${animal.agender eq '암컷(중성화 O)'}">checked="checked"</c:if>>암컷(중성화 O)
						</td>
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
					<td>
						<input type="radio" name="aadopt" value="PROTECT" 
							<c:if test="${animal.aadopt eq 'PROTECT'}">checked="checked"</c:if>>보호중 &nbsp;
						<input type="radio" name="aadopt" value="ADOPT"
							<c:if test="${animal.aadopt eq 'ADOPT'}">checked="checked"</c:if>>입양완료
					</td>
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
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
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
</head>
<body>
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
					<textarea rows="" cols="">${animal.acontent }
					</textarea>
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
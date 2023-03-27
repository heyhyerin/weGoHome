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
<script>
$(function() {
	// stel 수정 시
	$('input[name="stelConfirm"]').click(
			function() {
				var stel = $('#stel').val().replace(/[^0-9]/g, "");
				if (!stel || stel.length < 9) {
					$('#stelConfirmResult').html(
							'<b class="red">올바른 전화번호를 입력하세요.</b>');
				} else {
					$.ajax({
						url : '${conPath}/stelConfirm.do',
						data : 'stel=' + stel,
						type : 'get',
						dataType : 'html',
						success : function(data) {
							$('#stelConfirmResult').html(data);
						},
					}); // ajax
				}
			});

	// email 유효성 검사
	var patternSemail = /^[a-zA-Z0-9_\.]+@[a-zA-Z0-9_]+(\.\w+){1,2}$/;
	$('input[name="semailConfirm"]').click(
			function() {
				var semail = $('#semail').val();
				if (!semail.match(patternSemail)) {
					$('#semailConfirmResult').html(
							'<b class="red">올바른 메일을 입력하세요.</b>');
				} else {
					$.ajax({
						url : '${conPath}/semailConfirm.do',
						data : 'semail=' + semail,
						type : 'get',
						dataType : 'html',
						success : function(data) {
							$('#semailConfirmResult').html(data);
						},
					}); // ajax
				}
			});

	// 비밀번호 중복체크
	$('#spw, #spwChk').keyup(
			function() {
				var spw = $('#spw').val();
				var spwChk = $('#spwChk').val();
				if (spwChk.length > 1) {
					if (spw == spwChk) {
						$('#spwChkResult').html(
								'<b class="green">비밀번호가 일치합니다.</b>');
					} else {
						$('#spwChkResult').html(
								'<b class="red">비밀번호가 일치하지 않습니다.</b>');
					}
				}
			});

	// 중복확인 후 정보수정 진행
	$('form').submit(function() {
		var sname = $('#sname').val();
		var oldspw = $('#oldspw').val();
		var spw = $('#spw').val();
		var spwChk = $('#spwChk').val();
		var stel = $('#stel').val();
		var semail = $('#semail').val();
		var sidConfirmResult = $('#sidConfirmResult').text().trim();
		var spwChkResult = $('#spwChkResult').text().trim();
		var stelConfirmResult = $('#stelConfirmResult').text().trim();
		var semailConfirmResult = $('#semailConfirmResult').text().trim();

		if (!oldspw || oldspw != '${shelter.spw}') {
			alert('정보 수정 시 현재 비밀번호를 입력해 주세요.');
			return false;
			oldspw.focus();
		} else {
			// 현재 비밀번호 입력 시
			if (spw || spwChk) {
				if (spwChkResult != '비밀번호가 일치합니다.') {
					alert('비밀번호를 확인이 필요합니다.');
					$('input[name="spw"]').focus();
					return false;
				}
			} else if (stel != '${shelter.stel}') {
				if (stelConfirmResult != '사용가능한 전화번호입니다.') {
					alert('전화번호 중복 확인이 필요합니다.');
					$('input[name="stel"]').focus();
					return false;
				}
			} else if (semail != '${shelter.semail}') {
				if (semailConfirmResult != '사용가능한 이메일입니다.') {
					alert('이메일 중복 확인이 필요합니다.');
					$('input[name="semail"]').focus();
					return false;
				}
			}
		}
	});
});
</script>
</head>
<body>
	<!-- 로그아웃 상태일 경우 로그인 페이지로  -->
	<c:if test="${empty shelter }">
		<script>
			location.href = '${conPath}/loginView.do?next=shelterView.do';
		</script>
	</c:if>

	<!-- 정보수정 결과 출력 -->
	<c:if test="${not empty resultMsg}">
		<script>
			alert('${resultMsg}');
		</script>
	</c:if>
	<c:if test="${not empty resultErrorMsg}">
		<script>
			alert('${resultErrorMsg}');
		</script>
	</c:if>

	<jsp:include page="../main/header.jsp" />
	<div id="wrap">
		<form action="${conPath }/shelterModify.do" method="post">
			<table class="modify-table">
				<caption>보호소 정보 조회</caption>
				<tr>
					<th>아이디</th>
					<td>
						<input type="text" name="sid" id="sid" class="data-input" value="${shelter.sid }"
							readonly="readonly">
					</td>
				</tr>
				<tr>
					<th>보호소명</th>
					<td>
						<input type="text" name="sname" id="sname" class="data-input" value="${shelter.sname }">
					</td>
				</tr>
				<tr>
					<th>현재 비밀번호</th>
					<td>
						<input type="password" name="oldspw" id="oldspw" class="data-input"
							placeholder="정보 수정 시 현재 비밀번호를 입력하세요.">
					</td>
				</tr>
				<tr>
					<th>새 비밀번호</th>
					<td>
						<input type="password" name="spw" id="spw" class="data-input">
					</td>
				</tr>
				<tr>
					<th>새 비밀번호 확인</th>
					<td>
						<input type="password" name="spwChk" id="spwChk" class="data-input">
						<div id="spwChkResult">&nbsp;</div>
					</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>
						<input type="text" name="stel" id="stel" value="${shelter.stel }" class="data-input">
						<input type="button" value="중복확인" name="stelConfirm" class="btn">
						<div id="stelConfirmResult">&nbsp;</div>
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>
						<input type="email" name="semail" id="semail" value="${shelter.semail }" class="data-input">
						<input type="button" value="중복확인" name="semailConfirm" class="btn">
						<div id="semailConfirmResult">&nbsp;</div>
					</td>
				</tr>
				<tr>
					<th>보호소 주소</th>
					<td>
						<input type="text" name="saddress" value="${shelter.saddress }" class="data-input">
					</td>
				</tr>
				<tr>
					<td colspan="2" class="center">
						<input type="submit" value="정보수정" class="btn">
						<input type="button" value="취소" class="btn-grey" onclick="location.href='${conPath}/main.do'">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>
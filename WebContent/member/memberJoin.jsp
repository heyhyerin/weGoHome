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
<script>
	$(function() {
		// mid 유효성검사
		$('input[name="midConfirm"]').click(
				function() {
					var mid = $('#mid').val();
					if (mid.length < 4) {
						$('#midConfirmResult').html(
								'<b class="red">아이디는 4자 이상 입력해야 합니다.</b>');
					} else {
						$.ajax({
							url : '${conPath}/midConfirm.do',
							data : 'mid=' + mid,
							type : 'get',
							dataType : 'html',
							success : function(data) {
								/* 
								var result = data;
								var preIdx = data.indexOf('<body>')+6;
								var postIdx = data.indexOf('</body>');
								msg = result.substring(preIdx, postIdx); */
								$('#midConfirmResult').html(data);
							},
						}); // ajax
					}
				});

		// mtel 중복확인
		$('input[name="mtelConfirm"]').click(
				function() {
					var mtel = $('#mtel').val().replace(/[^0-9]/g, "");
					/* alert(mtel); */
					if (!mtel || mtel.length < 9) {
						$('#mtelConfirmResult').html(
								'<b class="red">올바른 전화번호를 입력하세요.</b>');
					} else {
						$.ajax({
							url : '${conPath}/mtelConfirm.do',
							data : 'mtel=' + mtel,
							type : 'get',
							dataType : 'html',
							success : function(data) {
								$('#mtelConfirmResult').html(data);
							},
						}); // ajax
					}
				});

		// email 유효성 검사
		var patternMemail = /^[a-zA-Z0-9_\.]+@[a-zA-Z0-9_]+(\.\w+){1,2}$/;
		$('input[name="memailConfirm"]').click(
				function() {
					var memail = $('#memail').val();
					if (!memail.match(patternMemail)) {
						$('#memailConfirmResult').html(
								'<b class="red">올바른 메일을 입력하세요.</b>');
					} else {
						$.ajax({
							url : '${conPath}/memailConfirm.do',
							data : 'memail=' + memail,
							type : 'get',
							dataType : 'html',
							success : function(data) {
								$('#memailConfirmResult').html(data);
							},
						}); // ajax
					}
				});

		// 비밀번호 중복체크
		$('#mpw, #mpwChk').keyup(
				function() {
					var mpw = $('#mpw').val();
					var mpwChk = $('#mpwChk').val();
					if (mpwChk.length > 1) {
						if (mpw == mpwChk) {
							$('#mpwChkResult').html(
									'<b class="green">비밀번호가 일치합니다.</b>');
						} else {
							$('#mpwChkResult').html(
									'<b class="red">비밀번호가 일치하지 않습니다.</b>');
						}
					}
				});

		// 중복확인 후 회원가입 진행
		$('form')
				.submit(
						function() {
							var mname = $('#mname').val();
							var midConfirmResult = $('#midConfirmResult')
									.text().trim();
							var mpwChkResult = $('#mpwChkResult').text().trim();
							var mtelConfirmResult = $('#mtelConfirmResult')
									.text().trim();
							var memailConfirmResult = $('#memailConfirmResult')
									.text().trim();

							if (midConfirmResult != '사용가능한 아이디입니다.') {
								alert('아이디 중복 확인이 필요합니다.');
								$('input[name="mname"]').focus();
								return false; // submit 제한
							} else if (!mname) {
								alert('이름은 필수 입력값입니다.')
								$('#mname').focus();
								return false;
							} else if (mpwChkResult != '비밀번호가 일치합니다.') {
								alert('비밀번호를 확인이 필요합니다.');
								$('input[name="mpw"]').focus();
								return false;
							} else if (mtelConfirmResult != '사용가능한 전화번호입니다.') {
								alert('전화번호 중복 확인이 필요합니다.');
								$('input[name="mtel"]').focus();
								return false;
							} else if (memailConfirmResult != ""
									&& memailConfirmResult != '사용가능한 이메일입니다.') {
								alert('이메일 중복 확인이 필요합니다.');
								$('input[name="memail"]').focus();
								return false;
							}
						});
	});
</script>
<script>
	/* calender */
	$(function() {
		$("#datepicker").datepicker(
				{
					dateFormat : "yy-mm-dd",
					monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월' ],
					dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토" ],
					changeMonth : true,
					changeYear : true,
					showMonthAfterYear : true,
					yearSuffix : '년',
					showOtherMonths : true,
					minDate : new Date(1950, 1 - 1, 1),
					maxDate : 'y',
					yearRange : 'c-100:c0',
				});
	});
</script>
</head>
<body>
	<!-- 로그인 상태일 경우 메인 페이지로  -->
	<c:if test="${not empty member }">
		<script>
			location.href = '${conPath}/main.do';
		</script>
	</c:if>

	<jsp:include page="../main/header.jsp" />
	<div id="wrap">
		<!-- join form -->
		<form action="${conPath }/join.do" method="post">
			<table class="modify-table">
				<caption>회원가입</caption>
				<tr>
					<th>아이디<b class="red">&nbsp;*</b></th>
					<td>
						<input type="text" name="mid" id="mid" class="data-input" placeholder="아이디(영문/숫자 4자 이상)">
						<input type="button" value="중복확인" name="midConfirm" class="btn">
						<div id="midConfirmResult">&nbsp;</div>
					</td>
				</tr>
				<tr>
					<th>이름<b class="red">&nbsp;*</b></th>
					<td>
						<input type="text" name="mname" id="mname" class="data-input"
							placeholder="실명이 아닌 경우 이용에 제한이 있을 수 있습니다.">
					</td>
				</tr>
				<tr>
					<th>비밀번호<b class="red">&nbsp;*</b></th>
					<td>
						<input type="password" name="mpw" id="mpw" class="data-input"
							placeholder="비밀번호(영문/숫자 /특수문자 6자리 이상)">
					</td>
				</tr>
				<tr>
					<th>비밀번호 확인<b class="red">&nbsp;*</b></th>
					<td>
						<input type="password" name="mpwChk" id="mpwChk" class="data-input"
							placeholder="한번 더 입력해 주세요.">
						<div id="mpwChkResult">&nbsp;</div>
					</td>
				</tr>
				<tr>
					<th>휴대전화 번호<b class="red">&nbsp;*</b></th>
					<td>
						<input type="text" name="mtel" id="mtel" class="data-input"
							placeholder="전화번호 입력 후 중복확인을 해주세요.">
						<input type="button" value="중복확인" name="mtelConfirm" class="btn">
						<div id="mtelConfirmResult">&nbsp;</div>
					</td>
				</tr>
				<tr>
					<td colspan="2" class="center">추가입력사항</td>
				</tr>
				<tr>
					<td colspan="2">
						<hr>
					</td>
				</tr>
				<tr>
					<td colspan="2">&nbsp;</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>
						<input type="email" name="memail" id="memail" class="data-input"
							placeholder="활동에 참여하시려면 기입 후 인증해 주세요.">
						<input type="button" value="중복확인" name="memailConfirm" class="btn">
						<div id="memailConfirmResult">&nbsp;</div>
					</td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
						<input type="radio" name="mgender" value="M">
						&nbsp; 남 &nbsp;
						<input type="radio" name="mgender" value="F">
						&nbsp; 여
					</td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td>
						<input type="text" name="mbirth" id="datepicker" class="data-input">
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>
						<input type="text" name="maddress" class="data-input">
					</td>
				</tr>
				<tr>
					<td colspan="2" class="center">
						<input type="submit" value="회원가입" class="btn-submit">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>
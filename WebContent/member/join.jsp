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
		// mid 중복확인
		$('input[name="midConfirm"]').click(function() {
			var mid = $('input[name="mid"]').val();
			$.ajax({
				url: '${conPath}/midConfirm.do',
				data: 'mid='+mid,
				type: 'get',
				dataType: 'html',
				success: function(data) {
					var result = data;
					var preIdx = data.indexOf('<body>')+6;
					var postIdx = data.indexOf('</body>');
					msg = result.substring(preIdx, postIdx);
					$('#midConfirmResult').html(msg);
				},
			});
		});
		
		// mtel 중복확인
		$('input[name="mtelConfirm"]').click(function() {
			var mtel = $('input[name="mtel"]').val();
			$.ajax({
				url: '${conPath}/mtelConfirm.do',
				data: 'mtel'+mtel,
				type: 'get',
				dataType: 'html',
				success: function(data) {
					$('#mtelConfirmResult').html(data);
				},
			});
		});
		
		// email 중복확인
		$('input[name="memailConfirm"]').click(function() {
			var memail = $('input[name="memail"]').val();
			$.ajax({
				url: '${conPath}/memailConfirm.do',
				data: 'memail'+memail,
				type: 'get',
				dataType: 'html',
				success: function(data) {
					$('#memailConfirmResult').html(data);
				},
			});
		});
		
		// 비밀번호 중복체크
		$('#mpw, #mpwChk').keyup(function() {
			var mpw = $('#mpw').val();
			var mpwChk = $('#mpwChk').val();
			if (mpwChk.length > 1) {
				if (mpw == mpwChk) {
					$('#mpwChkResult').html('<b class="green">비밀번호가 일치합니다.</b>');
				} else {
					$('#mpwChkResult').html('<b class="red">비밀번호가 일치하지 않습니다.</b>');
				}
			}
		});
		
		// 중복확인 후 회원가입 진행
		$('form').submit(function() {
			var midConfirmResult = $('#midConfirmResult').text().trim();
			var mpwChkResult = $('#mpwChkResult').text().trim();
			var mtelConfirmResult = $('#mtelConfirmResult').text().trim();
			var memailConfirmResult = $('#memailConfirmResult').text().trim();
			
			if (midConfirmResult != '사용가능한 아이디입니다.') {
				alert('아이디 중복 확인이 필요합니다.');
				$('input[name="mname"]').focus();
				return false; // submit 제한
			} else if (mpwChkResult != '비밀번호가 일치합니다.') {
				alert('비밀번호를 확인이 필요합니다.');
				$('input[name="mpw"]').focus();
				return false;
			} else if (mtelConfirmResult != '사용가능한 전화번호입니다.') {
				alert('전화번호 중복 확인이 필요합니다.');
				$('input[name="mtel"]').focus();
				return false;
			} else if(memailConfirmResult != "" && memailConfirmResult != '사용가능한 이메일입니다.'){
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
		$("#datepicker").datepicker({
			dateFormat : "yy-mm-dd",
			monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
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
	<jsp:include page="../main/header.jsp" />
	<div id="content_form">
		<!-- join form -->
		<form action="${conPath }/join.do" method="post">
			<div class="container_center">
				<table>
					<caption>회원가입</caption>
					<tr>
						<th>아이디</th> 
						<td>
							<input type="text" name="mid" placeholder="아이디 입력 후 중복확인을 해주세요.">
							<input type="button" value="중복확인" name="midConfirm" class="btn">
							<div id="midConfirmResult"> &nbsp; </div>
						</td>
					</tr>
					<tr>
						<th>이름</th> 
						<td>
						<input type="text" name="mname" placeholder="실명이 아닌 경우 이용에 제한이 있을 수 있습니다."></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td>
						<input type="password" name="mpw" id="mpw" placeholder="비밀번호(영문/숫자 8자리 이상)"></td>
					</tr>
					<tr>
						<th>비밀번호 확인</th>
						<td>
							<input type="password" name="mpwChk" id="mpwChk" placeholder="한번 더 입력해 주세요.">
							<div id="mpwChkResult"> &nbsp; </div>
						</td>
					</tr>
					
					<tr>
						<th>휴대전화 번호</th> 
						<td>
							<input type="tel" name="mtel" placeholder="전화번호 입력 후 중복확인을 해주세요.">
							<input type="button" value="중복확인" name="mtelConfirm" class="btn">
							<div id="mtelConfirmResult"> &nbsp; </div>
						</td>
					</tr>
					<tr>
						<th>이메일</th> 
						<td>
							<input type="email" name="memail" placeholder="활동에 참여하시려면 기입 후 인증해 주세요.">
							<input type="button" value="중복확인" name="memailConfirm" class="btn">
							<div id="memailConfirmResult"> &nbsp; </div>
						</td>
					</tr>
					<tr>
						<th>성별</th> 
						<td>
						<input type="radio" name="mgender" value="M">남 &nbsp;
						<input type="radio" name="mgender" value="F">여</td>
					</tr>
					<tr>
						<th>생년월일</th> 
						<td>
						<input type="text" name="mbirth" id="datepicker"></td>
					</tr>
					<tr>
						<th>주소</th> 
						<td>
						<input type="text" name="maddress"></td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="회원가입" class="btn-submit">
						</td>
					</tr>
				</table>
			</div>
		</form>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>
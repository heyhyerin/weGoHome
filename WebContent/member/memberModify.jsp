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
		// mtel 수정 시
		$('input[name="mtelConfirm"]').click(function() {
			var mtel = $('#mtel').val().replace(/[^0-9]/g, "");
			if (!mtel || mtel.length < 9){
				$('#mtelConfirmResult').html('<b class="red">올바른 전화번호를 입력하세요.</b>');
			} else {
				$.ajax({
					url: '${conPath}/mtelConfirm.do',
					data: 'mtel='+mtel,
					type: 'get',
					dataType: 'html',
					success: function(data) {
						$('#mtelConfirmResult').html(data);
					},
				}); // ajax
			}
		});
		
		// email 유효성 검사
		var patternMemail = /^[a-zA-Z0-9_\.]+@[a-zA-Z0-9_]+(\.\w+){1,2}$/;
		$('input[name="memailConfirm"]').click(function() {
			var memail = $('#memail').val();
			if (!memail.match(patternMemail)) {
				$('#memailConfirmResult').html('<b class="red">올바른 메일을 입력하세요.</b>');
			} else {
				$.ajax({
					url: '${conPath}/memailConfirm.do',
					data: 'memail='+memail,
					type: 'get',
					dataType: 'html',
					success: function(data) {
						$('#memailConfirmResult').html(data);
					},
				}); // ajax
			}
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
			var mname = $('#mname').val();
			var oldmpw = $('#oldmpw').val();
			var mpw = $('#mpw').val();
			var mpwChk = $('#mpwChk').val();
			var mtel = $('#mtel').val();
			var memail = $('#memail').val();
			var midConfirmResult = $('#midConfirmResult').text().trim();
			var mpwChkResult = $('#mpwChkResult').text().trim();
			var mtelConfirmResult = $('#mtelConfirmResult').text().trim();
			var memailConfirmResult = $('#memailConfirmResult').text().trim();
			
			if (!oldmpw || oldmpw != '${member.mpw}'){
				alert('정보 수정 시 현재 비밀번호를 입력해 주세요.');
				return false;
				oldmpw.focus();
			} else {
				// 현재 비밀번호 입력 시
				if (mpw || mpwChk) {
					if(mpwChkResult != '비밀번호가 일치합니다.'){
						alert('비밀번호를 확인이 필요합니다.');
						$('input[name="mpw"]').focus();
					return false;
					}
				} else if (mtel != '${member.mtel}') {
					if(mtelConfirmResult != '사용가능한 전화번호입니다.'){
						alert('전화번호 중복 확인이 필요합니다.');
						$('input[name="mtel"]').focus();
					return false;
					}
				} else if(memail != '${member.memail}'){ 
					if(memailConfirmResult != '사용가능한 이메일입니다.'){
						alert('이메일 중복 확인이 필요합니다.');
						$('input[name="memail"]').focus();
					return false;
					}
				}
			}
		});
		
		$('.memberWithDrawal').click(function() {
			var mid = $('#mid').val()
			var oldmpw = $('#oldmpw').val();
			if (!oldmpw || oldmpw != '${member.mpw}'){
				alert('회원 탈퇴 시 현재 비밀번호를 입력해 주세요.');
				$('input[name="oldmpw"]').focus();
				return false;
			} else {
				location.href='${conPath}/memberWithDrawal.do?mid='+mid;
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
	<!-- 로그아웃 상태일 경우 로그인 페이지로  -->
	<c:if test="${empty member }">
		<script>
			location.href = '${conPath}/loginView.do?next=memberView.do';
		</script>
	</c:if>
	
		<!-- 정보수정 결과 출력 -->
	<c:if test="${not empty modifyResult}">
		<script>
			alert('${modifyResult}');
		</script>
	</c:if>
	
	<jsp:include page="../main/header.jsp" />
	<div id="content_form">
		<form action="${conPath }/memberModify.do" method="post">
			<div class="container_center">
				<table>
					<caption>회원정보 조회</caption>
					<tr>
						<th>아이디</th> 
						<td>
							<input type="text" name="mid" id="mid" value="${member.mid }" readonly="readonly">
						</td>
					</tr>
					<tr>
						<th>이름</th> 
						<td>
						<input type="text" name="mname" id="mname" value="${member.mname }" readonly="readonly"></td>
					</tr>
					<tr>
						<th>현재 비밀번호</th>
						<td>
						<input type="password" name="oldmpw" id="oldmpw" placeholder="정보 수정 시 현재 비밀번호를 입력하세요."></td>
					</tr>
					<tr>
						<th>새 비밀번호</th>
						<td>
						<input type="password" name="mpw" id="mpw" ></td>
					</tr>
					<tr>
						<th>새 비밀번호 확인</th>
						<td>
							<input type="password" name="mpwChk" id="mpwChk" >
							<div id="mpwChkResult"> &nbsp; </div>
						</td>
					</tr>
					<tr>
						<th>휴대전화 번호</th> 
						<td>
							<input type="text" name="mtel" id="mtel" value="${member.mtel }">
							<input type="button" value="중복확인" name="mtelConfirm" class="btn">
							<div id="mtelConfirmResult"> &nbsp; </div>
						</td>
					</tr>
					<tr>
						<th>이메일</th> 
						<td>
							<input type="email" name="memail" id="memail" value="${member.memail }">
							<input type="button" value="중복확인" name="memailConfirm" class="btn">
							<div id="memailConfirmResult"> &nbsp; </div>
						</td>
					</tr>
					<tr>
						<th>성별</th> 
						<c:if test="${empty member.mgender}">
							<td>
								<input type="radio" name="mgender" value="M">남 &nbsp;
								<input type="radio" name="mgender" value="F">여
							</td>
						</c:if>
						<c:if test="${member.mgender eq 'M' }">
							<td>
								<input type="radio" name="mgender" value="M" checked="checked">남 &nbsp;
								<input type="radio" name="mgender" value="F">여
							</td>
						</c:if>
						<c:if test="${member.mgender eq 'F' }">
							<td>
								<input type="radio" name="mgender" value="M">남 &nbsp;
								<input type="radio" name="mgender" value="F" checked="checked">여
							</td>
						</c:if>
					</tr>
					<tr>
						<th>생년월일</th> 
						<td>
						<input type="text" name="mbirth" id="datepicker" value="${member.mbirth }"></td>
					</tr>
					<tr>
						<th>주소</th> 
						<td>
						<input type="text" name="maddress" value="${member.maddress }"></td>
					</tr>
					<tr>
						<td colspan="2" class="colspan">
							<input type="button" value="회원 탈퇴" class="memberWithDrawal btn-outline" >
							<input type="submit" value="회원정보수정" class="btn">
							<input type="button" value="취소" class="btn-outline" onclick="location.href='${conPath}/main.do'">
						</td>
					</tr>
				</table>
			</div>
		</form>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>
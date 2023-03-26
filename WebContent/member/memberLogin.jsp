<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/style.css" rel="stylesheet" type="text/css">
<style>
div#login-form {
	width: 1100px;
	margin: 0 auto;
	padding: 60px;
	display: flex;
	flex-direction: column;
	justify-content: center;
}


/* 탭 전체 스타일 */
.tabs {
	margin-top: 50px;
	padding-bottom: 40px;
	width: 500px;
	margin: 0 auto;
	border: 1px solid #dddddd;
	border-radius: 10px;
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
	padding: 40px;
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

div#login-form .login-table {
	text-align: center;
	margin: 0 auto;
}

.login-table td{
	padding-bottom: 10px;
}

.login-table td p {
	cursor: pointer;
}
</style>
</head>
<body>
	<!-- 로그인 상태일 경우 메인 페이지로  -->
	<c:if test="${not empty member }">
		<script>
			location.href = '${conPath}/main.do';
		</script>
	</c:if>

	<!-- 회원가입 결과 출력 -->
	<c:if test="${not empty resultMsg }">
		<script>
			alert('${resultMsg}');
		</script>
	</c:if>
	<c:if test="${not empty resultErrorMsg }">
		<script>
			alert('${resultErrorMsg}');
		</script>
	</c:if>

	<jsp:include page="../main/header.jsp" />
	<div id="login-form">
		<div class="tabs">
			<input id="all" type="radio" name="tab_item" checked>
			<label class="tab_item" for="all">회원 로그인</label>
			<input id="programming" type="radio" name="tab_item">
			<label class="tab_item" for="programming">보호소 로그인</label>

			<div class="tab_content" id="all_content">
				<!-- 회원 로그인 -->
				<form action="${conPath }/memberLogin.do" method="post">
					<table class="login-table">
						<tr>
							<td>
								<img alt="로고" src="${conPath }/img/logo_gray.png">
							</td>
						</tr>
						<tr>
							<td>
								<h2>아이들의 가족이 되어주세요!</h2>
							</td>
						</tr>
						<tr>
							<td>
								<c:if test="${empty mid }">
									<input type="text" name="mid" placeholder="아이디"
										class="data-input">
								</c:if> <c:if test="${not empty mid }">
									<input type="text" name="mid" value="${mid }"
										class="data-input">
								</c:if>
							</td>
						</tr>
						<tr>
							<td>
								<input type="password" name="mpw" placeholder="비밀번호"
									class="data-input">
							</td>
						</tr>
						<tr>
							<td>
								<button class="btn-submit">로그인</button>
							</td>
						</tr>
						<tr>
							<td>
								<p>계정이 기억나지 않나요? <b>계정찾기</b></p>
							</td>
						</tr>
					</table>
				</form>
				<!-- 회원 로그인 -->
			</div>
			<div class="tab_content" id="programming_content">
				<!-- 보호소 로그인 -->
				<form action="${conPath }/shelterLogin.do" method="post">
					<table class="login-table">
						<tr>
							<td>
								<img alt="로고" src="${conPath }/img/logo_gray.png">
							</td>
						</tr>
						<tr>
							<td>
								<h2>보호소 계정으로 로그인</h2>
							</td>
						</tr>
						<tr>
							<td>
								<input type="text" name="sid" placeholder="아이디"
									class="data-input">
							</td>
						</tr>
						<tr>
							<td>
								<input type="password" name="spw" placeholder="비밀번호"
									class="data-input">
							</td>
						</tr>
						<tr>
							<td>
								<button class="btn-submit">로그인</button>
							</td>
						</tr>
						<tr>
							<td>
								<p>계정이 기억나지 않나요? <b>계정찾기</b></p>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>
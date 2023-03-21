<%@page import="com.lec.animalAdoption.dao.ReviewBoardDao"%>
<%@page import="com.lec.animalAdoption.dto.ReviewBoardDto"%>
<%@page import="java.util.ArrayList"%>
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
</head>
<body>
	<%
	ReviewBoardDao rDao = ReviewBoardDao.getInstance();
	int result = 0;
	%>

	<h2>1. 리뷰게시판 글 목록 출력</h2>
	<%
	int startRow = 1;
	int endRow = 2;
	ArrayList<ReviewBoardDto> boardList = rDao.getReviewList(startRow, endRow);
	for(ReviewBoardDto board : boardList){
		out.print(board + "<br>");
	}
	%>
	
	<h2>2. 등록된 총 글 갯수 조회</h2>
	<%
	int totCnt = rDao.getReviewTotCnt();
	%>
	등록된 전체 동물 수 : <%=totCnt %>
	
	<%-- 
	<h3>3. 리뷰게시판 게시글 작성</h3>
	<%
	String mid = "test2";
	String sid = null;
	String rtitle = "안녕하세요";
	String rcontent = "반갑습니다";
	String rpw = "111";
	String rphoto = null;
	String rip = "165.0.0.1";
	ReviewBoardDto review = new ReviewBoardDto(0, mid, sid, rtitle, rcontent, rpw, rphoto, null, 0, 0, 0, 0, rip, null);
	result = rDao.writeReview(review);
	%>
	<%=result == 0 ? "공고 게시글 작성 실패" : "공고 게시글 작성 성공" %><br>
	<%=review %>
	
	<h2>4. 리뷰게시판 게시글 상세보기</h2>
	<%
	int rno = 2;
	review = rDao.getReview(rno);
	%>
	<%=review %>
	 --%>
	 
	 <%-- 
	<h2>5. 리뷰게시판 게시글 수정</h2>
	<%
	String rtitle = "안녕하세요";
	String rcontent = "반갑습니다";
	String rpw = "111";
	String rphoto = null;
	String rip = "165.0.0.1";
	int rno = 2;
	ReviewBoardDto review = new ReviewBoardDto(rno, null, null, rtitle, rcontent, rpw, rphoto, null, 0, 0, 0, 0, rip, null);
	result = rDao.modifyReview(review);
	%>
	<%=result == 0 ? "공고 게시글 수정 실패" : "공고 게시글 수정 성공" %><br>
	<%=review %>
	
	<h2>6. 리뷰게시판 게시글 삭제</h2>
	<%
	rno = 4;
	result = rDao.deleteReview(rno);
	%>
	<%=result == 0 ? "공고 게시글 삭제 실패" : "공고 게시글 삭제 성공" %>
	 --%>
	 
	 <%-- 
	<h2>7. 답글 작성</h2>
	<%
	String mid = null;
	String sid = "SHELTER1";
	String rtitle = "답글";
	String rcontent = "반갑습니다";
	String rpw = "111";
	String rphoto = null;
	int rgroup = 20;
	int rstep = 1;
	int rindent = 1;
	String rip = "120.0.0.1";
	ReviewBoardDto review = new ReviewBoardDto(0, mid, sid, rtitle, rcontent, rpw, rphoto,
			null, 0, rgroup, rstep, rindent, rip, null);
	result = rDao.reply(review);
	%>
	<%=result == 0 ? "답변 게시글 작성 실패" : "답변 게시글 작성 성공" %><br> --%>
	
	<h2>8. 게시글 검색</h2>
	<%
	String schStr = "주차";
	startRow = 1;
	endRow = 10;
	ArrayList<ReviewBoardDto> searchList = rDao.searchReviewList(schStr, startRow, endRow);
	for(ReviewBoardDto board : searchList){
		out.print(board + "<br>");
	}
	%>
</body>
</html>
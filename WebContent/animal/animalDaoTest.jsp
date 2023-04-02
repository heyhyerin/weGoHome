<%@page import="java.sql.Timestamp"%>
<%@page import="com.lec.animalAdoption.dao.AnimalDao"%>
<%@page import="com.lec.animalAdoption.dto.AnimalDto"%>
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
	AnimalDao aDao = AnimalDao.getInstance();
	int result = 0;
	%>
	<%-- 
	<h2>1. 보호동물 목록 출력</h2>
	<%
	int startRow = 0;
	int endRow = 2;
	ArrayList<AnimalDto> animalList = aDao.getAnimalList(startRow, endRow);
	for(AnimalDto animal : animalList){
		out.print(animal + "<br>");
	}
	%>
	
	<h2>2. 등록된 전체 동물 수 조회</h2>
	<%
	int totCnt = 0;
	totCnt = aDao.getAnimalTotCnt();
	%>
	등록된 전체 동물 수 : <%=totCnt %>
	
	<h2>3. 공고 게시글 작성</h2>
	<%
	String sid = "SHELTER1";
	String aphoto = "NOIMG.jpg";
	String abreed = "개/진돗개";
	String agender = "암컷(중성화O)";
	int aage = 2;
	int aweight = 6;
	String acontent = "시골강아지";
	String aaddress = "시골역 논밭 부근";
	/* Timestamp ardate = new Timestamp(System.currentTimeMillis()); */
	String aip = "210.0.0.1";
	AnimalDto animal = new AnimalDto(0, sid, aphoto, abreed, agender, 
			aage, aweight, acontent, aaddress, null, null, aip, null, null, null, null);
	
	result = aDao.writeAnimal(animal);
	%>
	<%=result == 0 ? "공고 게시글 작성 실패" : "공고 게시글 작성 성공" %><br>
	<%=animal %> 
	

	<h2>4. 공고 게시글 상세보기</h2>
	<%
	int ano = 2;
	AnimalDto getAnimal = aDao.getAnimal(ano);
	%>
	<%=getAnimal %>
	<h2>5. 공고 게시글 수정</h2>
	<%
	String sid = "SHELTER1";
	String aphoto = "NOIMG.jpg";
	String abreed = "개/진돗개";
	String agender = "암컷(중성화O)";
	int aage = 2;
	int aweight = 6;
	String acontent = "시골강아지";
	String aaddress = "시골역 논밭 부근";
	String aadopt = "ADOPT";
	String aip = "210.0.0.1";
	ano = 3;
	
	AnimalDto animal = new AnimalDto(ano, sid, aphoto, abreed, agender, 
			aage, aweight, acontent, aaddress, null, aadopt, aip, null, null, null, null);
	result = aDao.modifyAnimal(animal);
	%>
	<%=result == 0 ? "동물 정보수정 실패" : "동물 정보수정 성공"%><br>
	<%=animal %>
	
	<h2>6. 공고 게시글 삭제</h2>
	<%
	ano = 3;
	result = aDao.deleteAnimal(ano);
	%>
	<%=ano %>번 게시글 삭제: <%=result == 0 ? "게시글 삭제 실패" : "게시글 삭제 성공" %>
	

	<h2>7. 보호동물 상세 검색</h2>
	<%
	String schAbreed = "";
	String schAgender = "";
	int schRowAweight = 5;
	int schHighAweight = 9;
	String schSname = "서울";
	startRow = 0;
	endRow = 10;
	
	ArrayList<AnimalDto> searchList = aDao.searchAnimal(schAbreed, schAgender, schRowAweight, schHighAweight, schSname, startRow, endRow);
	for(AnimalDto schAnimal : searchList){
		out.print(schAnimal + "<br>");
	}
	%>
	
	<h2>8. 나의 관심동물 조회</h2>
	<%
	String mid = "test1";
	startRow = 1;
	endRow = 10;
	
	ArrayList<AnimalDto> likeList = aDao.getLikeList(mid, startRow, endRow);
	for(AnimalDto likeAnimal : likeList){
		out.print(likeAnimal + "<br>");
	}
	%>
	<%=likeList.size() %>
	--%>
</body>
</html>
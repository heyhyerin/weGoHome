package com.lec.animalAdoption.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.animalAdoption.dao.ReviewBoardDao;
import com.lec.animalAdoption.dto.ReviewBoardDto;

public class RBoardSchListService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String schStr = request.getParameter("searchBox");
		
		String pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		final int PAGESIZE = 10, BLOCKSIZE = 10;
		/*
		 * int startRow = (currentPage - 1) * PAGESIZE + 1; int endRow = startRow +
		 * PAGESIZE - 1;
		 */
		int startRow = (currentPage - 1) * PAGESIZE + 1;
		int endRow = startRow + PAGESIZE - 1;
		
		ReviewBoardDao rbDao = ReviewBoardDao.getInstance();
		ArrayList<ReviewBoardDto> reviewList = rbDao.searchReviewList(schStr, startRow, endRow);
		request.setAttribute("reviewList", reviewList);
		
		int totCnt = rbDao.getSchReviewTotCnt(schStr);
		int pageCnt = (int) Math.ceil((double) totCnt / PAGESIZE);
		int startPage = ((currentPage - 1) / BLOCKSIZE) * BLOCKSIZE + 1;
		int endPage = startPage + BLOCKSIZE - 1;
		if (endPage > pageCnt) {
			endPage = pageCnt;
		}
		
		request.setAttribute("BLOCKSIZE", BLOCKSIZE);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("pageCnt", pageCnt);
		request.setAttribute("totCnt", totCnt);
		request.setAttribute("pageNum", currentPage);
	}

}

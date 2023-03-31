package com.lec.animalAdoption.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.animalAdoption.dao.ReviewBoardDao;
import com.lec.animalAdoption.dto.ReviewBoardDto;

public class RBoardListService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String pageNum = request.getParameter("pageNum");
		String order_by = request.getParameter("order_by");

		if(pageNum == null) {
			if(request.getAttribute("pageNum") != null) {
				pageNum = (String) request.getAttribute("pageNum");
			} else {
				pageNum = "1";
			}
		}

		if(order_by == null) {
			order_by = "rdate";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		final int PAGESIZE = 10, BLOCKSIZE = 10;
		int startRow = (currentPage - 1) * PAGESIZE + 1;
		int endRow = startRow + PAGESIZE - 1;
		
		ReviewBoardDao rbDao = ReviewBoardDao.getInstance();

		if("rhit".equals(order_by)) {
			ArrayList<ReviewBoardDto> reviewList = rbDao.getReviewListHit(startRow, endRow);
			request.setAttribute("reviewList", reviewList);
			
			int totCnt = rbDao.getReviewTotCnt();
			int pageCnt = (int) Math.ceil((double) totCnt / PAGESIZE);
			int startPage = ((currentPage - 1) / BLOCKSIZE) * BLOCKSIZE + 1;
			int endPage = startPage + BLOCKSIZE - 1;
			if (endPage > pageCnt) {
				endPage = pageCnt;
			}
			
			request.setAttribute("order_by", order_by);
			request.setAttribute("BLOCKSIZE", BLOCKSIZE);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("pageCnt", pageCnt);
			request.setAttribute("totCnt", totCnt);
			request.setAttribute("pageNum", currentPage);
			
		} else if("rdate".equals(order_by)){
			ArrayList<ReviewBoardDto> reviewList = rbDao.getReviewList(startRow, endRow);
			request.setAttribute("reviewList", reviewList);
			
			int totCnt = rbDao.getReviewTotCnt();
			int pageCnt = (int) Math.ceil((double) totCnt / PAGESIZE);
			int startPage = ((currentPage - 1) / BLOCKSIZE) * BLOCKSIZE + 1;
			int endPage = startPage + BLOCKSIZE - 1;
			if (endPage > pageCnt) {
				endPage = pageCnt;
			}
			
			request.setAttribute("order_by", order_by);
			request.setAttribute("BLOCKSIZE", BLOCKSIZE);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("pageCnt", pageCnt);
			request.setAttribute("totCnt", totCnt);
			request.setAttribute("pageNum", currentPage);
			
		}
	}

}

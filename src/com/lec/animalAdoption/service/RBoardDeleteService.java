package com.lec.animalAdoption.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.animalAdoption.dao.ReviewBoardDao;

public class RBoardDeleteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int rno = Integer.parseInt(request.getParameter("rno"));
		
		ReviewBoardDao rbDao = ReviewBoardDao.getInstance();
		int result = rbDao.deleteReview(rno);
		
		if (result == ReviewBoardDao.SUCCESS) {
			request.setAttribute("resultMsg", "게시글 삭제가 정상적으로 처리되었습니다.");
		} else if (result == ReviewBoardDao.FAIL) {
			request.setAttribute("resultErrorMsg", "게시글 삭제가 실패했습니다.");
		}
	}

}

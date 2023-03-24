package com.lec.animalAdoption.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.animalAdoption.dao.ReviewBoardDao;
import com.lec.animalAdoption.dto.ReviewBoardDto;

public class RBoardContentService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int rno = Integer.parseInt(request.getParameter("rno"));
		
		ReviewBoardDao rbDao = ReviewBoardDao.getInstance();
		ReviewBoardDto review = rbDao.getReview(rno);
		
		if(review != null) {
			request.setAttribute("review", review);
		} else {
			
		}
	}

}

package com.lec.animalAdoption.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.animalAdoption.dao.AnimalCommentDao;
import com.lec.animalAdoption.dao.AnimalDao;
import com.lec.animalAdoption.dto.AnimalCommentDto;
import com.lec.animalAdoption.dto.AnimalDto;

public class CommentViewService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int acno = Integer.parseInt(request.getParameter("acno"));

		// 수정 댓글 정보 출력
		AnimalCommentDao acDao = AnimalCommentDao.getInstance();
		AnimalCommentDto comment = acDao.getComment(acno);
		
		request.setAttribute("comment", comment);

	}

}

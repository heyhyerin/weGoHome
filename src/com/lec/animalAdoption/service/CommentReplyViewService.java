package com.lec.animalAdoption.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.animalAdoption.dao.AnimalCommentDao;
import com.lec.animalAdoption.dto.AnimalCommentDto;

public class CommentReplyViewService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int acno = Integer.parseInt(request.getParameter("acgroup"));
		
		AnimalCommentDao acDao = AnimalCommentDao.getInstance();
		AnimalCommentDto originComment = acDao.getComment(acno);
		System.out.println(originComment);
		
		request.setAttribute("originComment", originComment);

	}

}

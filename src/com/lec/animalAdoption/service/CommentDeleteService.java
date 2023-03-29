package com.lec.animalAdoption.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.animalAdoption.dao.AnimalCommentDao;

public class CommentDeleteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int acno = Integer.parseInt(request.getParameter("acno"));
		
		AnimalCommentDao acDao = AnimalCommentDao.getInstance();
		int result = acDao.deleteComment(acno);
		
		if(result == AnimalCommentDao.SUCCESS) {
			request.setAttribute("resultMsg", "댓글 삭제가 정상적으로 처리되었습니다.");
		} else if (result == AnimalCommentDao.FAIL) {
			request.setAttribute("resultErrorMsg", "댓글 삭제가 실패했습니다.");
		}

	}

}

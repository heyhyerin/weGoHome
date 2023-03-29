package com.lec.animalAdoption.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.animalAdoption.dao.AnimalCommentDao;
import com.lec.animalAdoption.dto.AnimalCommentDto;

public class CommentWriteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mid = request.getParameter("mid");
		int ano = Integer.parseInt(request.getParameter("ano"));
		String accontent = request.getParameter("accontent");
		String acip = request.getLocalAddr();
		
		AnimalCommentDao acDao = AnimalCommentDao.getInstance();
		AnimalCommentDto comment = new AnimalCommentDto(0, mid, ano, accontent, null, acip);
		int result = acDao.writeComment(comment);
		
		if (result == AnimalCommentDao.SUCCESS) {
			request.setAttribute("resultMsg", "문의글 작성이 완료되었습니다.");
		} else if (result == AnimalCommentDao.FAIL) {
			request.setAttribute("resultErrorMsg", "문의글 작성이 실패했습니다.");
		}
	}

}

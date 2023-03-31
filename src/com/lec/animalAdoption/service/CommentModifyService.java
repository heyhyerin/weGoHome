package com.lec.animalAdoption.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.animalAdoption.dao.AnimalCommentDao;
import com.lec.animalAdoption.dto.AnimalCommentDto;

public class CommentModifyService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int acno = Integer.parseInt(request.getParameter("acno"));
		String accontent = request.getParameter("accontent");
		String acip = request.getLocalAddr();
		
		AnimalCommentDao acDao = AnimalCommentDao.getInstance();
		AnimalCommentDto comment = new AnimalCommentDto(acno, 0, null, null, accontent, null, 0, 0, acip, null);
		
		int result = acDao.modifyComment(comment);
		
		if(result == AnimalCommentDao.SUCCESS) {
			request.setAttribute("resultMsg", "문의글 수정이 완료되었습니다.");
		} else if (result == AnimalCommentDao.FAIL ) {
			request.setAttribute("resultMsg", "문의글 수정이 실패했습니다.");
		}
		
	}

}

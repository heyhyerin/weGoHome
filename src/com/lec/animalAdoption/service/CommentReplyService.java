package com.lec.animalAdoption.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.animalAdoption.dao.AnimalCommentDao;
import com.lec.animalAdoption.dao.ReviewBoardDao;
import com.lec.animalAdoption.dto.AnimalCommentDto;
import com.lec.animalAdoption.dto.ShelterDto;

public class CommentReplyService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession httpsession = request.getSession();
		ShelterDto shelter = (ShelterDto) httpsession.getAttribute("shelter"); 
		
		int ano = Integer.parseInt(request.getParameter("ano"));
		String sid = shelter.getSid();
		String accontent = request.getParameter("accontent");
		int acgroup = Integer.parseInt(request.getParameter("acgroup"));
		int acstep = Integer.parseInt(request.getParameter("acstep"));
		String acip = request.getLocalAddr();
		
		AnimalCommentDao acDao = AnimalCommentDao.getInstance();
		AnimalCommentDto comment = new AnimalCommentDto(0, ano, null, sid, accontent, null, acgroup, acstep, acip, null);
		int result = acDao.replyComment(comment);
		
		if (result == AnimalCommentDao.SUCCESS) {
			request.setAttribute("resultMsg", "답변글 작성이 완료되었습니다.");
		} else if (result == AnimalCommentDao.FAIL) {
			request.setAttribute("resultErrorMsg", "답변글 작성이 실패했습니다.");
		}
	}

}

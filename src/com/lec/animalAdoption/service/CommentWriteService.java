package com.lec.animalAdoption.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.animalAdoption.dao.AnimalCommentDao;
import com.lec.animalAdoption.dto.AnimalCommentDto;
import com.lec.animalAdoption.dto.MemberDto;
import com.lec.animalAdoption.dto.ShelterDto;

public class CommentWriteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession httpsession = request.getSession();
		MemberDto member = (MemberDto) httpsession.getAttribute("member");
		ShelterDto shelter = (ShelterDto) httpsession.getAttribute("shelter"); 
		String mid = null;
		String sid = null;
		if (member != null || shelter != null) {
			if(member != null && shelter == null) {
				mid = member.getMid();
			}
			if(shelter != null && member == null) {
				sid = shelter.getSid();
			}
		}
		
		int ano = Integer.parseInt(request.getParameter("ano"));
		String accontent = request.getParameter("accontent");
		String acip = request.getLocalAddr();
		
		AnimalCommentDao acDao = AnimalCommentDao.getInstance();
		AnimalCommentDto comment = new AnimalCommentDto(0, ano, mid, sid, accontent, null, 0, 0, acip, null);
		int result = acDao.writeComment(comment);
		
		if (result == AnimalCommentDao.SUCCESS) {
			request.setAttribute("resultMsg", "문의글 작성이 완료되었습니다.");
		} else if (result == AnimalCommentDao.FAIL) {
			request.setAttribute("resultErrorMsg", "문의글 작성이 실패했습니다.");
		}
	}

}

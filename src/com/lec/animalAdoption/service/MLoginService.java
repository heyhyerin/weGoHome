package com.lec.animalAdoption.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.animalAdoption.dao.MemberDao;
import com.lec.animalAdoption.dto.MemberDto;

public class MLoginService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("next", request.getParameter("next"));
		String mid = request.getParameter("mid");
		String mpw = request.getParameter("mpw");
		
		MemberDao mDao = MemberDao.getInstance();
		int result = mDao.loginMember(mid, mpw);
		
		if(result == MemberDao.SUCCESS) {
			HttpSession session = request.getSession();
			MemberDto member = mDao.getMember(mid);
			session.setAttribute("member", member);
		} else if(result == MemberDao.FAIL) {
			request.setAttribute("resultErrorMsg", "아이디 또는 비밀번호를 확인하세요.");
		}
	}

}

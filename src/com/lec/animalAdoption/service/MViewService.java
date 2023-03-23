package com.lec.animalAdoption.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.animalAdoption.dao.MemberDao;
import com.lec.animalAdoption.dto.MemberDto;

public class MViewService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mid = request.getParameter("mid");
		
		MemberDao mDao = MemberDao.getInstance();
		MemberDto member = mDao.getMember(mid);
		
		request.setAttribute("member", member);
	}

}

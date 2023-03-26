package com.lec.animalAdoption.service;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.animalAdoption.dao.MemberDao;
import com.lec.animalAdoption.dto.MemberDto;

public class MJoinService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		String mid = request.getParameter("mid");
		String mpw = request.getParameter("mpw");
		String mname = request.getParameter("mname");
		String mtel = request.getParameter("mtel");
		String memail = request.getParameter("memail");
		String mgender = request.getParameter("mgender");
		Date mbirth = null;
		String mbirthStr = request.getParameter("mbirth");
		if (!mbirthStr.equals("")) {
			mbirth = Date.valueOf(mbirthStr);
		}
		String maddress = request.getParameter("maddress");

		MemberDao mDao = MemberDao.getInstance();
		MemberDto member = new MemberDto(mid, mpw, mname, mtel, memail, mgender, mbirth, maddress);

		int result = mDao.joinMember(member);
		if (result == MemberDao.SUCCESS) {
			HttpSession session = request.getSession();
			session.setAttribute("mid", mid);
			session.setAttribute("resultMsg", "회원가입이 완료되었습니다.");
		} else if (result == MemberDao.FAIL) {
			request.setAttribute("resultErrorMsg", "회원가입이 실패했습니다.");
		}

	}

}

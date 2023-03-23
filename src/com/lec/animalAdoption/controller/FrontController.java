package com.lec.animalAdoption.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.animalAdoption.service.LoginService;
import com.lec.animalAdoption.service.LogoutService;
import com.lec.animalAdoption.service.MEmailConfirmService;
import com.lec.animalAdoption.service.MIdConfirmService;
import com.lec.animalAdoption.service.MTelConfirmService;
import com.lec.animalAdoption.service.MJoinService;
import com.lec.animalAdoption.service.MModifyService;
import com.lec.animalAdoption.service.MViewService;
import com.lec.animalAdoption.service.MWithDrawalService;
import com.lec.animalAdoption.service.RBoardListService;
import com.lec.animalAdoption.service.RBoardWriteService;
import com.lec.animalAdoption.service.Service;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public FrontController() {
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		actionDo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		actionDo(request, response);
	}

	private void actionDo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String command = uri.substring(conPath.length());

		String viewPage = null;
		Service service = null;

		// main
		if (command.equals("/main.do")) {
			viewPage = "main/main.jsp";
		}

		// member ----------------------------------------
		// 로그인
		else if (command.equals("/loginView.do")) {
			viewPage = "member/login.jsp";
		} else if (command.equals("/login.do")) {
			service = new LoginService();
			service.execute(request, response);
			viewPage = "main.do";
		}
		
		// 회원가입
		else if (command.equals("/joinView.do")) {
			viewPage = "member/join.jsp";
		} else if (command.equals("/midConfirm.do")) {
			service = new MIdConfirmService();
			service.execute(request, response);
			viewPage = "member/midConfirm.jsp";
		} else if (command.equals("/mtelConfirm.do")) {
			service = new MTelConfirmService();
			service.execute(request, response);
			viewPage = "member/mtelConfirm.jsp";
		} else if (command.equals("/memailConfirm.do")) {
			service = new MEmailConfirmService();
			service.execute(request, response);
			viewPage = "member/memailConfirm.jsp";
		} else if (command.equals("/join.do")) {
			service = new MJoinService();
			service.execute(request, response);
			viewPage = "loginView.do";
		}
		
		// 회원 정보 수정
		else if (command.equals("/memberView.do")) {
			service = new MViewService();
			service.execute(request, response);
			viewPage = "member/memberModify.jsp";
		} else if(command.equals("/memberModify.do")) {
			service = new MModifyService();
			service.execute(request, response);
			viewPage = "memberView.do";
		}
		
		// 회원 탈퇴
		else if (command.equals("/memberWithDrawal.do")) {
			service = new MWithDrawalService();
			service.execute(request, response);
			viewPage = "main.do";
		}
		
		// 로그아웃
		else if (command.equals("/logout.do")) {
			service = new LogoutService();
			service.execute(request, response);
			viewPage = "main.do";
		}

		
		// reviewBoard ----------------------------------------
		// 리뷰게시판 글 목록
		else if (command.equals("reviewBoardList.do")) {
			service = new RBoardListService();
			service.execute(request, response);
			viewPage = "reviewBoard/reviewBoardList.jsp";
		}

		// 리뷰게시판 글 작성
		else if (command.equals("/reviewBoardWriteView.do")) {
			viewPage = "reviewBoard/reviewBoardWrite.jsp";
		} else if (command.equals("/reviewBoardWrite.do")) {
			service = new RBoardWriteService();
			service.execute(request, response);
			viewPage = "reviewBoardList.do";
		} 
		
			
			
			
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);

	}

}

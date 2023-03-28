package com.lec.animalAdoption.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.animalAdoption.service.*;

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
			viewPage = "member/memberLogin.jsp";
		} else if (command.equals("/memberLogin.do")) {
			service = new MLoginService();
			service.execute(request, response);
			viewPage = "main.do";
		}

		// 회원가입
		else if (command.equals("/joinView.do")) {
			viewPage = "member/memberJoin.jsp";
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
		} else if (command.equals("/memberModify.do")) {
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
		
		// 관심 동물 목록 출력
		else if (command.equals("/memberLikeList.do")) {
			service = new MLikeListService();
			service.execute(request, response);
			viewPage = "member/memberLikeList.jsp";
		}
		
		// 관심동물 해제
		else if (command.equals("/mlikeListRemove.do")) {
			service = new LikeListRemoveService();
			service.execute(request, response);
			viewPage = "memberLikeList.do";
		}

		// shelter ----------------------------------------
		// 보호소 로그인
		else if (command.equals("/shelterLogin.do")) {
			service = new SLoginService();
			service.execute(request, response);
			viewPage = "main.do";
		}
		
		// 보호소 정보 수정
		else if (command.equals("/shelterView.do")) {
			service = new SViewService();
			service.execute(request, response);
			viewPage = "shelter/shelterModify.jsp";
		} else if (command.equals("/stelConfirm.do")) {
			service = new STelConfirmService();
			service.execute(request, response);
			viewPage = "shelter/stelConfirm.jsp";
		} else if (command.equals("/semailConfirm.do")) {
			service = new SEmailConfirmService();
			service.execute(request, response);
			viewPage = "shelter/semailConfirm.jsp";
		} else if (command.equals("/shelterModify.do")) {
			service = new SModifyService();
			service.execute(request, response);
			viewPage = "shelterView.do";
		}

		// shelter: 보호동물 공고 ---------------------------------
		// 보호동물 목록
		else if (command.equals("/shelterAList.do")) {
			service = new SaListService();
			service.execute(request, response);
			viewPage = "shelter/sAnimalList.jsp";
		}
		
		// 보호동물 글 작성
		else if (command.equals("/shelterAWriteView.do")) {
			viewPage = "shelter/sAnimalWrite.jsp";
		} else if (command.equals("/shelterAWrite.do")) {
			service = new SaWriteService();
			service.execute(request, response);
			viewPage = "shelterAList.do";
		}
		
		// 보호동물 글 수정
		else if (command.equals("/shelterAModifyView.do")) {
			service = new SaModifyViewService();
			service.execute(request, response);
			viewPage = "shelter/sAnimalModify.jsp";
		} else if (command.equals("/shelterAModify.do")) {
			service = new SaModifyService();
			service.execute(request, response);
			viewPage = "shelterAList.do";
		}
		
		// reviewBoard ----------------------------------------
		// 리뷰게시판 글 목록
		else if (command.equals("/reviewBoardList.do")) {
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

		// 리뷰게시판 글 상세보기
		else if (command.equals("/reviewBoardContent.do")) {
			service = new RBoardContentService();
			service.execute(request, response);
			viewPage = "reviewBoard/reviewBoardContent.jsp";
		}

		// 리뷰게시글 수정
		else if (command.equals("/reviewBoardModifyView.do")) {
			service = new RBoardContentService();
			service.execute(request, response);
			viewPage = "reviewBoard/reviewBoardModify.jsp";
		} else if (command.equals("/reviewBoardModify.do")) {
			service = new RBoardModifyService();
			service.execute(request, response);
			viewPage = "/reviewBoardList.do";
		}

		// 리뷰게시글 삭제
		else if (command.equals("/reviewBoardDelete.do")) {
			service = new RBoardDeleteService();
			service.execute(request, response);
			viewPage = "reviewBoardList.do";
		}

		// 특정 게시글에 답변글 작성
		else if (command.equals("/reviewBoardReplyView.do")) {
			service = new RBoardReplyViewService();
			service.execute(request, response);
			viewPage = "reviewBoard/reviewBoardReply.jsp";
		} else if (command.equals("/reviewBoardReply.do")) {
			service = new RBoardReplyService();
			service.execute(request, response);
			viewPage = "reviewBoardList.do";
		}

		// 리뷰게시판 검색
		else if (command.equals("/reviewSearch.do")) {
			service = new RBoardSearchService();
			service.execute(request, response);
			viewPage = "reviewBoard/reviewBoardList.jsp";
		}

		// animal ----------------------------------------
		// 보호동물 목록
		else if (command.equals("/animalBoardList.do")) {
			service = new ABoardListService();
			service.execute(request, response);
			viewPage = "animal/animalBoard.jsp";
		}
		// 보호동물 공고 작성
		else if (command.equals("/animalWriteView.do")) {
			viewPage = "animal/animalWrite.jsp";
		} else if (command.equals("/animalWrite.do")) {
			service = new AWriteService();
			service.execute(request, response);
			viewPage = "animalBoardList.do";
		}
		// 보호동물 상세보기
		else if (command.equals("/animalContent.do")) {
			service = new AContentService();
			service.execute(request, response);
			viewPage = "animal/animalContent.jsp";
		}

		// 보호동물 검색
		else if (command.equals("/animalSearch.do")) {
			service = new ASearchService();
			service.execute(request, response);
			viewPage = "animalBoardList.do";
		}

		// likeList ----------------------------------------
		// 관심동물 등록
		else if (command.equals("/likeListAdd.do")) {
			service = new LikeListAddService();
			service.execute(request, response);
			viewPage = "animalBoardList.do";
		}

		// 관심동물 해제
		else if (command.equals("/likeListRemove.do")) {
			service = new LikeListRemoveService();
			service.execute(request, response);
			viewPage = "animalBoardList.do";
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);

	}

}

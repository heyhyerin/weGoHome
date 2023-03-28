package com.lec.animalAdoption.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.animalAdoption.dao.AnimalDao;
import com.lec.animalAdoption.dto.AnimalDto;
import com.lec.animalAdoption.dto.MemberDto;
import com.lec.animalAdoption.dto.ShelterDto;

public class AListService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession httpSession = request.getSession();
		ShelterDto shelter = (ShelterDto)httpSession.getAttribute("shelter");
		
		String sid = "";
		if(shelter != null) {
			sid = shelter.getSid();
		}
		
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null) {
			if (request.getAttribute("pageNum") != null) {
				pageNum = (String) request.getAttribute("pageNum");
			} else {
				pageNum = "1";
			}
		}
		
		int currentPage = Integer.parseInt(pageNum);
		final int PAGESIZE = 10, BLOCKSIZE = 10;
		int startRow = (currentPage -1) * PAGESIZE + 1;
		int endRow = startRow + PAGESIZE -1;
		
		AnimalDao aDao = AnimalDao.getInstance();
		ArrayList<AnimalDto> animalList = aDao.getSAnimalList(sid, startRow, endRow);
		request.setAttribute("animalList", animalList);
		
		int totCnt = aDao.getSAnimalTotCnt(sid);
		int pageCnt = (int)Math.ceil((double)totCnt / PAGESIZE);
		int startPage = ((currentPage - 1) / BLOCKSIZE) * BLOCKSIZE + 1;
		int endPage = startPage + BLOCKSIZE - 1;
		if (endPage > pageCnt) {
			endPage = pageCnt;
		}
		
		request.setAttribute("BLOCKSIZE", BLOCKSIZE);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("pageCnt", pageCnt);
		request.setAttribute("totCnt", totCnt);
		request.setAttribute("pageNum", currentPage);
	}

}

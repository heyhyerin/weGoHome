package com.lec.animalAdoption.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.animalAdoption.dao.AnimalDao;
import com.lec.animalAdoption.dto.AnimalDto;
import com.lec.animalAdoption.dto.MemberDto;
import com.lec.animalAdoption.dto.ShelterDto;

public class ASearchService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession httpSession = request.getSession();
		MemberDto member = (MemberDto)httpSession.getAttribute("member");
		
		String mid = "";
		if (member != null) {
			mid = member.getMid();
		}
		String schAbreed = request.getParameter("abreed");
		String schAgender = request.getParameter("agender");
		String aweightStr = request.getParameter("aweight");
		int idx = aweightStr.indexOf("/");
		int schRowAweight = Integer.parseInt(aweightStr.substring(0, idx));
		int schHighAweight = Integer.parseInt(aweightStr.substring(idx+1));
		String schSname = request.getParameter("sname");
		
		// 검색 시 1page로
		String pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		final int PAGESIZE = 8, BLOCKSIZE = 10;
		int startRow = (currentPage -1) * PAGESIZE + 1;
		int endRow = startRow + PAGESIZE -1;
		
		AnimalDao aDao = AnimalDao.getInstance();
		ArrayList<AnimalDto> animalList = aDao.searchAnimal(mid, schAbreed, schAgender, schRowAweight, schHighAweight, schSname, startRow, endRow);
		request.setAttribute("animalList", animalList);
		
		int totCnt = aDao.getSchAnimalTotCnt(schAbreed, schAgender, schRowAweight, schHighAweight, schSname);
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

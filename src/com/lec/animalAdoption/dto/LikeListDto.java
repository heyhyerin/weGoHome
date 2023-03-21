package com.lec.animalAdoption.dto;

public class LikeListDto {
	// likeList
	private int lno;
	private String mid;
	private int ano;

	public LikeListDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public LikeListDto(int lno, String mid, int ano) {
		super();
		this.lno = lno;
		this.mid = mid;
		this.ano = ano;
	}

	public int getLno() {
		return lno;
	}

	public void setLno(int lno) {
		this.lno = lno;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public int getAno() {
		return ano;
	}

	public void setAno(int ano) {
		this.ano = ano;
	}

}

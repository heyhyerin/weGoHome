package com.lec.animalAdoption.dto;

import java.sql.Date;
import java.sql.Timestamp;

public class AnimalCommentDto {
	private int acno;
	private String mid;
	private int ano;
	private String accontent;
	private Timestamp acrdate;
	private String acip;

	public AnimalCommentDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public AnimalCommentDto(int acno, String mid, int ano, String accontent, Timestamp acrdate, String acip) {
		super();
		this.acno = acno;
		this.mid = mid;
		this.ano = ano;
		this.accontent = accontent;
		this.acrdate = acrdate;
		this.acip = acip;
	}

	public int getAcno() {
		return acno;
	}

	public void setAcno(int acno) {
		this.acno = acno;
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

	public String getAccontent() {
		return accontent;
	}

	public void setAccontent(String accontent) {
		this.accontent = accontent;
	}

	public Timestamp getAcrdate() {
		return acrdate;
	}

	public void setAcrdate(Timestamp acrdate) {
		this.acrdate = acrdate;
	}

	public String getAcip() {
		return acip;
	}

	public void setAcip(String acip) {
		this.acip = acip;
	}

	@Override
	public String toString() {
		return "AnimalComment [acno=" + acno + ", mid=" + mid + ", ano=" + ano + ", accontent=" + accontent
				+ ", acrdate=" + acrdate + ", acip=" + acip + "]";
	}

}

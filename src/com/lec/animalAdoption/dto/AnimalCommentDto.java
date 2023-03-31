package com.lec.animalAdoption.dto;

import java.sql.Timestamp;

public class AnimalCommentDto {
	private int acno;
	private int ano;
	private String mid;
	private String sid;
	private String accontent;
	private Timestamp acrdate;
	private int acgroup;
	private int acstep;
	private String acip;

	// member & shelter
	private String name;

	public AnimalCommentDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public AnimalCommentDto(int acno, int ano, String mid, String sid, String accontent, Timestamp acrdate, int acgroup,
			int acstep, String acip, String name) {
		super();
		this.acno = acno;
		this.ano = ano;
		this.mid = mid;
		this.sid = sid;
		this.accontent = accontent;
		this.acrdate = acrdate;
		this.acgroup = acgroup;
		this.acstep = acstep;
		this.acip = acip;
		this.name = name;
	}

	public int getAcno() {
		return acno;
	}

	public void setAcno(int acno) {
		this.acno = acno;
	}

	public int getAno() {
		return ano;
	}

	public void setAno(int ano) {
		this.ano = ano;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
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

	public int getAcgroup() {
		return acgroup;
	}

	public void setAcgroup(int acgroup) {
		this.acgroup = acgroup;
	}

	public int getAcstep() {
		return acstep;
	}

	public void setAcstep(int acstep) {
		this.acstep = acstep;
	}

	public String getAcip() {
		return acip;
	}

	public void setAcip(String acip) {
		this.acip = acip;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "AnimalCommentDto [acno=" + acno + ", ano=" + ano + ", mid=" + mid + ", sid=" + sid + ", accontent="
				+ accontent + ", acrdate=" + acrdate + ", acgroup=" + acgroup + ", acstep=" + acstep + ", acip=" + acip
				+ ", name=" + name + "]";
	}

}

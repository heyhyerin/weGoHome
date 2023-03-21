package com.lec.animalAdoption.dto;

import java.sql.Timestamp;

public class ReviewBoardDto {

	// reviewBoard
	private int rno;
	private String mid;
	private String sid;
	private String rtitle;
	private String rcontent;
	private String rpw;
	private String rphoto;
	private Timestamp rrdate;
	private int rhit;
	private int rgroup;
	private int rstep;
	private int rindent;
	private String rip;

	// member
	private String mname;

	public ReviewBoardDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ReviewBoardDto(int rno, String mid, String sid, String rtitle, String rcontent, String rpw, String rphoto,
			Timestamp rrdate, int rhit, int rgroup, int rstep, int rindent, String rip, String mname) {
		super();
		this.rno = rno;
		this.mid = mid;
		this.sid = sid;
		this.rtitle = rtitle;
		this.rcontent = rcontent;
		this.rpw = rpw;
		this.rphoto = rphoto;
		this.rrdate = rrdate;
		this.rhit = rhit;
		this.rgroup = rgroup;
		this.rstep = rstep;
		this.rindent = rindent;
		this.rip = rip;
		this.mname = mname;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
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

	public String getRtitle() {
		return rtitle;
	}

	public void setRtitle(String rtitle) {
		this.rtitle = rtitle;
	}

	public String getRcontent() {
		return rcontent;
	}

	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}

	public String getRpw() {
		return rpw;
	}

	public void setRpw(String rpw) {
		this.rpw = rpw;
	}

	public String getRphoto() {
		return rphoto;
	}

	public void setRphoto(String rphoto) {
		this.rphoto = rphoto;
	}

	public Timestamp getRrdate() {
		return rrdate;
	}

	public void setRrdate(Timestamp rrdate) {
		this.rrdate = rrdate;
	}

	public int getRhit() {
		return rhit;
	}

	public void setRhit(int rhit) {
		this.rhit = rhit;
	}

	public int getRgroup() {
		return rgroup;
	}

	public void setRgroup(int rgroup) {
		this.rgroup = rgroup;
	}

	public int getRstep() {
		return rstep;
	}

	public void setRstep(int rstep) {
		this.rstep = rstep;
	}

	public int getRindent() {
		return rindent;
	}

	public void setRindent(int rindent) {
		this.rindent = rindent;
	}

	public String getRip() {
		return rip;
	}

	public void setRip(String rip) {
		this.rip = rip;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	@Override
	public String toString() {
		return "ReviewBoardDto [rno=" + rno + ", mid=" + mid + ", sid=" + sid + ", rtitle=" + rtitle + ", rcontent="
				+ rcontent + ", rpw=" + rpw + ", rphoto=" + rphoto + ", rrdate=" + rrdate + ", rhit=" + rhit
				+ ", rgroup=" + rgroup + ", rstep=" + rstep + ", rindent=" + rindent + ", rip=" + rip + ", mname="
				+ mname + "]";
	}

}

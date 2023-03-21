package com.lec.animalAdoption.dto;

public class ShelterDto {
	public String sid;
	public String spw;
	public String sname;
	public String stel;
	public String semail;
	public String saddress;

	public ShelterDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ShelterDto(String sid, String spw, String sname, String stel, String semail, String saddress) {
		super();
		this.sid = sid;
		this.spw = spw;
		this.sname = sname;
		this.stel = stel;
		this.semail = semail;
		this.saddress = saddress;
	}

	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}

	public String getSpw() {
		return spw;
	}

	public void setSpw(String spw) {
		this.spw = spw;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public String getStel() {
		return stel;
	}

	public void setStel(String stel) {
		this.stel = stel;
	}

	public String getSemail() {
		return semail;
	}

	public void setSemail(String semail) {
		this.semail = semail;
	}

	public String getSaddress() {
		return saddress;
	}

	public void setSaddress(String saddress) {
		this.saddress = saddress;
	}

	@Override
	public String toString() {
		return "ShelterDto [sid=" + sid + ", spw=" + spw + ", sname=" + sname + ", stel=" + stel + ", semail=" + semail
				+ ", saddress=" + saddress + "]";
	}

}

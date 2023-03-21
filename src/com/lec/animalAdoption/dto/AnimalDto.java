package com.lec.animalAdoption.dto;

import java.sql.Timestamp;

public class AnimalDto {

	// animal
	private int ano;
	private String sid;
	private String aphoto;
	private String abreed;
	private String agender;
	private int aage;
	private int aweight;
	private String acontent;
	private String aaddress;
	private Timestamp ardate;
	private String aadopt;
	private String aip;

	// shelter
	private String sname;
	private String stel;
	private String semail;
	private String saddress;

	public AnimalDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public AnimalDto(int ano, String sid, String aphoto, String abreed, String agender, int aage, int aweight,
			String acontent, String aaddress, Timestamp ardate, String aadopt, String aip, String sname, String stel,
			String semail, String saddress) {
		super();
		this.ano = ano;
		this.sid = sid;
		this.aphoto = aphoto;
		this.abreed = abreed;
		this.agender = agender;
		this.aage = aage;
		this.aweight = aweight;
		this.acontent = acontent;
		this.aaddress = aaddress;
		this.ardate = ardate;
		this.aadopt = aadopt;
		this.aip = aip;
		this.sname = sname;
		this.stel = stel;
		this.semail = semail;
		this.saddress = saddress;
	}

	public int getAno() {
		return ano;
	}

	public void setAno(int ano) {
		this.ano = ano;
	}

	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}

	public String getAphoto() {
		return aphoto;
	}

	public void setAphoto(String aphoto) {
		this.aphoto = aphoto;
	}

	public String getAbreed() {
		return abreed;
	}

	public void setAbreed(String abreed) {
		this.abreed = abreed;
	}

	public String getAgender() {
		return agender;
	}

	public void setAgender(String agender) {
		this.agender = agender;
	}

	public int getAage() {
		return aage;
	}

	public void setAage(int aage) {
		this.aage = aage;
	}

	public int getAweight() {
		return aweight;
	}

	public void setAweight(int aweight) {
		this.aweight = aweight;
	}

	public String getAcontent() {
		return acontent;
	}

	public void setAcontent(String acontent) {
		this.acontent = acontent;
	}

	public String getAaddress() {
		return aaddress;
	}

	public void setAaddress(String aaddress) {
		this.aaddress = aaddress;
	}

	public Timestamp getArdate() {
		return ardate;
	}

	public void setArdate(Timestamp ardate) {
		this.ardate = ardate;
	}

	public String getAadopt() {
		return aadopt;
	}

	public void setAadopt(String aadopt) {
		this.aadopt = aadopt;
	}

	public String getAip() {
		return aip;
	}

	public void setAip(String aip) {
		this.aip = aip;
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
		return "AnimalDto [ano=" + ano + ", sid=" + sid + ", aphoto=" + aphoto + ", abreed=" + abreed + ", agender="
				+ agender + ", aage=" + aage + ", aweight=" + aweight + ", acontent=" + acontent + ", aaddress="
				+ aaddress + ", ardate=" + ardate + ", aadopt=" + aadopt + ", aip=" + aip + ", sname=" + sname
				+ ", stel=" + stel + ", semail=" + semail + ", saddress=" + saddress + "]";
	}

}

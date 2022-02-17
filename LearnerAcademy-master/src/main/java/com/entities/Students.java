package com.entities;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Students {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int studentid;
	private String studentname;
	private String fathername;
	private String mothername;
	private String studentaddress;
	private String studentcontact;
	private String studentemail;
	private Date dob;
	private Date doa;
	
	@ManyToOne(fetch = FetchType.LAZY,cascade = CascadeType.ALL)
	@JoinColumn(name = "classid",insertable = false,updatable = false)
	private Classes classstudent;
	private int classid;
	
	public int getStudentid() {
		return studentid;
	}
	public void setStudentid(int studentid) {
		this.studentid = studentid;
	}
	public String getStudentname() {
		return studentname;
	}
	public void setStudentname(String studentname) {
		this.studentname = studentname;
	}
	public String getFathername() {
		return fathername;
	}
	public void setFathername(String fathername) {
		this.fathername = fathername;
	}
	public String getMothername() {
		return mothername;
	}
	public void setMothername(String mothername) {
		this.mothername = mothername;
	}
	public String getStudentaddress() {
		return studentaddress;
	}
	public void setStudentaddress(String studentaddress) {
		this.studentaddress = studentaddress;
	}
	public String getStudentcontact() {
		return studentcontact;
	}
	public void setStudentcontact(String studentcontact) {
		this.studentcontact = studentcontact;
	}
	public String getStudentemail() {
		return studentemail;
	}
	public void setStudentemail(String studentemail) {
		this.studentemail = studentemail;
	}
	public Date getDob() {
		return dob;
	}
	public void setDob(Date dob) {
		this.dob = dob;
	}
	public Date getDoa() {
		return doa;
	}
	public void setDoa(Date doa) {
		this.doa = doa;
	}
	public Classes getClassstudent() {
		return classstudent;
	}
	public void setClassstudent(Classes classstudent) {
		this.classstudent = classstudent;
	}
	public int getClassid() {
		return classid;
	}
	public void setClassid(int classid) {
		this.classid = classid;
	}
	@Override
	public String toString() {
		return "Students [studentid=" + studentid + ", studentname=" + studentname + ", fathername=" + fathername
				+ ", mothername=" + mothername + ", studentaddress=" + studentaddress + ", studentcontact="
				+ studentcontact + ", studentemail=" + studentemail + ", dob=" + dob + ", doa=" + doa
				+ ", classstudent=" + classstudent + ", classid=" + classid + "]";
	}
	public Students(String studentname, String fathername, String mothername, String studentaddress,
			String studentcontact, String studentemail, Date dob, Date doa, Classes classstudent, int classid) {
		super();
		this.studentname = studentname;
		this.fathername = fathername;
		this.mothername = mothername;
		this.studentaddress = studentaddress;
		this.studentcontact = studentcontact;
		this.studentemail = studentemail;
		this.dob = dob;
		this.doa = doa;
		this.classstudent = classstudent;
		this.classid = classid;
	}
	public Students() {
		super();
		// TODO Auto-generated constructor stub
	}	
	
}

package com.entities;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Teachers {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int teacherid;
	private String teachername;
	private int teacherage;
	private String teacherqualification;
	private String teacheraddress;
	private String teacheremail;
	private String teachercontact;
	
	
	@OneToMany(mappedBy = "teachers",cascade = CascadeType.ALL)
	private List<Subjects> subjects;


	public int getTeacherid() {
		return teacherid;
	}


	public void setTeacherid(int teacherid) {
		this.teacherid = teacherid;
	}


	public String getTeachername() {
		return teachername;
	}


	public void setTeachername(String teachername) {
		this.teachername = teachername;
	}


	public int getTeacherage() {
		return teacherage;
	}


	public void setTeacherage(int teacherage) {
		this.teacherage = teacherage;
	}


	public String getTeacherqualification() {
		return teacherqualification;
	}


	public void setTeacherqualification(String teacherqualification) {
		this.teacherqualification = teacherqualification;
	}


	public String getTeacheraddress() {
		return teacheraddress;
	}


	public void setTeacheraddress(String teacheraddress) {
		this.teacheraddress = teacheraddress;
	}


	public String getTeacheremail() {
		return teacheremail;
	}


	public void setTeacheremail(String teacheremail) {
		this.teacheremail = teacheremail;
	}


	public String getTeachercontact() {
		return teachercontact;
	}


	public void setTeachercontact(String teachercontact) {
		this.teachercontact = teachercontact;
	}


	public List<Subjects> getSubjects() {
		return subjects;
	}


	public void setSubjects(List<Subjects> subjects) {
		this.subjects = subjects;
	}


	@Override
	public String toString() {
		return "Teachers [teacherid=" + teacherid + ", teachername=" + teachername + ", teacherage=" + teacherage
				+ ", teacherqualification=" + teacherqualification + ", teacheraddress=" + teacheraddress
				+ ", teacheremail=" + teacheremail + ", teachercontact=" + teachercontact + ", subjects=" + subjects
				+ "]";
	}


	public Teachers(String teachername, int teacherage, String teacherqualification, String teacheraddress,
			String teacheremail, String teachercontact, List<Subjects> subjects) {
		super();
		this.teachername = teachername;
		this.teacherage = teacherage;
		this.teacherqualification = teacherqualification;
		this.teacheraddress = teacheraddress;
		this.teacheremail = teacheremail;
		this.teachercontact = teachercontact;
		this.subjects = subjects;
	}


	public Teachers() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}

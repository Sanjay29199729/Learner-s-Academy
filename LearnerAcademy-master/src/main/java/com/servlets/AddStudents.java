package com.servlets;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Students;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class AddStudents
 */
public class AddStudents extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddStudents() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
			String sname = request.getParameter("student_name");
			Date sdob=new Date(new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("student_dob")).getTime());
			String fname = request.getParameter("student_fathername");
			String mname = request.getParameter("student_mothername");
			String saddress = request.getParameter("student_address");
			String semail = request.getParameter("student_email");
			String scontact = request.getParameter("student_contact");
			
			System.out.println("DOB: "+sdob);
			//Creating Student
			Students student=new Students();
			student.setStudentname(sname);
			student.setDob(sdob);
			student.setFathername(fname);
			student.setMothername(mname);
			student.setStudentaddress(saddress);
			student.setStudentemail(semail);
			student.setStudentcontact(scontact);
			student.setDoa(new Date());
			
			Session s= FactoryProvider.getFactory().openSession();
			Transaction tx=s.beginTransaction();
			
			s.save(student);
			tx.commit();
			s.close();
			response.sendRedirect("students.jsp");
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}

package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Teachers;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class UpdateTeacher
 */
public class UpdateTeacher extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateTeacher() {
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
			
			String tname=request.getParameter("teacher_name");
			String tqualification=request.getParameter("teacher_qualification");
			String taddress=request.getParameter("teacher_address");
			String temail=request.getParameter("teacher_email");
			String tcontact=request.getParameter("teacher_contact");
			int tage=Integer.parseInt(request.getParameter("teacher_age"));
			int tid=Integer.parseInt(request.getParameter("teacher_id"));
			
			//Create Session
			Session s=FactoryProvider.getFactory().openSession();
			Transaction tx=s.beginTransaction();
			
			//Load Object
			Teachers teacher=(Teachers)s.get(Teachers.class, tid);
			teacher.setTeachername(tname);
			teacher.setTeacherage(tage);
			teacher.setTeacherqualification(tqualification);
			teacher.setTeacheraddress(taddress);
			teacher.setTeacheremail(temail);
			teacher.setTeachercontact(tcontact);
			
			//Save Update
			s.save(teacher);
			tx.commit();
			s.close();
			response.sendRedirect("teachers.jsp");
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}

package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Subjects;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class UpdateSubject
 */
public class UpdateSubject extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateSubject() {
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
			
			int subjectId=Integer.parseInt(request.getParameter("subject_id"));
			String subjectName = request.getParameter("subject_name");
			int classid=Integer.parseInt(request.getParameter("class_id"));
			int teacherid=Integer.parseInt(request.getParameter("teacher_id"));
			
			Session s=FactoryProvider.getFactory().openSession();
			Transaction tx=s.beginTransaction();
			
			//Load Object
			Subjects subject=(Subjects)s.get(Subjects.class, subjectId);
			subject.setSubjectname(subjectName);
			subject.setClassid(classid);
			subject.setTeacherid(teacherid);
			s.save(subject);
			tx.commit();
			s.close();
			response.sendRedirect("subjects.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}

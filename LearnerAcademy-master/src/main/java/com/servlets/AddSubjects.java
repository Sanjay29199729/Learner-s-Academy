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
 * Servlet implementation class AddSubjects
 */
public class AddSubjects extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddSubjects() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {

			String subjectName = request.getParameter("subject_name");

			// Creating Subject
			Subjects subject = new Subjects();
			subject.setSubjectname(subjectName);
			subject.setClassid(0);
			subject.setTeacherid(0);

			Session s = FactoryProvider.getFactory().openSession();
			Transaction tx = s.beginTransaction();

			s.save(subject);
			tx.commit();
			s.close();
			response.sendRedirect("subjects.jsp");

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}

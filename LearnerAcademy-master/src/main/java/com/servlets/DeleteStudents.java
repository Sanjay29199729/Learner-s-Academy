package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.entities.Students;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class DeleteStudents
 */
public class DeleteStudents extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteStudents() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			int sID=Integer.parseInt(request.getParameter("student_id"));
			Session s=FactoryProvider.getFactory().openSession();
			Transaction tx=s.beginTransaction();
			Query hql= s.createQuery("delete from Students as s where s.studentid=:x");
			hql.setParameter("x",sID);
			int result=hql.executeUpdate();
			System.out.println("Deleted : ");
			System.out.println(result);
			tx.commit();
			s.close();
			response.sendRedirect("students.jsp");
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

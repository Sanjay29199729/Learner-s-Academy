package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Classes;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class AddClasses
 */
public class AddClasses extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddClasses() {
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
			// title , content fetch
			
			String title=request.getParameter("title");
			String name=request.getParameter("name");
			
			//creating Class
			Classes classes = new Classes();
			classes.setClasstitle(title);
			classes.setClassname(name);
			
			//hibernate save
			Session s= FactoryProvider.getFactory().openSession();
			Transaction tx=s.beginTransaction();
			s.save(classes);
			tx.commit();
			s.close();
			response.sendRedirect("class.jsp");
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}

package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.entities.Users;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class LoginController
 */
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		
		response.sendRedirect("index.jsp");
		
		HttpSession session=request.getSession();
		session.invalidate();
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		

		try {

			String username = request.getParameter("username");
			String password = request.getParameter("password");

			if (!username.isEmpty() && !password.isEmpty()) {
				if (username.matches("^[A-Za-z0-9._]+$") && password.matches("^[A-Za-z0-9]+$")) {
					

					Session s = FactoryProvider.getFactory().openSession();
					Transaction tx = s.beginTransaction();

					Query hql = s.createQuery("from Users as u where u.username=:x and u.password=:y");
					hql.setParameter("x", username);
					hql.setParameter("y", password);
					hql.setMaxResults(1);
					Users user=(Users)hql.uniqueResult();
					if(user!=null) {
						HttpSession session=request.getSession();
						session.setAttribute("username", username);
						response.sendRedirect("welcome.jsp");
					}else {
						out.print("User Not Found!");
						response.sendRedirect("index.jsp");
					}
					
				}else {
					out.print("Sorry, username or password error!");
					response.sendRedirect("index.jsp");
				}

			} else {
				out.print("Username or Password Cannot be Null");
				response.sendRedirect("index.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}

package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.persistence.Query;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.entities.User;
import com.helper.FactoryProvider;


public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    public LoginServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		process(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

	
	private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		try {
			
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();


			String email = request.getParameter("user_email");
			String password = request.getParameter("user_password");
			String remember = request.getParameter("user_remember");
			

			SessionFactory factory = FactoryProvider.getFactory();
			Session session = factory.openSession();
			
			Transaction tx = session.beginTransaction();
			
			Query q = session.createQuery("from User where email=:x and password =:y");
			
			q.setParameter("x", email);
			q.setParameter("y", password);
			
			User user = (User) q.getSingleResult();
			
			tx.commit();
			
			session.close();

			//System.out.println(user.getEmail() + " " + user.getPassword() + " " + user.getUname());
			//System.out.println(user);
			HttpSession sess = request.getSession();
			sess.setAttribute("user", user);
			
			System.out.println("i have updated the session variable : ) ");
			response.sendRedirect("all_notes.jsp");
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.entities.User;
import com.helper.FactoryProvider;


public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public RegisterServlet() {
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
			
			String name = request.getParameter("user_name");
			String email = request.getParameter("user_email");
			String password = request.getParameter("user_password");
			String agree = request.getParameter("user_agree");
			
			

			System.out.println(name + " " + email + " " + password);
			SessionFactory factory = FactoryProvider.getFactory();
			Session session = factory.openSession();
			
			Transaction tx = session.beginTransaction();
			
			User user = new User(name, email, password);
			session.save(user);
			
			tx.commit();
			session.close();
			
			response.sendRedirect("login_page.jsp");
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}

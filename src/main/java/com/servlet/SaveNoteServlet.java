package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.entities.Notes;
import com.helper.FactoryProvider;



public class SaveNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


    public SaveNoteServlet() {
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
			
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			Notes note = new Notes(title, content, new Date());


			SessionFactory factory = FactoryProvider.getFactory();
			Session session = factory.openSession();
			
			Transaction tx = session.beginTransaction();
			
			
			session.save(note);
			
			tx.commit();
			session.close();
			

			response.sendRedirect("all_notes.jsp");
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}

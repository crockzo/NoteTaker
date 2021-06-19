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



public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


    public UpdateServlet() {
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
			
			int nid  = Integer.parseInt(request.getParameter("noteId").trim());
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			
			SessionFactory factory = FactoryProvider.getFactory();
			Session session = factory.openSession();
			
			Transaction tx = session.beginTransaction();
			
			Notes note = session.get(Notes.class, nid);
			note.setTitle(title);
			note.setContent(content);
			//session.save(note);
			
			tx.commit();
			session.close();
			
			
			response.sendRedirect("all_notes.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}




<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%
	System.out.println("I am chcking the session user Attribute : )");
	if(session.getAttribute("user") == null){
		System.out.println("I Have not find the session user Attribute : )");
		response.sendRedirect("login_page.jsp");
	}
%>

<%@ page import = "com.helper.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.entities.*" %>
<%@ page import = "org.hibernate.SessionFactory" %>
<%@ page import = "org.hibernate.Session" %>
<%@ page import = "org.hibernate.*" %>
<%@ page import = "org.hibernate.query.*" %>
<%@ page import = "org.hibernate.Query" %>
<%@ page import = "javax.persistence.TypedQuery" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All notes: Note Taker</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>



	<div class="container">
		<%@include file="navbar.jsp"%>
		<br>
		<h1 class="text-uppercase text-center">All Notes:</h1>


		<div class="row">

			<div class="col-12">

<%
	SessionFactory factory = FactoryProvider.getFactory();
	Session s = factory.openSession();
	
	@SuppressWarnings("unchecked")
    List<Notes> ll = s.createQuery("from Notes").getResultList();
	// TIP : always make the @table(name = "StartWithCapital__name");
	// s.createQuery("from StartWithCapital__name")
    
    for(Notes note : ll){
    	
%> 
				
				<div class="card mt-3" >
					<img class="card-img-top m-4 mx-auto" style="max-width:100px;" src="img/notepad.png" alt="Card image cap">
					<div class="card-body px-5">
						<h5 class="card-title"><%= note.getTitle() %></h5>
						<p class="card-text">
						<%= note.getContent() %>
						</p>
						<p ><b class="text-primary"><%= note.getAddedDate() %></b></p>
						<div class="container text-center mt-2">
						<a href="DeleteServlet?note_id=<%= note.getId() %>" class="btn btn-danger">Delete</a>
						<a href="edit.jsp?note_id=<%= note.getId() %>" class="btn btn-primary">Update</a>
						</div>
					</div>
				</div>

	
<%
	}
	s.close();
%>

			</div>

		</div>


	</div>
	

</body>
</html>
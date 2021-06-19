<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "com.entities.*" %>

<%

	User user =	(User) session.getAttribute("User");
	if(user == null){
		response.sendRedirect("loginPage.jsp");
	}

%>
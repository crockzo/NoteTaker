<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
	
<%

	if(session.getAttribute("user") != null){
		response.sendRedirect("index.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@ include file = "all_js_css.jsp" %>
</head>
<body>


<div class = "container">
	<%@ include file= "navbar.jsp" %>
	<div class = "container mt-8">
	
	<form action = "LoginServlet" method = "POST" >
	  <div class="form-group">
	    <label for="exampleInputEmail1">Email address</label>
	    <input name = "user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
	    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
	  </div>
	  <div class="form-group">
	    <label for="exampleInputPassword1">Password</label>
	    <input name = "user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
	  </div>
	  <div class="form-group form-check">
	    <input name = "user_remember" type="checkbox" class="form-check-input" id="exampleCheck1">
	    <label class="form-check-label" for="exampleCheck1">Check me out</label>
	  </div>
	  <button type="submit" class="btn btn-primary text-center">Submit</button>
	</form>
	
	
	</div>
	
</div>




</body>
</html>
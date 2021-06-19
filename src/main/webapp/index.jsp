<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	

<!doctype html>
	
<%

	if(session.getAttribute("user") == null){
		response.sendRedirect("login_page.jsp");
	}
%>

<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
   <title>Note Taker!</title>
   <%@include file="all_js_css.jsp"%>
   
  </head>
  <body>
   
<div class = "container">
	<%@ include file = "navbar.jsp" %>
	 
	 
	 <br>


		<div class="card  shadow bg-white py-5">
			<img alt="" class="img-fluid mx-auto" style="max-width: 400px;"
				src="img/notepad.png">
			<h1 class="text-primary text-uppercase text-center mt-3">Start
				Taking your notes</h1>

			<div class="container text-center">
				<a href="add_notes.jsp" class="btn btn-outline-primary text-center">Start
					here</a>
			</div>

		</div>
</div>


  </body>
</html>
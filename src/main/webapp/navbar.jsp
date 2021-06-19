<%@ page import = "com.entities.*" %>
<%

	if(session.getAttribute("user") != null){
		User user = (User) session.getAttribute("user");
%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand " href="index.jsp">Note Taker</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      
      <li class="nav-item">
        <a class="nav-link " href="add_notes.jsp">Add Note</a>
      </li>
    
      <li class="nav-item">
        <a class="nav-link " href="all_notes.jsp">Show Notes</a>
      </li>
    </ul>
   
   		<span class="bg-success" ><%= user.getUname() %></span>
      <a href = "LogoutServlet" class="btn btn-outline-light my-2 my-sm-0" >Logout</a>
    
  </div>
</nav>
<%
	}else{
%>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand " href="index.jsp">Note Taker</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
   
      <a href = "login_page.jsp" class="btn btn-outline-light my-2 my-sm-0" >Login</a>
      <a href = "register.jsp" class="btn btn-outline-light my-2 my-sm-0" >Register</a>
  
  </div>
</nav>

<%


	}

%>








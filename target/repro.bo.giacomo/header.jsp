<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Header</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

<style>

.hover:hover{
background-color: grey
}

</style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-dark">
<ul class="navbar-nav mr-auto">
	<li class="nav-item square rounded p-1 hover">
  		<a class="nav-link text-white" href="user.jsp">User List</a>
 	</li> 
  	<li class="nav-item square rounded p-1 hover">
  		<a class="nav-link text-white" href="registration.html">Insert User</a>
   	</li> 
	<li class="nav-item square rounded p-1 hover">
 		<a class="nav-link text-white" href="role.jsp">Role List</a>
  	</li> 
  	<li class="nav-item square rounded p-1 hover">
  		<a class="nav-link text-white" href="insertRole.jsp">Insert Role</a>
   	</li> 
   	  	<li class="nav-item square rounded p-1 hover">
  		<a class="nav-link text-white" href="surveyquestions.jsp">Survey Questions</a>
   	</li> 
   	  	<li class="nav-item square rounded p-1 hover">
  		<a class="nav-link text-white" href="insertSurveyquestion.jsp">Insert Survey Questions</a>
   	</li> 
   	</ul>
   	<ul class="navbar-nav">
  	<li class="nav-item square rounded p-1">
  		<span class="navbar-text text-white"> Welcome <%= session.getAttribute("userLoggedEmail") %> </span>
   	</li> 
	<li class="nav-item square rounded p-1 hover">
  		<a class="nav-link text-danger ml-auto" href="LogoutServlet">Logout</a>
   	</li> 
  </ul>
</nav>
<br>

<% 
if(request.getAttribute("deleteUser") == "OK"){ %>
	<p> Deleted user </p>
<% } %>
<% 
if(request.getAttribute("deleteUser") == "KO"){ %>
	<p> Unable to delete user </p>
<% } %>

<% 
if(request.getAttribute("deleteRole") == "OK"){ %>
	<p> Deleted role </p>
<% } %>
<% 
if(request.getAttribute("deleteRole") == "KO"){ %>
	<p> Unable to delete role </p>
<% } %>

<% 
if(request.getAttribute("deleteSurveyquestions") == "OK"){ %>
	<p> Deleted Survey Questions </p>
<% } %>
<% 
if(request.getAttribute("deleteSurveyquestions") == "KO"){ %>
	<p> Unable to delete Survey Questions </p>
<% } %>

<% 
if(request.getAttribute("updateUser") == "OK"){ %>
	<p> Updated user</p>
<% } %>
<% 
if(request.getAttribute("updateUser") == "KO"){ %>
	<p> Unable to update user  </p>
<% } %>

<% 
if(request.getAttribute("updateRole") == "OK"){ %>
	<p> Updated role </p>
<% } %>
<% 
if(request.getAttribute("updateRole") == "KO"){ %>
	<p> Unable to update role  </p>
<% } %>

<% 
if(request.getAttribute("insertRole") == "OK"){ %>
	<p> Inserted role </p>
<% } %>
<% 
if(request.getAttribute("insertRole") == "KO"){ %>
	<p> Unable to insert role  </p>
<% } %>

<%
if(request.getAttribute("insertSurveyquestions") == "OK"){ %>
	<p> Inserted Survey Questions </p>
<% } %>
<% 
if(request.getAttribute("insertSurveyquestions") == "KO"){ %>
	<p> Unable to insert  Survey Questions  </p>
<% } %>


<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>

</body>
</html>
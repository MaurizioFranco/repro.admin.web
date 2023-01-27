<%@page import="repro.bo.giacomo.proxima.informatica.academy.seventh.service.UserService"%>
<%@page import="proxima.informatica.academy.dto.UserDto"%>
<%@page import="proxima.informatica.academy.DatabaseManagerSingleton"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<%@include file="authentication.jsp" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

<head>
<meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Update User</title>
</head>
<body>
<%@include file="header.jsp" %>
<% System.out.println(request.getParameter("userId"));%>
<% UserDto user = UserService.getInstance().selectById(Integer.parseInt(request.getParameter("userId"))); %>
<% System.out.println(user.toString());%>
	<form action="./UpdateUserServlet" method="post">
		
	  	<label>ID</label><br>
  		<input type="number" name="id" value="<%= user.getId() %>"><br>
  		
  		<label>First Name</label><br>
  		<input type="text" name="firstname" value="<%= user.getFirstname() %>"><br>
  		
  		<label>Last Name</label><br>
  		<input type="text" name="lastname" value="<%= user.getLastname() %>"><br>
	
  		<label>Email</label><br>
  		<input type="email" name="email" value="<%= user.getEmail() %>"><br>
  		
  		<label>Password</label><br>
  		<input type="password" name="password" value="<%= user.getPassword() %>"><br>
  		
  		<label>Data of Birth</label><br>
  		<input type="date" name="dateofbirth" value="<%= user.getDateofbirth() %>"><br>
  		
  		<label>Registration Date</label><br>
  		<input type="datetime-local" name="regdate" value="<%= user.getRegdate() %>"><br>
  		
  		<label>Role</label><br>
  		<input type="number" name="role" value="<%= user.getRole() %>"><br>
  		
  		<label>Image Path</label><br>
  		<input type="text" name="imgpath" value="<%= user.getImgpath() %>"><br>
  		
  		<label>Note</label><br>
  		<input type="text" name="note" value="<%= user.getNote() %>"><br>
  		
  		<label>Enabled</label><br>
<!-- 		<select name="enabled"> -->
<%-- 			<option <% if(user.getEnabled()) out.print("selected='selected'"); %>value="true">True</option> --%>
<%-- 			<option <% if(!user.getEnabled()) out.print("selected='selected'"); %>value="false">False</option> --%>
<!-- 		</select> -->
<!--   		<br> -->
<!--   		  		<label>Enabled2</label><br> -->
  		<input type="checkbox" name="enabled" <% if(user.getEnabled()) out.print("checked"); %>><br>
  		<br>
  		
  		<input class="btn btn-primary" type="submit" id="button" value="Update">
  		
	</form> 
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>

</body>
</html>
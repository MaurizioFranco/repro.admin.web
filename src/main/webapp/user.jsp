<%@page import="repro.bo.giacomo.proxima.informatica.academy.seventh.service.UserService"%>
<%@page import="proxima.informatica.academy.dto.UserDto"%>
<%@page import="java.nio.file.attribute.UserPrincipalLookupService"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

<%-- <%@include file="authentication.jsp"%> --%>

<head>

<script type="text/javascript">

	function abilitaBottone() {
		console.log("questa è la console");
 		document.getElementById("buttonDelete").disabled = false;
 		document.getElementById("buttonUpdate").disabled = false;
	}
	
	function deleteUser() {
		console.log("Delete");
		document.getElementById("formSelectUser").action = "./DeleteUserServlet";
		document.getElementById("formSelectUser").method = "post";
		document.getElementById("formSelectUser").submit;
	}
	
	function updateUser() {
		console.log("Update");
		document.getElementById("formSelectUser").action = "./updateUser.jsp";
		document.getElementById("formSelectUser").method = "post";
		document.getElementById("formSelectUser").submit;
	}
	
</script>
<meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>List Users</title>

<link rel="stylesheet" href="list.css">

</head>
<body>
	<%@include file="header.jsp"%>
<div class="container-fluid">
<h1>User List</h1>
	<form id="formSelectUser">
		<table class="table table-striped table-hover table-bordered">
			  <thead class="thead-dark">
			<tr>
			
				<th scope="col"></th>
				<th scope="col">Id</th>
				<th scope="col">First Name</th>
				<th scope="col">Last Name</th>
				<th scope="col">Email</th>
			</tr>
			</thead>
			<%
			ArrayList<UserDto> users = new ArrayList<UserDto>();
			users = UserService.getInstance().getAllUsers();
			for (UserDto user : users) {
				request.setAttribute("id", user.getId());
				
			%>
			<tr>
				<th scope="row"><input type="radio" name="userId" onclick="javascript:abilitaBottone();" value="<%out.print(user.getId());%>" /></th>
				<td>
					<%
					out.print(user.getId().toString());
					%>
				</td>
				<td>
					<%
					out.print(user.getFirstname().toString());
					%>
				</td>
				<td>
					<%
					out.print(user.getLastname().toString());
					%>
				</td>
				<td>
					<%
					out.print(user.getEmail().toString());
					%>
				</td>
			</tr>
			<%
			}
			%>
		</table>
		<input class="btn btn-danger" type="submit" class="button" id="buttonDelete" value="Delete" disabled onclick="javascript:deleteUser();">
		<input class="btn btn-primary" type="submit" class="button"	id="buttonUpdate" value="Update" disabled onclick="javascript:updateUser();">
	</form>
	</div>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>

</body>
</html>
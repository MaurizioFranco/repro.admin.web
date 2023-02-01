<%@page import="centauri.academy.proxima.cerepro.entity.User"%>
<%@page import="centauri.academy.proxima.cerepro.entity.EntityInterface"%>
<%@page import="proxima.informatica.academy.seventh.service.UserService"%>
<%@page import="java.util.List"%>
<%@page import="java.nio.file.attribute.UserPrincipalLookupService"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<%@include file="authentication.jsp"%>

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
	
	function deleteUser(){
		console.log("delete");
		document.getElementById("formSelectUser").method = "POST";
		document.getElementById("formSelectUser").action = "./DeleteUserServlet";
		document.getElementById("formSelectUser").submit();
	}
	
</script>
<meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>List Users</title>

<link rel="icon" type="image/ico" href="./img/Logo-Centauri-Academy-2018.ico">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<link rel="stylesheet" href="style.css">

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
			List<EntityInterface> items = UserService.getInstance().getAllUsers();
			for (EntityInterface item : items) {
				User user = (User)item;
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
		<button type="button" class="btn btn-danger" id=buttonDelete disabled data-toggle="modal" data-target="#deleteModal">Cancella</button>
		<input class="btn btn-primary" type="submit" class="button"	id="buttonUpdate" value="Update" disabled onclick="javascript:updateUser();">
	<!-- Modal DELETE-->
		<div class="modal" id=deleteModal tabindex="-1" role="dialog">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title">Eliminazione User</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        <p>Sei sicuro di volre rimuovere questo user?</p>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-primary" onclick="javascript:deleteUser();">SI</button>
		        <button type="button" class="btn btn-primary" data-dismiss="modal">NO</button>
		      </div>
		    </div>
		  </div>
		</div>
	
	</form>
	</div>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>

</body>
</html>
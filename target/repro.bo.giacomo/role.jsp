<%@page import="java.util.List"%>
<%@page import="proxima.informatica.academy.seventh.surveyquestion.service.RoleService"%>
<%@page import="proxima.informatica.academy.dto.RoleDto"%>
<%@page import="java.nio.file.attribute.UserPrincipalLookupService"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<%-- <%@include file="authentication.jsp"%> --%>


<head>

<script type="text/javascript">

	function abilitaBottone() {
		console.log("questa è la console");
 		document.getElementById("buttonDelete").disabled = false;
 		document.getElementById("buttonUpdate").disabled = false;
	}
	
	function deleteRole() {
		console.log("Delete");
		document.getElementById("formSelectRole").action = "./DeleteRoleServlet";
		document.getElementById("formSelectRole").method = "post";
		document.getElementById("formSelectRole").submit;
	}
	
	function updateRole() {
		console.log("Update");
		document.getElementById("formSelectRole").action = "./updateRole.jsp";
		document.getElementById("formSelectRole").method = "post";
		document.getElementById("formSelectRole").submit;
	}
	
</script>
<meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>List Roles</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

<link rel="stylesheet" href="list.css">

</head>
<body>
	<%@include file="header.jsp"%>
<div class="container-fluid">
	<h1>Role List</h1>
	<form id="formSelectRole">
		<table class="table table-striped table-hover  table-bordered">
			<thead class="thead-dark">
				<tr>
					<th scope="col"></th>
					<th scope="col">Id</th>
					<th scope="col">Label</th>
					<th scope="col">Description</th>
					<th scope="col">Level</th>
				</tr>
			</thead>	
			<%
			List<RoleDto> roles = new ArrayList<RoleDto>();
			roles = RoleService.getInstance().getAllRoles();
			for (RoleDto role : roles) {
				request.setAttribute("id", role.getId());
				
			%>
			<tr>
				<th scope="row"><input type="radio" name="roleId" onclick="javascript:abilitaBottone();" value="<%out.print(role.getId());%>" /></th>
				<td>
					<%
					out.print(role.getId().toString());
					%>
				</td>
				<td>
					<%
					out.print(role.getLabel().toString());
					%>
				</td>
				<td>
					<%
					out.print(role.getDescription().toString());
					%>
				</td>
				<td>
					<%
					out.print(role.getLevel().toString());
					%>
				</td>
			</tr>
			<%
			}
			%>
		</table>
		<input class="btn btn-danger" type="submit" class="button" id="buttonDelete" value="Delete" disabled onclick="javascript:deleteRole();">
		<input class="btn btn-primary" type="submit" class="button"	id="buttonUpdate" value="Update" disabled onclick="javascript:updateRole();">
	</form>
</div>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>

</body>
</html>
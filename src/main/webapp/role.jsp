<%@page import="java.util.List"%>
<%@page import="proxima.informatica.academy.seventh.role.service.RoleService"%>
<%@page import="proxima.informatica.academy.dto.RoleDto"%>
<%@page import="java.nio.file.attribute.UserPrincipalLookupService"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<%@include file="authentication.jsp"%>


<head>

<style>



</style>

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
	
	function initializeUpdateForm (item) {
		console.log("initializeUpdateForm - START - " + item);
		console.log(item);
		document.getElementById("roleIdToUpdate").value = item.id;
		document.getElementById("roleLabelToUpdate").value = item.label;
		document.getElementById("roleDescriptionToUpdate").value = item.description;
		document.getElementById("roleLevelToUpdate").value = item.level;
		
		
	}
	
	function showUpdateRoleModal () {
		console.log("showUpdateRoleModal!!!");
		const xhttp = new XMLHttpRequest();
		  xhttp.onload = function() {
			  console.log(this.responseText);
			  var role = JSON.parse(this.responseText) ;
			  console.log(role);
			  initializeUpdateForm (role);
		    }
		  xhttp.open("GET", "http://localhost:8080/repro.admin.web/GetRoleServlet?id=14", true);
		  xhttp.send();
	}
	
	function update () {
		console.log("update - START");
		var idToUpdate = document.getElementById("roleIdToUpdate").value ; 
		var roleLabelToUpdate = document.getElementById("roleLabelToUpdate").value ; 
		var roleDescriptionToUpdate = document.getElementById("roleDescriptionToUpdate").value ; 
		var roleLevelToUpdate = document.getElementById("roleLevelToUpdate").value ; 
		console.log("idToUpdate: " + idToUpdate + " - roleLabelToUpdate: " + roleLabelToUpdate + " - roleDescriptionToUpdate: " + roleDescriptionToUpdate + " - roleLevelToUpdate: " + roleLevelToUpdate);
		
		var formData = new FormData(); 
		formData.append("id", idToUpdate);
		formData.append("label", roleLabelToUpdate);
		formData.append("description", roleDescriptionToUpdate);
		if (roleLevelToUpdate!=null) {		
			formData.append("level", roleLevelToUpdate);
		}
		
	    
		
		const xhttp = new XMLHttpRequest();
		  xhttp.onload = function() {
			  console.log(this.responseText);
// 			  var role = JSON.parse(this.responseText) ;
// 			  console.log(role);
// 			  initializeUpdateForm (role);
		    }
		  xhttp.open("POST", "http://localhost:8080/repro.admin.web/UpdateRoleServlet", true);
		  xhttp.send(formData);
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
		<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#updateRoleModal" onclick="showUpdateRoleModal(); return false;">
  MODIFICA
</button>

	</form>
</div>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>

<!-- Modal -->
<div class="modal fade" id="updateRoleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form id="updateRoleForm">
	      <div class="modal-body">
			
			  	<label>ID</label><br>
		  		<input type="number" name="roleIdToUpdate" id="roleIdToUpdate" value=""><br>
		  		
		  		<label>First Name</label><br>
		  		<input type="text" name="roleLabelToUpdate" id="roleLabelToUpdate" value=""><br>
		  		
		  		<label>Last Name</label><br>
		  		<input type="text" name="roleDescriptionToUpdate" id="roleDescriptionToUpdate" value=""><br>
			
		  		<label>Email</label><br>
		  		<input type="number" name="roleLevelToUpdate" id="roleLevelToUpdate" value=""><br>		  		
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary" onClick="update();">Save changes</button>
	      </div>
      </form> 
    </div>
  </div>
</div>

</body>
</html>
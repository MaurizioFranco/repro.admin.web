<%@page import="centauri.academy.proxima.cerepro.entity.CandidateStates"%>
<%@page import="proxima.informatica.academy.seventh.service.CandidateStatesService"%>
<%@page import="centauri.academy.proxima.cerepro.entity.EntityInterface"%>
<%@page import="java.util.List"%>
<%@page import="java.nio.file.attribute.UserPrincipalLookupService"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<%@include file="authentication.jsp"%>


<head>

<link rel="icon" href="./img/Logo-Centauri-Academy-2018.ico">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>



</style>

<script type="text/javascript">

	function abilitaBottone() {
		console.log("questa è la console");
 		document.getElementById("buttonDelete").disabled = false;
 		document.getElementById("buttonUpdate").disabled = false;
	}
	
	function initializeUpdateForm (item) {
		console.log("initializeUpdateForm - START - " + item);
		console.log(item);
		document.getElementById("idToUpdate").value = item.id;
		document.getElementById("roleIdToUpdate").value = item.role_id;
		document.getElementById("statusCodeToUpdate").value = item.status_code;
		document.getElementById("statusLabelToUpdate").value = item.status_label;
		document.getElementById("statusDescriptionToUpdate").value = item.status_description;
		document.getElementById("statusColorToUpdate").value = item.status_color;
		
	}
	
	function showUpdateCandidateStatesModal() {
		console.log("showUpdateCandidateStatesModal!!!");
		const xhttp = new XMLHttpRequest();
		  xhttp.onload = function() {
			  console.log(this.responseText);
			  var role = JSON.parse(this.responseText) ;
			  console.log(candidateState);
			  initializeUpdateForm (CandidateState);
		    }
		  var id= document.querySelector('input[name="roleRadioId"]:checked').value;
		  xhttp.open("GET", "http://localhost:8080/repro.admin.web/GetRoleServlet?id="+id, true);
		  xhttp.send();
	}
	
	function update () {
		console.log("update - START");
		console.log(" prova id " + document.getElementById("idToUpdate").value);
		var idToUpdate = document.getElementById("idToUpdate").value ; 
		var statusRoleIdToUpdate = document.getElementById("roleIdToUpdate").value ; 
		var statusCodeToUpdate = document.getElementById("statusCodeToUpdate").value ; 
		var statusLabelToUpdate = document.getElementById("statusLabelToUpdate").value ; 
		var statusDescriptionToUpdate = document.getElementById("statusDescriptionToUpdate").value ; 
		var statusColorToUpdate = document.getElementById("statusColorToUpdate").value ; 
		
		console.log("idToUpdate: " + idToUpdate + " - roleIdToUpdate: " + roleIdToUpdate + " - statusCodeToUpdate: " + statusCodeToUpdate + " - statusLabelToUpdate: " + statusLabelToUpdate + "statusDescriptionToUpdate" + statusDescriptionToUpdate + "statusColorToUpdate" + statusColorToUpdate);
		
// 		var formData = new FormData(); 
// 		formData.append("id", idToUpdate);
// 		formData.append("label", roleLabelToUpdate);
// 		formData.append("description", roleDescriptionToUpdate);
// 		if (roleLevelToUpdate!=null) {		
// 			formData.append("level", roleLevelToUpdate);
// 		}
		
	    
		
// 		const xhttp = new XMLHttpRequest();
// 		  xhttp.onload = function() {
// 			  console.log(this.responseText);
// // 			  var role = JSON.parse(this.responseText) ;
// // 			  console.log(role);
// // 			  initializeUpdateForm (role);
// 		    }
// 		  xhttp.open("POST", "http://localhost:8080/repro.admin.web/UpdateRoleServlet", true);
// 		  xhttp.send(formData);

        var itemToUpdate = {
        		"id":idToUpdate,
        		"role_id":roleIdToUpdate,
        		"status_code":statusCodeToUpdate,
        		"status_label":statusLabelToUpdate,
        		"status_desciption":statusDescriptionToUpdate,
        		"status_color":statusColorToUpdate
        }
        
        $.ajax({
			  type: "POST",
			  url: "http://localhost:8080/repro.admin.web/UpdateCandidateStatesServlet",
			  data: itemToUpdate,
			  success: function (responseText) {
				  console.log(responseText);
				  if (responseText==='OK') {					 
					  $('#updateRoleModal').modal('hide');		
					  location.reload();
// 					  $('#errorUpdateMessage').show();
// 					  $('#errorUpdateMessage').html(responseText);
// 				  } else {
					  
				  }
			  },
			  dataType: "text"
			});

	}
	
	
	
	
	
</script>
<meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>List Candidate Staes</title>

<link rel="icon" type="image/ico" href="./img/Logo-Centauri-Academy-2018.ico">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

<link rel="stylesheet" href=css/style.css>

</head>
<body>
	<%@include file="header.jsp"%>
<div class="container-fluid">
	<h1>CandidateStates List</h1>
	<form id="formSelectCandidateStates">
		<table class="table table-striped table-hover  table-bordered">
			<thead class="thead-dark">
				<tr>
					<th scope="col"></th>
					<th scope="col">Id</th>
					<th scope="col">Role Id</th>
					<th scope="col">Status Code</th>
					<th scope="col">Status Label</th>
					<th scope="col">Status Color</th>
					<th scope="col">Status Description</th>	
				</tr>
			</thead>	
			<%
			List<EntityInterface> candidateStates = CandidateStatesService.getInstance().selectAll();
			for (EntityInterface item : candidateStates) {
				CandidateStates candidateState = (CandidateStates)item ;
				request.setAttribute("id", candidateState.getId());
				
			%>
			<tr>
				<th scope="row"><input type="radio" name="candidateStatesId" onclick="javascript:abilitaBottone();" value="<%out.print(candidateState.getId());%>" /></th>
				<td>
					<%
					out.print(candidateState.getId());
					%>
				</td>
				<td>
					<%
					out.print(candidateState.getRole_id());
					%>
				</td>
				<td>
					<%
					out.print(candidateState.getStatus_code());
					%>
				</td>
				<td>
					<%
					out.print(candidateState.getStatus_label());
					%>
				</td>
				<td>
					<%
					out.print(candidateState.getStatus_description());
					%>
				</td>
				<td>
					<%
					out.print(candidateState.getStatus_color());
					%>
				</td>
			</tr>
			<%
			}
			%>
		</table>
		<input class="btn btn-danger" type="submit" class="button" id="deleteButton" value="Delete" disabled onclick="javascript:deleteRole();">
		<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-toggle="modal" id="updateButton" data-target="#updateCandidateStatesModal" onclick="showUpdateCandidateStatesModal(); return false;">
  MODIFICA
</button>

	</form>
</div>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>

<!-- Modal -->
<div class="modal fade" id="updateCandidateStatesModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
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
		  		<input type="number" name="idToUpdate" id="idToUpdate" value=""><br>
		  		
		  		<label>Role Id</label><br>
		  		<input type="number" name="roleIdToUpdate" id="roleIdToUpdate" value=""><br>
		  		
		  		<label>Status code</label><br>
		  		<input type="number" name="statusCodeToUpdate" id="statusCodeToUpdate" value=""><br>
				
				<label>Status Label</label><br>
		  		<input type="text" name="statusLabelToUpdate" id="statusLabelToUpdate" value=""><br>
		
				<label>Status Description</label><br>
		  		<input type="text" name="statusDescriptionToUpdate" id="statusDescriptionToUpdate" value=""><br>
		
				
		  		<label>Status Color</label><br>
		  		<input type="text" name="statusColorToUpdate" id="statusColorToUpdate" value=""><br>		  		
	     
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
<%@page import="centauri.academy.proxima.cerepro.entity.Candidates"%>
<%@page import="proxima.informatica.academy.seventh.service.CandidatesService"%>
<%@page import="centauri.academy.proxima.cerepro.repository.CandidatesRepository"%>
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

<style>

</style>

<script type="text/javascript">

	function abilitaBottone() {
		console.log("questa è la console");
 		document.getElementById("buttonDelete").disabled = false;
 		document.getElementById("buttonUpdate").disabled = false;
	}
	
	function deleteCandidates() {
		console.log("Delete");
		document.getElementById("formSelectCandidates").action = "./DeleteCandidatesServlet";
		document.getElementById("formSelectCandidates").method = "post";
		document.getElementById("formSelectCandidates").submit;
	}
	
	function updateCandidates() {
		console.log("Update");
		document.getElementById("formSelectCandidates").action = "./updateCandidates.jsp";
		document.getElementById("formSelectCandidates").method = "post";
		document.getElementById("formSelectCandidates").submit;
	}
	
	function insertCandidates() {
		console.log("Insert");
		document.getElementById("formSelectCandidates").action = "./insertCandidates.jsp";
		document.getElementById("formSelectCandidates").method = "post";
		document.getElementById("formSelectCandidates").submit;
	}
	
	//INITIALIZE UPDATE FORM
	function initializeUpdateForm (item) {
		console.log("initializeUpdateForm - START - " + item);
		console.log(item);
		document.getElementById("candidateIdToUpdate").value = item.id;
		document.getElementById("candidateUser_idToUpdate").value = item.user_id;
		document.getElementById("candidateCourse_codeToUpdate").value = item.course_code;
		document.getElementById("candidateCandidacy_date_timeToUpdate").value = item.candacy_state_time;
	}
	
	//INITIALIZE INSERT FORM
	function initializeInsertForm (item) {
		console.log("initializeInsertForm - START - " + item);
		console.log(item);
		document.getElementById("candidateIdToInsert").value = item.id;
		document.getElementById("candidateUser_idToInsert").value = item.user_id;
		document.getElementById("candidateCourse_codeToInsert").value = item.course_code;
		document.getElementById("candidateCandidacy_date_timeToInsert").value = item.candacy_state_time;
	}
	
	//SHOW UPDATE MODAL
	function showUpdateCandidatesModal () {
		console.log("showUpdateCandidatesModal!!!");
		const xhttp = new XMLHttpRequest();
		  xhttp.onload = function() {
			  console.log(this.responseText);
			  var candidate = JSON.parse(this.responseText) ;
			  console.log(candidate);
			  initializeUpdateForm (candidate);
		    }
		  xhttp.open("GET", "http://localhost:8080/repro.admin.web/GetCandidatesServlet?id=14", true);
		  xhttp.send();
	}
	
	//SHOW INSERT MODAL
	function showInsertCandidatesModal () {
		console.log("showInsertCandidatesModal!!!");
		const xhttp = new XMLHttpRequest();
		  xhttp.onload = function() {
			  console.log(this.responseText);
			  var candidate = JSON.parse(this.responseText) ;
			  console.log(candidate);
			  initializeUpdateForm (candidate);
		    }
		  xhttp.open("GET", "http://localhost:8080/repro.admin.web/GetCandidatesServlet?id=14", true);
		  xhttp.send();
	}
	
	//UPDATE
	function update () {
		console.log("update - START");
		var idToUpdate = document.getElementById("candidateIdToUpdate").value ; 
		var candidateUser_idToUpdate = document.getElementById("candidateUser_idToUpdate").value ; 
		var candidateCourse_codeToUpdate = document.getElementById("candidateCourse_codeToUpdate").value ; 
		var candidateCandidacy_date_timeToUpdate = document.getElementById("candidateCandidacy_date_timeToUpdate").value ; 
		console.log("idToUpdate: " + idToUpdate + 
					" - candidateUser_idToUpdate: " + candidateUser_idToUpdate + 
					" - candidateCourse_codeToUpdate: " + candidateCourse_codeToUpdate + 
					" - candidateCandidacy_date_timeToUpdate: " + candidateCandidacy_date_timeToUpdate);
		
		
		var formData = new FormData(); 
		formData.append("id", idToUpdate);
		formData.append("user_id", candidateUser_idToUpdate);
		formData.append("course_code", candidateCourse_codeToUpdate);
		formData.append("candidacy_date_time", candidateCandidacy_date_timeToUpdate);
	    
		const xhttp = new XMLHttpRequest();
		  xhttp.onload = function() {
			  console.log(this.responseText);
/*			  var candidate = JSON.parse(this.responseText) ;
			  console.log(candidate);
			  initializeUpdateForm (candidate);*/
		    }
		  xhttp.open("POST", "http://localhost:8080/repro.admin.web/UpdateCandidatesServlet", true);
		  xhttp.send(formData);
	}
	
	//INSERT
	function insert () {
		console.log("update - START");
		var candidateCourse_codeToInsert = $("#candidateCourse_codeToInsert").val();
		var candidateCandidacy_state_timeToInsert = $("#candidateCandidacy_date_timeToInsert").val();
		console.log("candidateCourse_codeToInsert: " + candidateCourse_codeToInsert + 
					" - candidateCandidacy_date_timeToInsert: " + candidateCandidacy_date_timeToInsert);
		
		var itemToInsert = {
        		"candidateCourse_codeToInsert":candidateCourse_codeToInsert,
        		"candidateCandidacy_date_timeToInsert":roleDescriptionToInsert
        }
		
		const xhttp = new XMLHttpRequest();
		  xhttp.onload = function() {
			  console.log(this.responseText);
/*			  var candidate = JSON.parse(this.responseText) ;
			  console.log(candidate);
			  initializeUpdateForm (candidate);*/
		    }
		  xhttp.open("POST", "http://localhost:8080/repro.admin.web/InsertCandidatesServlet", true);
		  xhttp.send(formData);
	}
	
	
</script>
<meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>List Candidates</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

<link rel="stylesheet" href="list.css">

</head>
<body>
	<%@include file="header.jsp"%>
<div class="container-fluid">
	<h1 style="text-align: left;">Candidates List</h1>
	<!-- Button trigger Insert Modal -->
	<div style="text-align: right;"><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#insertCandidatesModal"
	onclick="showInsertCandidatesModal(); return false;">+</button></div>
	<br>
	<form id="formSelectCandidates">
		<table class="table table-striped table-hover  table-bordered">
			<thead class="thead-dark">
				<tr>
					<th scope="col"></th>
					<th scope="col">Id</th>
					<th scope="col">User_id</th>
					<th scope="col">Course_code</th>
					<th scope="col">Candidacy_date_time</th>
				</tr>
			</thead>	
			<%
			List<EntityInterface> candidates = CandidatesService.getInstance().getAllCandidates();
			for (EntityInterface item : candidates) {
				Candidates candidate = (Candidates)item ;
				request.setAttribute("id", candidate.getId());
				
			%>
			<tr>
				<th scope="row"><input type="radio" name="candidateId" onclick="javascript:abilitaBottone();" value="<%out.print(candidate.getId());%>" /></th>
				<td>
					<%
					out.print(candidate.getId().toString());
					%>
				</td>
				<td>
					<%
					out.print(candidate.getUser_id().toString());
					%>
				</td>
				<td>
					<%
					out.print(candidate.getCourse_code().toString());
					%>
				</td>
				<td>
					<%
					out.print(candidate.getCandidacy_date_time().toString());
					%>
				</td>
			</tr>
			<%
			}
			%>
		</table>
<input class="btn btn-danger" type="submit" class="button" id="buttonDelete" value="Delete" disabled onclick="javascript:deleteCandidates();">
<!-- Button trigger Update Modal -->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#updateCandidatesModal" onclick="showUpdateCandidatesModal(); return false;">
  MODIFICA
</button>

	</form>
</div>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>

<!-- Update Modal -->
<div class="modal fade" id="updateCandidatesModal" tabindex="-1" candidate="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" candidate="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Update Modal</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form id="updateCandidatesForm">
	      <div class="modal-body">
			
			  	<label>ID</label><br>
		  		<input type="number" name="candidateIdToUpdate" id="candidateIdToUpdate" value=""><br>
		  		
		  		<label>User ID</label><br>
		  		<input type="number" name="candidateUser_idToUpdate" id="candidateUser_idToUpdate" value=""><br>
		  		
		  		<label>Course Code</label><br>
		  		<input type="text" name="candidateCourse_codeToUpdate" id="candidateCourse_codeToUpdate" value=""><br>
		  		
		  		<label>Candidacy Date Time</label><br>
		  		<input type="date" name="candidateCandidacy_date_timeToUpdate" id="candidateCandidacy_date_timeToUpdate" value=""><br>  		
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary" onClick="update();">Save changes</button>
	      </div>
      </form> 
    </div>
  </div>
</div>

<!-- Insert Modal -->
<div class="modal fade" id="insertCandidatesModal" tabindex="-1" candidate="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" candidate="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Insert Modal</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form id="insertCandidatesForm">
	      <div class="modal-body">
		  		
		  		<label>Course Code</label><br>
		  		<input type="text" name="candidateCourse_codeToInsert" id="candidateCourse_codeToInsert" value=""><br>
		  		
		  		<label>Candidacy Date Time</label><br>
		  		<input type="date" name="candidateCandidacy_date_timeToInsert" id="candidateCandidacy_date_timeToInsert" value=""><br>  		
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary" onClick="insert(); return false;">Save</button>
	      </div>
      </form> 
    </div>
  </div>
</div>

</body>
</html>
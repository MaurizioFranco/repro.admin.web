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
	
	function initializeUpdateForm (item) {
		console.log("initializeUpdateForm - START - " + item);
		console.log(item);
		document.getElementById("candidateIdToUpdate").value = item.id;
		document.getElementById("candidateUser_idToUpdate").value = item.user_id;
		document.getElementById("candidateCourse_codeToUpdate").value = item.course_code;
		document.getElementById("candidateCandidacy_state_timeToUpdate").value = item.candacy_state_time;
		document.getElementById("candidateFirstnameToUpdate").value = item.firstname;
		document.getElementById("candidateLastnameToUpdate").value = item.lastname;
		document.getElementById("candidateEmailToUpdate").value = item.email;
		document.getElementById("candidateRegdateToUpdate").value = item.regdate;
		document.getElementById("candidateInserted_byToUpdate").value = item.inserted_by;
		document.getElementById("candidateCandidate_state_codeToUpdate").value = item.candidate_state_code;
		
	}
	
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
	
	function update () {
		console.log("update - START");
		var idToUpdate = document.getElementById("candidateIdToUpdate").value ; 
		var candidateUser_idToUpdate = document.getElementById("candidateUser_idToUpdate").value ; 
		var candidateCourse_codeToUpdate = document.getElementById("candidateCourse_codeToUpdate").value ; 
		var candidateCandidacy_state_timeToUpdate = document.getElementById("candidateCandidacy_state_timeToUpdate").value ; 
		var candidateFirstnameToUpdate = document.getElementById("candidateFirstnameToUpdate").value ; 
		var candidateLastnameToUpdate = document.getElementById("candidateLastnameToUpdate").value ; 
		var candidateEmailToUpdate = document.getElementById("candidateEmailToUpdate").value ; 
		var candidateRegdateToUpdate = document.getElementById("candidateRegdateToUpdate").value ; 
		var candidateInserted_byToUpdate = document.getElementById("candidateInserted_byToUpdate").value ; 
		var candidateCandidate_state_codeToUpdate = document.getElementById("candidateCandidate_state_codeToUpdate").value ; 
		console.log("idToUpdate: " + idToUpdate + 
					" - candidateUser_idToUpdate: " + candidateUser_idToUpdate + 
					" - candidateCourse_codeToUpdate: " + candidateCourse_codeToUpdate + 
					" - candidateCandidacy_state_timeToUpdate: " + candidateCandidacy_state_timeToUpdate + 
					" - candidateFirstnameToUpdate: " + candidateFirstnameToUpdate + 
					" - candidateLastnameToUpdate: " + candidateLastnameToUpdate + 
					" - candidateEmailToUpdate: " + candidateEmailToUpdate + 
					" - candidateRegdateToUpdate: " + candidateRegdateToUpdate + 
					" - candidateInserted_byToUpdate: " + candidateInserted_byToUpdate + 
					" - candidateCandidate_state_codeToUpdate: " + candidateCandidate_state_codeToUpdate);
		
		
		var formData = new FormData(); 
		formData.append("id", idToUpdate);
		formData.append("user_id", candidateUser_idToUpdate);
		formData.append("course_code", candidateCourse_codeToUpdate);
		formData.append("candidacy_state_time", candidateCandidacy_state_timeToUpdate);
		formData.append("firstname", candidateFirstnameToUpdate);
		formData.append("lastname", candidateLastnameToUpdate);
		formData.append("email", candidateEmailToUpdate);
		formData.append("regdate", candidateRegdateToUpdate);
		formData.append("inserted_by", candidateInserted_byToUpdate);
		formData.append("candidate_state_code", candidateCandidate_state_codeToUpdate);
		if (candidateLevelToUpdate!=null) {		
			formData.append("level", candidateLevelToUpdate);
		}
		
	    
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
	
	function deleteCandidate(){
		console.log("delete");
		document.getElementById("selectionForm").method = "POST";
		document.getElementById("selectionForm").action = "./DeleteCandidates";
		document.getElementById("selectionForm").submit();
		location.reload()
	}
	
	
</script>
<meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>List Candidates</title>

<link rel="icon" type="image/ico" href="./img/Logo-Centauri-Academy-2018.ico">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

<link rel="stylesheet" href="css/style.css">

</head>
<body>
	<%@include file="header.jsp"%>
<div class="container-fluid">
	<h1>Candidates List</h1>
	<form id="formSelectCandidates">
		<table class="table table-striped table-hover  table-bordered">
			<thead class="thead-dark">
				<tr>
					<th scope="col"></th>
					<th scope="col">Id</th>
					<th scope="col">User_id</th>
					<th scope="col">Course_code</th>
					<th scope="col">Candidacy_date_time</th>
					<th scope="col">Firstname</th>
					<th scope="col">Lastname</th>
					<th scope="col">Email</th>
					<th scope="col">Regdate</th>
					<th scope="col">Inserted_by</th>
					<th scope="col">Candidate_state_code</th>
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
				<td>
					<%
					out.print(candidate.getFirstname().toString());
					%>
				</td>
				<td>
					<%
					out.print(candidate.getLastname().toString());
					%>
				</td>
				<td>
					<%
					out.print(candidate.getEmail().toString());
					%>
				</td>
				<td>
					<%
					out.print(candidate.getRegdate().toString());
					%>
				</td>
				<td>
					<%
					out.print(candidate.getInserted_by().toString());
					%>
				</td>
				<td>
					<%
					out.print(candidate.getCandidate_state_code().toString());
					%>
				</td>
			</tr>
			<%
			}
			%>
		</table>
		<input class="btn btn-danger" type="submit" class="button" id="buttonDelete" value="Delete" disabled data-toggle="modal" data-target="#deleteModal" onclick="javascript:deleteCandidates();">
		<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#updateCandidatesModal" onclick="showUpdateCandidatesModal(); return false;">
  MODIFICA
</button>
	<!-- Modal DELETE-->
		<div class="modal" id=deleteModal tabindex="-1" role="dialog">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title">Eliminazione candidate</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        <p>Sei sicuro di volre rimuovere questo candidato?</p>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-primary" onclick="javascript:deleteCandidate();">SI</button>
		        <button type="button" class="btn btn-primary" data-dismiss="modal">NO</button>
		      </div>
		    </div>
		  </div>
		</div>
	</form>
</div>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>

<!-- Modal -->
<div class="modal fade" id="updateCandidatesModal" tabindex="-1" candidate="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" candidate="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form id="updateCandidatesForm">
	      <div class="modal-body">
			
			  	<label>ID</label><br>
		  		<input type="number" name="candidateIdToUpdate" id="candidateIdToUpdate" value=""><br>
		  		
		  		<label>User ID</label><br>
		  		<input type="text" name="candidateUser_idToUpdate" id="candidateUser_idToUpdate" value=""><br>
		  		
		  		<label>Course Code</label><br>
		  		<input type="text" name="candidateCourse_codeToUpdate" id="candidateCourse_codeToUpdate" value=""><br>
		  		
		  		<label>Candidacy State Time</label><br>
		  		<input type="text" name="candidateCandidacy_state_timeToUpdate" id="candidateCandidacy_state_timeToUpdate" value=""><br>
		  		
		  		<label>First Name</label><br>
		  		<input type="text" name="candidateFirstnameToUpdate" id="candidateFirstnameToUpdate" value=""><br>
		  		
		  		<label>Last Name</label><br>
		  		<input type="text" name="candidateLastnameToUpdate" id="candidateLastnameToUpdate" value=""><br>
			
		  		<label>Email</label><br>
		  		<input type="number" name="candidateEmailToUpdate" id="candidateEmailToUpdate" value=""><br>	
		  		
		  		<label>Regdate</label><br>
		  		<input type="number" name="candidateRegdateToUpdate" id="candidateRegdateToUpdate" value=""><br>
		  		
		  		<label>Inserted By</label><br>
		  		<input type="number" name="candidateInserted_byToUpdate" id="candidateInserted_byToUpdate" value=""><br>
		  		
		  		<label>Candidate State Code</label><br>
		  		<input type="number" name="candidateCandidate_state_codeToUpdate" id="candidateCandidate_state_codeToUpdate" value=""><br>	  		
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
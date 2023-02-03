<%@page import="proxima.informatica.academy.seventh.service.CandidatesService"%>
<%@page import="centauri.academy.proxima.cerepro.entity.Candidates"%>
<%@page import="centauri.academy.proxima.cerepro.entity.EntityInterface"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>



<%
String candidatesEliminato="";
if(request.getAttribute("deleteCandidates") == "OK"){
	candidatesEliminato = "Sei riuscito ad eliminare il surveyreplies selezionato";
}if(request.getAttribute("deleteCandidates") == "KO"){
	candidatesEliminato = "Non sei riuscito ad eliminare il surveyreplies selezionato";
}
%>

<%
String candidatesModificato="";
if(request.getAttribute("updateCandidates") == "OK"){
	candidatesModificato = "Modifica andata a buon fine";
}if(request.getAttribute("updateCandidates") == "KO"){
	candidatesModificato = "Modificata non riuscita";
}
%>


<%
String loginMessage = "";
if(request.getAttribute("loginMessage") != null){
	loginMessage = "" + request.getAttribute("loginMessage");
}else{
	loginMessage = "";
}
%>

<html>

<%-- <%@include file="authentication.jsp"%> --%>

<head>
<meta charset="ISO-8859-1">
<title>Candidates</title>
<link rel="icon" type="image/ico" href="./img/Logo-Centauri-Academy-2018.ico">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

<script
      src="https://code.jquery.com/jquery-3.6.0.min.js"

    ></script>

<script type="text/javascript">

	function abilitaBottone() {
		console.log("questa � una stampa di console");
		document.getElementById("deleteButton").disabled=false;
		document.getElementById("modificaButton").disabled=false;
	}
	function updateCandidates(){
		console.log("modifica");
		document.getElementById("formSelezioneCandidates").action = "./updateCandidates.jsp";
		document.getElementById("formSelezioneCandidates").submit();
	}
	function deleteCandidates(){
		console.log("delete");
		document.getElementById("formSelezioneCandidates").method="POST";
		document.getElementById("formSelezioneCandidates").action = "./DeleteCandidatesServlet";
		document.getElementById("formSelezioneCandidates").submit();
	}
	
	//INITIALIZE UPDATE FORM
	function initializeUpdateForm (item) {
		console.log("initializeUpdateForm - START - " + item);
		console.log(item);
		document.getElementById("candidatesIdToUpdate").value = item.id;
		document.getElementById("idToUpdate").value = item.surveyId;
		document.getElementById("user_IdToUpdate").value = item.userId;
		document.getElementById("course_codeToUpdate").value = item.answer;
		document.getElementById("candidacy_date_timeToUpdate").value = item.candidacy_date_time;
	}
	
	//INITIALIZE INSERT FORM
	function initializeInsertForm (item) {
		console.log("initializeInsertForm - START - " + item);
		console.log(item);
		document.getElementById("idToInsert").value = item.surveyId;
		document.getElementById("user_IdToInsert").value = item.userId;
		document.getElementById("course_codeToInsert").value = item.answer;
		document.getElementById("candidacy_date_timeToInsert").value = item.candidacy_date_time;
	}
	
	//SHOW UPDATE MODAL
	function showUpdateCandidatesModal(){
		console.log("showUpdateCandidatesModal!!!");
		const xhttp = new XMLHttpRequest();
		  xhttp.onload = function() {
			  console.log(this.responseText);
			  var candidates = JSON.parse(this.responseText) ;
			  console.log(candidates);
			  initializeUpdateForm (candidates);
		    }
		  var id = document.querySelector('input[name="selectedCandidatesId"]:checked').value;
		  xhttp.open("GET", "http://localhost:8080/repro.admin.web/GetCandidatesServlet?id=" + id +"", true);
		  xhttp.send();
	}
	
	//SHOW INSERT MODAL
	function showInsertCandidatesModal () {
		console.log("showInsertCandidatesModal!!!");
		const xhttp = new XMLHttpRequest();
		  xhttp.onload = function() {
			  console.log(this.responseText);
			  var candidates = JSON.parse(this.responseText) ;
			  console.log(candidates);
			  initializeInsertForm (candidates);
		    }
	}
	
	//UPDATE FUNCTION
	function update(){
		console.log("update - START");
		var idToUpdate = $("#idToUpdate").val();
		var user_IdToUpdate = $("#user_IdToUpdate").val();
		var course_codeToUpdate = $("#course_codeToUpdate").val();
		var candidacy_date_timeToUpdate = $("#candidacy_date_timeToUpdate").val();
		
		var itemToUpdate = {
		"id":idToUpdate,
		"user_id":user_IdToUpdate,
		"course_code":course_codeToUpdate,
		"candidacy_date_time":candidacy_date_timeToUpdate,
		}
		
		$.ajax({
			type:"POST",
			url: "http://localhost:8080/repro.admin.web/UpdateCandidatesServlet",
			data:itemToUpdate,
			success:function(result){
				console.log(result);
				if(result == 'OK'){
		        	$('#updateCandidatesModal').modal('hide');
				}else{
					result = 'KO';
					$('#errorUpdateMessage').show();
					$('#errorUpdateMessage').html(result);
				}
			},
			dataType:"text"
		});

	}
	
	//INSERT FUNCTION
	function insert () {
		console.log("insert - START");
		
		var idToUpdate = $("#idToInsert").val();
		var user_IdToUpdate = $("#user_IdToInsert").val();
		var course_codeToUpdate = $("#course_codeToInsert").val();
		var candidacy_date_timeToUpdate = $("#candidacy_date_timeToInsert").val();
		
		console.log("idToInsert: " + idToInsert + " - user_IdToInsert: " + user_IdToInsert + " - course_codeToInsert: " + course_codeToInsert + " - candidacy_date_timeToInsert: " + candidacy_date_timeToInsert);
		
		var itemToInsert = {
				"survey_id":idToInsert,
				"user_id":user_IdToInsert,
				"course_code":course_codeToInsert,
				"candidacy_date_time":candidacy_date_timeToInsert,
        }
        
        $.ajax({
			  type: "POST",
			  url: "http://localhost:8080/repro.admin.web/InsertCandidatesServlet",
			  data: itemToInsert,
			  success: function (responseText) {
				  console.log(responseText);
				  if (responseText==='OK') {					 
					  $('#insertCandidatesModal').modal('hide');		
					  location.reload();
				  }
			  },
			  dataType: "text"
			});
	}
</script>

</head>
	<%@include file="./header.jsp"%>
<body>
<div class="container-fluid">
	<h1 style="text-align: left;">Candidate List</h1>
	<!-- Button trigger Insert Modal -->
	<div style="text-align: right;"><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#insertCandidatesModal" onclick="showInsertCandidatesModal(); return false;">+</button></div>
	<br>
	<h3 style="text-align:center;"><%= candidatesEliminato%></h3>
	<h3 style="text-align:center;"><%= candidatesModificato%></h3>
	<h3 style="text-align:center;"><%= loginMessage%></h3>

	<form id="formSelezioneCandidates">
		<table class="table table-striped table-hover table-bordered">
		<thead class="thead-dark">
			<tr>
				<th scope="col"></th>
				<th scope="col">ID</th>
				<th scope="col">USER_ID</th>
				<th scope="col">COURSE_CODE</th>
				<th scope="col">CANDIDACY_DATE_TIME</th>
			</tr>
			<%
			List<EntityInterface> items = CandidatesService.getInstance().getAllCandidates();
			for (EntityInterface item : items) {
				Candidates candidates = (Candidates)item;
				request.setAttribute("id", candidates.getId());
			%>
			<tr>
				<td><input type="radio" name="selectedCandidatesId"
					value="<%out.print(candidates.getId());%>"onclick="javascript:abilitaBottone();"></td>
				<td>
					<%
					out.print(candidates.getId());
					%>
				</td>
				<td>
					<%
					out.print(candidates.getUser_id());
					%>
				</td>
				<td>
					<%
					out.print(candidates.getCourse_code());
					%>
				</td>
				<td>
					<%
					out.print(candidates.getCandidacy_date_time());
					%>
				</td>
			</tr>
			<%
			}
			%>
		</table>
		<br />
		
		<button type="button" id="deleteButton"  class="btn btn-danger"  data-toggle="modal" data-target="#deleteCandidatesModal" disabled>ELIMINA</button>
		<button type="button" id="modificaButton" class="btn btn-primary" data-toggle="modal" data-target="#updateCandidatesModal" disabled onclick="showUpdateCandidatesModal(); return false;">MODIFICA</button>

<div class="modal" id=deleteCandidatesModal tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Eliminazione Candidates</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>Sei sicuro di voler rimuovere questo Candidate?</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" onclick="javascript:deleteCandidates();">SI</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal">NO</button>
      </div>
    </div>
  </div>
</div>

	</form>
</div>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>

<!-- Update Modal -->
<div class="modal fade" id="updateCandidatesModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
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
		  		<input type="number" name="candidatesIdToUpdate" id="candidatesIdToUpdate" value=""><br>
		  		
		  		<label>User ID</label><br>
		  		<input type="number" name="user_IdToUpdate" id="user_IdToUpdate" value=""><br>
			
		  		<label>Course Code</label><br>
		  		<input type="text" name="course_codeToUpdate" id="course_codeToUpdate" value=""><br>
		  		
		  		<label>Candidacy Date Time</label><br>
		  		<input type="datetime-local" name="candidacy_date_timeToUpdate" id="candidacy_date_timeToUpdate" value=""><br>
		  		
	      </div>
	      <div class="modal-footer">
	      	<label id="errorUpdateMessage" style="display:none;">ERRORE LA MODIFICA NON E' ANDATA A BUON FINE</label>
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary" onClick="update();">Save changes</button>
	      </div>
      </form> 
    </div>
  </div>
</div>

<!-- Insert Modal -->
<div class="modal fade" id="insertCandidatesModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Insert Modal</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form id="insertCandidatesForm">
	      <div class="modal-body">
			
		  		<label>ID</label><br>
		  		<input type="number" name="idToInsert" id="idToInsert" value=""><br>
		  		
		  		<label>User ID</label><br>
		  		<input type="number" name="user_IdToInsert" id="user_IdToInsert" value=""><br>
			
		  		<label>Course Code</label><br>
		  		<input type="text" name="course_codeToInsert" id="course_codeToInsert" value=""><br>
		  		
		  		<label>Candidacy Date Time</label><br>
		  		<input type="datetime-local" name="candidacy_date_timeToInsert" id="candidacy_date_timeToInsert" value=""><br>
		  	
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary" onClick="insert(); return false;">Save</button>
	      </div>
      </form> 
    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
</body>
</html>
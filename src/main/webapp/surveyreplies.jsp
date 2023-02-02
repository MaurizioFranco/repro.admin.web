<%@page import="proxima.informatica.academy.seventh.service.SurveyRepliesService"%>
<%@page import="centauri.academy.proxima.cerepro.entity.SurveysReplies"%>
<%@page import="centauri.academy.proxima.cerepro.entity.EntityInterface"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>



<%
String surveyRepliesEliminato="";
if(request.getAttribute("deleteSurveyReplies") == "OK"){
	surveyRepliesEliminato = "Sei riuscito ad eliminare il surveyreplies selezionato";
}if(request.getAttribute("deleteSurveyReplies") == "KO"){
	surveyRepliesEliminato = "Non sei riuscito ad eliminare il surveyreplies selezionato";
}
%>

<%
String surveyRepliesModificato="";
if(request.getAttribute("updateSurveyreplies") == "OK"){
	surveyRepliesModificato = "Modifica andata a buon fine";
}if(request.getAttribute("updateSurveyreplies") == "KO"){
	surveyRepliesModificato = "Modificata non riuscita";
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
<title>SurveyReplies</title>
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
	function updateSurveyreplies(){
		console.log("modifica");
		document.getElementById("formSelezioneSurveyreplies").action = "./updateSurveyreplies.jsp";
		document.getElementById("formSelezioneSurveyreplies").submit();
	}
	function deleteSurveyreplies(){
		console.log("delete");
		document.getElementById("formSelezioneSurveyreplies").method="POST";
		document.getElementById("formSelezioneSurveyreplies").action = "./DeleteSurveyRepliesServlet";
		document.getElementById("formSelezioneSurveyreplies").submit();
	}
	
	//INITIALIZE UPDATE FORM
	function initializeUpdateForm (item) {
		console.log("initializeUpdateForm - START - " + item);
		console.log(item);
		document.getElementById("surveyRepliesIdToUpdate").value = item.id;
		document.getElementById("survey_IdToUpdate").value = item.surveyId;
		document.getElementById("user_IdToUpdate").value = item.userId;
		document.getElementById("answersToUpdate").value = item.answer;
		document.getElementById("pdfFileNameToUpdate").value = item.pdfFileName;
		document.getElementById("pointsToUpdate").value = item.points;
	}
	
	//INITIALIZE INSERT FORM
	function initializeInsertForm (item) {
		console.log("initializeInsertForm - START - " + item);
		console.log(item);
		document.getElementById("survey_IdToInsert").value = item.surveyId;
		document.getElementById("user_IdToInsert").value = item.userId;
		document.getElementById("answersToInsert").value = item.answer;
		document.getElementById("pdfFileNameToInsert").value = item.pdfFileName;
		document.getElementById("pointsToInsert").value = item.points;
	}
	
	//SHOW UPDATE MODAL
	function showUpdateSurveyRepliesModal(){
		console.log("showUpdateSurveyRepliesModal!!!");
		const xhttp = new XMLHttpRequest();
		  xhttp.onload = function() {
			  console.log(this.responseText);
			  var surveyReplies = JSON.parse(this.responseText) ;
			  console.log(surveyReplies);
			  initializeUpdateForm (surveyReplies);
		    }
		  var id = document.querySelector('input[name="selectedSurveyrepliesId"]:checked').value;
		  xhttp.open("GET", "http://localhost:8080/repro.bo.giacomo/GetSurveyRepliesServlet?id=" + id +"", true);
		  xhttp.send();
	}
	
	//SHOW INSERT MODAL
	function showInsertRoleModal () {
		console.log("showInsertSurveryRepliesModal!!!");
		const xhttp = new XMLHttpRequest();
		  xhttp.onload = function() {
			  console.log(this.responseText);
			  var surveyReplies = JSON.parse(this.responseText) ;
			  console.log(surveyReplies);
			  initializeInsertForm (role);
		    }
	}
	
	//UPDATE FUNCTION
	function update(){
		console.log("update - START");
		var idToUpdate = $("#surveyRepliesIdToUpdate").val();
		var survey_IdToUpdate = $("#survey_IdToUpdate").val();
		var user_IdToUpdate = $("#user_IdToUpdate").val();
		var answersToUpdate = $("#answersToUpdate").val();
		var pdfFileNameToUpdate = $("#pdfFileNameToUpdate").val();
		var pointsToUpdate = $("#pointsToUpdate").val();
		
		var itemToUpdate = {
		"id":idToUpdate,
		"survey_id":survey_IdToUpdate,
		"user_id":user_IdToUpdate,
		"answers":answersToUpdate,
		"pdffilename":pdfFileNameToUpdate,
		"points":pointsToUpdate
		}
		
		$.ajax({
			type:"POST",
			url: "http://localhost:8080/repro.bo.giacomo/UpdateSurveyRepliesServlet",
			data:itemToUpdate,
			success:function(result){
				console.log(result);
				if(result == 'OK'){
		        	$('#updateSurveyRepliesModal').modal('hide');
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
		
		var survey_IdToUpdate = $("#survey_IdToInsert").val();
		var user_IdToUpdate = $("#user_IdToInsert").val();
		var answersToUpdate = $("#answersToInsert").val();
		var pdfFileNameToUpdate = $("#pdfFileNameToInsert").val();
		var pointsToUpdate = $("#pointsToInsert").val();
		
		console.log("survey_IdToInsert: " + survey_IdToInsert + " - user_IdToInsert: " + user_IdToInsert + " - answersToInsert: " + answersToInsert);
		
		var itemToInsert = {
				"survey_id":survey_IdToInsert,
				"user_id":user_IdToInsert,
				"answers":answersToInsert,
				"pdffilename":pdfFileNameToInsert,
				"points":pointsToInsert
        }
        
        $.ajax({
			  type: "POST",
			  url: "http://localhost:8080/repro.admin.web/InsertSurveyRepliesServlet",
			  data: itemToInsert,
			  success: function (responseText) {
				  console.log(responseText);
				  if (responseText==='OK') {					 
					  $('#insertSurveyRepliesModal').modal('hide');		
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

</head>
	<%@include file="./header.jsp"%>
<body>
<div class="container-fluid">
	<h1 style="text-align: left;">Survey Replies List</h1>
	<!-- Button trigger Insert Modal -->
	<div style="text-align: right;"><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#insertSurveyRepliesModal"
	onclick="showInsertSurveyRepliesModal(); return false;">+</button></div>
	<br>
	<h3 style="text-align:center;"><%= surveyRepliesEliminato%></h3>
	<h3 style="text-align:center;"><%= surveyRepliesModificato%></h3>
	<h3 style="text-align:center;"><%= loginMessage%></h3>

	<form id="formSelezioneSurveyreplies">
		<table class="table table-striped table-hover table-bordered">
		<thead class="thead-dark">
			<tr>
				<th scope="col"></th>
				<th scope="col">ID</th>
				<th scope="col">SURVEY_ID</th>
				<th scope="col">USER_ID</th>
				<th scope="col">STARTTIME</th>
				<th scope="col">ENDTIME</th>
				<th scope="col">ANSWERS</th>
				<th scope="col">PDFFILENAME</th>
				<th scope="col">POINTS</th>
			</tr>
			<%
			List<EntityInterface> items = SurveyRepliesService.getInstance().getAllSurveyReplies();
			for (EntityInterface item : items) {
				SurveysReplies surveyReplies = (SurveysReplies)item;
				request.setAttribute("id", surveyReplies.getId());
				
			%>
			<tr>
				<td><input type="radio" name="selectedSurveyrepliesId"
					value="<%out.print(surveyReplies.getId());%>"onclick="javascript:abilitaBottone();"></td>
				<td>
					<%
					out.print(surveyReplies.getId());
					%>
				</td>
				<td>
					<%
					out.print(surveyReplies.getSurveyId());
					%>
				</td>
				<td>
					<%
					out.print(surveyReplies.getUserId());
					%>
				</td>
				<td>
					<%
					out.print(surveyReplies.getStartTime());
					%>
				</td>
				<td>
					<%
					out.print(surveyReplies.getEndTime());
					%>
				</td>
				<td>
					<%
					out.print(surveyReplies.getAnswer());
					%>
				</td>
				<td>
					<%
					out.print(surveyReplies.getPdfFileName());
					%>
				</td>
				<td>
					<%
					out.print(surveyReplies.getPoints());
					%>
				</td>
			</tr>
			<%
			}
			%>
		</table>
		<br />
		
		<button type="button" id="deleteButton"  class="btn btn-danger"  data-toggle="modal" data-target="#deleteSurveyRepliesModal" disabled>ELIMINA</button>
		<button type="button" id="modificaButton" class="btn btn-primary" data-toggle="modal" data-target="#updateSurveyRepliesModal" disabled onclick="showUpdateSurveyRepliesModal(); return false;">MODIFICA</button>

<div class="modal" id=deleteSurveyRepliesModal tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Eliminazione SurveyReplies</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>Sei sicuro di volre rimuovere questo Survey Replies</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" onclick="javascript:deleteSurveyreplies();">SI</button>
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
<div class="modal fade" id="updateSurveyRepliesModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Update Modal</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form id="updateSurveyRepliesForm">
	      <div class="modal-body">
			
			  	<label>ID</label><br>
		  		<input type="number" name="surveyRepliesIdToUpdate" id="surveyRepliesIdToUpdate" value=""><br>
		  		
		  		<label>Survey ID</label><br>
		  		<input type="text" name="survey_IdToUpdate" id="survey_IdToUpdate" value=""><br>
		  		
		  		<label>User ID</label><br>
		  		<input type="text" name="user_IdToUpdate" id="user_IdToUpdate" value=""><br>
			
		  		<label>Answers</label><br>
		  		<input type="text" name="answersToUpdate" id="answersToUpdate" value=""><br>
		  		
		  		<label>PDF File Name</label><br>
		  		<input type="text" name="pdfFileNameToUpdate" id="pdfFileNameToUpdate" value=""><br>
		  		
		  		<label>Points</label><br>
		  		<input type="text" name="pointsToUpdate" id="pointsToUpdate" value=""><br>
		  		
	      </div>
	      <div class="modal-footer">
	      	<label id="errorUpdateMessage" style="display:none;">ERRORE LA MODIFICA NON � ANDATA A BUON FINE</label>
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary" onClick="update();">Save changes</button>
	      </div>
      </form> 
    </div>
  </div>
</div>

<!-- Insert Modal -->
<div class="modal fade" id="insertSurveyRepliesModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Insert Modal</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form id="insertSurveyRepliesForm">
	      <div class="modal-body">
			
		  		<label>Survey ID</label><br>
		  		<input type="text" name="survey_IdToInsert" id="survey_IdToInsert" value=""><br>
		  		
		  		<label>User ID</label><br>
		  		<input type="text" name="user_IdToInsert" id="user_IdToInsert" value=""><br>
			
		  		<label>Answers</label><br>
		  		<input type="text" name="answersToInsert" id="answersToInsert" value=""><br>
		  		
		  		<label>PDF File Name</label><br>
		  		<input type="text" name="pdfFileNameToInsert" id="pdfFileNameToInsert" value=""><br>
		  		
		  		<label>Points</label><br>
		  		<input type="text" name="pointsToInsert" id="pointsToInsert" value=""><br>	  		
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
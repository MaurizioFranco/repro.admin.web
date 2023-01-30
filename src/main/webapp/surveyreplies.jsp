<%@page import="proxima.informatica.academy.seventh.surveyreplies.service.SurveyRepliesService"%>
<%@page import="proxima.informatica.academy.dto.SurveyrepliesDto"%>

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
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

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
		document.getElementById("formSelezioneSurveyreplies").action = "./DeleteSurveyRepliesServlet";
		document.getElementById("formSelezioneSurveyreplies").submit();
	}
	
	function initializeUpdateForm (item) {
		console.log("initializeUpdateForm - START - " + item);
		console.log(item);
		document.getElementById("surveyRepliesIdToUpdate").value = item.id;
		document.getElementById("survey_IdToUpdate").value = item.survey_id;
		document.getElementById("user_IdToUpdate").value = item.user_id;
		document.getElementById("answersToUpdate").value = item.answers;
		document.getElementById("pdfFileNameToUpdate").value = item.pdffilename;
		document.getElementById("pointsToUpdate").value = item.points;
	}
	
	function showUpdateSurveyRepliesModal(){
		console.log("showUpdateSurveyRepliesModal!!!");
		const xhttp = new XMLHttpRequest();
		  xhttp.onload = function() {
			  console.log(this.responseText);
			  var surveyReplies = JSON.parse(this.responseText) ;
			  console.log(surveyReplies);
			  initializeUpdateForm (surveyReplies);
		    }
		  xhttp.open("GET", "http://localhost:8080/repro.bo.giacomo/GetSurveyRepliesServlet?id=2", true);
		  xhttp.send();
	}
	
	function update(){
		console.log("update - START");
		var idToUpdate = document.getElementById("surveyRepliesIdToUpdate").value;
		var survey_idToUpdate = document.getElementById("survey_IdToUpdate").value;
		var user_idToUpdate = document.getElementById("user_IdToUpdate").value;
		var answersToUpdate = document.getElementById("answersToUpdate").value;
		var pdfFileNameToUpdate = document.getElementById("pdfFileNameToUpdate").value;
		var pointsToUpdate = document.getElementById("pointsToUpdate").value;
		console.log(idToUpdate,survey_idToUpdate,user_idToUpdate,answersToUpdate,pdfFileNameToUpdate,pointsToUpdate);
		
		var formData = new FormData();
		formData.append("id",idToUpdate);
		formData.append("survey_id",survey_idToUpdate);
		formData.append("user_id",user_idToUpdate);
		formData.append("answers",answersToUpdate);
		formData.append("pdffilename",pdfFileNameToUpdate);
		formData.append("points",pointsToUpdate);
		
		const xhttp = new XMLHttpRequest();
		  xhttp.onload = function() {
			  console.log(this.responseText);
		    }
		  xhttp.open("POST", "http://localhost:8080/repro.bo.giacomo/UpdateSurveyRepliesServlet", true);
		  xhttp.send(formData);
	}
</script>

</head>
	<%@include file="./header.jsp"%>
<body>
<div class="container-fluid">
	<h1>Survey Replies List</h1>
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
			List<SurveyrepliesDto> surveyreplies = SurveyRepliesService.getInstance().selectAllSurveyreplies();
			for (SurveyrepliesDto tableSurveyReplies : surveyreplies) {
			%>
			<tr>
				<td><input type="radio" name="selectedSurveyrepliesId"
					value="<%out.print(tableSurveyReplies.getId());%>"onclick="javascript:abilitaBottone();"></td>
				<td>
					<%
					out.print(tableSurveyReplies.getId());
					%>
				</td>
				<td>
					<%
					out.print(tableSurveyReplies.getSurvey_id());
					%>
				</td>
				<td>
					<%
					out.print(tableSurveyReplies.getUser_id());
					%>
				</td>
				<td>
					<%
					out.print(tableSurveyReplies.getStarttime());
					%>
				</td>
				<td>
					<%
					out.print(tableSurveyReplies.getEndtime());
					%>
				</td>
				<td>
					<%
					out.print(tableSurveyReplies.getAnswers());
					%>
				</td>
				<td>
					<%
					out.print(tableSurveyReplies.getPdffilename());
					%>
				</td>
				<td>
					<%
					out.print(tableSurveyReplies.getPoints());
					%>
				</td>
			</tr>
			<%
			}
			%>
		</table>
		<br />
		<button type="submit" id="deleteButton" value="CANCELLA" class="btn btn-danger" disabled onclick="javascript:deleteSurveyreplies();">ELIMINA</button>
		
		<button type="button" id="modificaButton" class="btn btn-primary" data-toggle="modal" data-target="#updateSurveyRepliesModal" disabled onclick="showUpdateSurveyRepliesModal(); return false;">
  MODIFICA
</button>
	</form>
</div>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>

<!-- Modal -->
<div class="modal fade" id="updateSurveyRepliesModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
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
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary" onClick="update();">Save changes</button>
	      </div>
      </form> 
    </div>
  </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
</body>
</html>
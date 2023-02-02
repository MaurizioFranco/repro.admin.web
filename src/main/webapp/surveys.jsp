<%@page import="centauri.academy.proxima.cerepro.entity.EntityInterface"%>
<%@page import="proxima.informatica.academy.seventh.service.SurveyService"%>
<%@page import="centauri.academy.proxima.cerepro.repository.SurveysRepository"%>
<%@page import="centauri.academy.proxima.cerepro.entity.Surveys"%>
<%@page import="java.util.List"%>

<%@page import="java.nio.file.attribute.UserPrincipalLookupService"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<%-- <%@include file="authentication.jsp"%> --%>


<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

	function abilitaBottone() {
		console.log("questa è la console");
 		document.getElementById("buttonDelete").disabled = false;
 		document.getElementById("buttonUpdate").disabled = false;
	}
	
	//INITIALIZE UPDATE FORM
	function initializeUpdateForm (item) {
		console.log("initializeUpdateForm - START - " + item);
		console.log(item);
		document.getElementById("surveyIdToUpdate").value = item.id;
		document.getElementById("surveyLabelToUpdate").value = item.label;
		document.getElementById("surveyTimeToUpdate").value = item.time;
		document.getElementById("surveyDescriptionToUpdate").value = item.description;
	}
	
	//INITIALIZE INSERT FORM
	function initializeInsertForm (item) {
		console.log("initializeInsertForm - START - " + item);
		console.log(item);
		document.getElementById("surveyLabelToInsert").value = item.label;
		document.getElementById("surveyTimeToInsert").value = item.time;
		document.getElementById("surveyDescriptionToInsert").value = item.description;
	}
	
	//SHOW UPDATE MODAL
	function showUpdateSurveyModal () {
		console.log("showUpdateSurveyModal!!!");
		const xhttp = new XMLHttpRequest();
		  xhttp.onload = function() {
			  var survey = JSON.parse(this.responseText) ;
			  console.log(survey);
			  initializeUpdateForm (survey);
		    }
		  xhttp.open("GET", "http://localhost:8080/repro.admin.web/GetSurveyServlet?id=4", true);
		  xhttp.send();
	}
	
	//SHOW INSERT MODAL
	function showInsertSurveyModal () {
		console.log("showInsertSurveyModal!!!");
		const xhttp = new XMLHttpRequest();
		  xhttp.onload = function() {
			  console.log(this.responseText);
			  var survey = JSON.parse(this.responseText) ;
			  console.log(survey);
			  initializeInsertForm (survey);
		    }
	}
	
	//UPDATE FUNCTION
	function update() {
		console.log("update - START");
		var idToUpdate = document.getElementById("surveyIdToUpdate").value;
		var labelToUpdate = document.getElementById("surveyLabelToUpdate").value;
		var timeToUpdate = document.getElementById("surveyTimeToUpdate").value;
		var descriptionToUpdate = document.getElementById("surveyDescriptionToUpdate").value;
		console.log(idToUpdate, labelToUpdate, timeToUpdate, descriptionToUpdate);
		
		var formData = new FormData();
		formaData.append("id", idToUpdate);
		formaData.append("label", labelToUpdate);
		formaData.append("time", timeToUpdate);
		formaData.append("description", descriptionToUpdate);
		
		const xhttp = new XMLHttpRequest();
		xhttp.onload = function() {
			console.log(this.responseText);
		}
		xhttp.open("POST", "http://localhost:8080/repro.admin.web/UpdateSurveyServlet", true)
		xhttp.send(formData);
	}
	
	//INSERT FUNCTION
	function insert () {
		console.log("insert - START");
		
		var surveyLabelToInsert = $("#surveyLabelToInsert").val();
		var surveyTimeToInsert = $("#surveyTimeToInsert").val();
		var surveyDescriptionToInsert = $("#surveyDescriptionToInsert").val();
		
		console.log("surveyLabelToInsert: " + surveyLabelToInsert + " - surveyTimeToInsert: " + surveyTimeToInsert + " - surveyDescriptionToInsert: " + surveyDescriptionToInsert);
		
		var itemToInsert = {
        		"label":surveyLabelToInsert,
        		"time":surveyTimeToInsert,
        		"description":surveyDescriptionToInsert
        }
        
        $.ajax({
			  type: "POST",
			  url: "http://localhost:8080/repro.admin.web/InsertSurveyServlet",
			  data: itemToInsert,
			  success: function (responseText) {
				  console.log(responseText);
				  if (responseText==='OK') {					 
					  $('#insertSurveyModal').modal('hide');		
					  location.reload();
// 					  $('#errorUpdateMessage').show();
// 					  $('#errorUpdateMessage').html(responseText);
// 				  } else {
					  
				  }
			  },
			  dataType: "text"
			});
	}
	
	function deleteSurvey(){
		console.log("delete");
		document.getElementById("formSelectSurvey").method = "POST";
		document.getElementById("formSelectSurvey").action = "./DeleteSurveyServlet";
		document.getElementById("formSelectSurvey").submit();
// 		location.reload()
	}
</script>
<meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>List Surveys</title>

<link rel="icon" type="image/ico" href="./img/Logo-Centauri-Academy-2018.ico">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

<link rel="stylesheet" href="css/style.css">

</head>
<body>
	<%@include file="header.jsp"%>
<div class="container-fluid">
	<h1 style="text-align: left;">Survey List</h1>
	<!-- Button trigger Insert Modal -->
	<div style="text-align: right;"><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#insertSurveyModal"
	onclick="showInsertSurveyModal(); return false;">+</button></div>
	<br>
	<form id="formSelectSurvey">
		<table class="table table-striped table-hover  table-bordered">
			<thead class="thead-dark">
				<tr>
					<th scope="col"></th>
					<th scope="col">Id</th>
					<th scope="col">Label</th>
					<th scope="col">Time</th>
					<th scope="col">Description</th>
				</tr>
			</thead>	
			<%
			List<EntityInterface> items = SurveyService.getInstance().getAllSurveys();
			for (EntityInterface item : items) {
				Surveys survey = (Surveys)item;
				request.setAttribute("id", survey.getId());
				
			%>
			<tr>
				<th scope="row"><input type="radio" name="id" onclick="javascript:abilitaBottone();" value="<%out.print(survey.getId());%>" /></th>
				<td>
					<%
					out.print(survey.getId().toString());
					%>
				</td>
				<td>
					<%
					out.print(survey.getLabel().toString());
					%>
				</td>
				<td>
					<%
					out.print(survey.getTime().toString());
					%>
				</td>
				<td>
					<%
					out.print(survey.getDescription().toString());
					%>
				</td>
			</tr>
			<%
			}
			%>
		</table>
		<button type="button" class="btn btn-danger" id="buttonDelete" disabled data-toggle="modal" data-target="#deleteSurveyModal">Cancella</button>
		<button type="button" class="btn btn-primary" id="buttonUpdate" data-toggle="modal" data-target="#updateSurveyModal" onclick="showUpdateSurveyModal(); return false;">MODIFICA</button>
	<!-- Modal DELETE-->
		<div class="modal fade" id="deleteSurveyModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
			<div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title">Eliminazione survey</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			        <p>Sei sicuro di volre rimuovere questa survey?</p>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-primary" onclick="javascript:deleteSurvey();">SI</button>
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
<div class="modal fade" id="updateSurveyModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Update Modal</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form  id="updateSurveyForm">
	      <div class="modal-body">
			
			  	<label>ID</label><br>
		  		<input type="number" name="surveyIdToUpdate" id="surveyIdToUpdate" value=""><br>
		  		
		  		<label>Label</label><br>
		  		<input type="text" name="surveyLabelToUpdate" id="surveyLabelToUpdate" value=""><br>
			
		  		<label>Time</label><br>
		  		<input type="number" name="surveyTimeToUpdate" id="surveyTimeToUpdate" value=""><br>
		  		
		  		<label>Description</label><br>
		  		<input type="text" name="surveyDescriptionToUpdate" id="surveyDescriptionToUpdate" value=""><br>
			
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary" onclick="update();">Save changes</button>
	      </div>
      </form> 
    </div>
  </div>
</div>

<!-- Insert Modal -->
<div class="modal fade" id="insertSurveyModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Insert Modal</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form id="insertSurveyForm">
	      <div class="modal-body">
			
		  		<label>Label</label><br>
		  		<input type="text" name="surveyLabelToInsert" id="surveyLabelToInsert" value=""><br>
		  		
		  		<label>Time</label><br>
		  		<input type="text" name="surveyTimeToInsert" id="surveyTimeToInsert" value=""><br>
			
		  		<label>Description</label><br>
		  		<input type="number" name="roleDescriptionToInsert" id="surveyDescriptionToInsert" value=""><br>		  		
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
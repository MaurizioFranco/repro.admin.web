<%@page import="centauri.academy.proxima.cerepro.entity.SurveysQuestions"%>
<%@page import="proxima.informatica.academy.seventh.service.SurveyquestionsService"%>
<%@page import="java.util.List"%>
<%@page import="java.nio.file.attribute.UserPrincipalLookupService"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<%@include file="authentication.jsp"%>


<head>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">

	function abilitaBottone() {
		console.log("questa è la console");
 		document.getElementById("buttonDelete").disabled = false;
 		document.getElementById("buttonUpdate").disabled = false;
	}
	
	function deleteSurveyqurestions() {
		console.log("Delete");
		document.getElementById("formSelectSurveyquestions").action = "./DeleteSurveyquestionsServlet";
		document.getElementById("formSelectSurveyquestions").method = "post";
		document.getElementById("formSelectSurveyquestions").submit;
	}
	
	function initializeUpdateForm (item) {
		console.log("initializeUpdateForm - START - " + item);
		console.log(item);
		document.getElementById("surveysQuestionsIdToUpdate").value = item.id;
		document.getElementById("surveysQuestionsSurveyIdToUpdate").value = item.surveyId;
		document.getElementById("surveysQuestionsQuestionIdToUpdate").value = item.questionId;
		document.getElementById("surveysQuestionsPositionToUpdate").value = item.position;
		
	}
	
	function showUpdateSurveysQuestionsModal () {
		console.log("showUpdateSurveysQuestionsModal!!!");
		const xhttp = new XMLHttpRequest();
		  xhttp.onload = function() {
			  console.log(this.responseText);
			  var role = JSON.parse(this.responseText) ;
			  console.log(role);
			  initializeUpdateForm (role);
		    }
		  var id= document.querySelector('input[name="sqId"]:checked').value;
		  xhttp.open("GET", "http://localhost:8080/repro.admin.web/GetSurveyquestionsServlet?sqId="+id, true);
		  xhttp.send();
	}
	
	function update () {
		console.log("update - START");
		var idToUpdate = $("#surveysQuestionsIdToUpdate").val(); 
		var surveyIdToUpdate = $("#surveysQuestionsSurveyIdToUpdate").val(); 
		var questionIdToUpdate = $("#surveysQuestionsQuestionIdToUpdate").val(); 
		var positionToUpdate = $("#surveysQuestionsPositionToUpdate").val(); 
		console.log("idToUpdate: " + idToUpdate + " - surveyIdToUpdate: " + surveyIdToUpdate + " - questionIdToUpdate: " + questionIdToUpdate + " - positionToUpdate: " + positionToUpdate);
		
		var itemToUpdate = {
				"id":idToUpdate,
				"surveyId":surveyIdToUpdate,
				"questionId":questionIdToUpdate,
				"position":positionToUpdate
				}
	
		$.ajax({
			type:"POST",
			url: "http://localhost:8080/repro.admin.web/UpdateSurveyquestionsServlet",
			data:itemToUpdate,
			success:function(result){
				console.log(result);
				if(result == 'OK'){
		        	$('#updateSurveysQuestionsModal').modal('hide');
				}else{
					result = 'KO';
					$('#errorUpdateMessage').show();
					$('#errorUpdateMessage').html(result);
				}
			},
			dataType:"text"
		});
	}
	
	
</script>
<meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>List Survey Questions</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

<link rel="stylesheet" href="style.css">

</head>
<body>
	<%@include file="header.jsp"%>
<div class="container-fluid">
<h1>Survey Question List</h1>
	<form id="formSelectSurveyquestions">
		<table class="table table-striped table-hover  table-bordered">
			<thead class="thead-dark">
				<tr>
					<th scope="col"></th>
					<th scope="col">Id</th>
					<th scope="col">Survey ID</th>
					<th scope="col">Question ID</th>
					<th scope="col">Position</th>
				</tr>
			</thead>	
			<%
			List<SurveysQuestions> listSurveyquestions = new ArrayList<SurveysQuestions>();
			listSurveyquestions = SurveyquestionsService.getInstance().getAllSurveyquestions();
			for (SurveysQuestions sq : listSurveyquestions) {
				request.setAttribute("id", sq.getId());
				
			%>
			<tr>
				<th scope="row"><input type="radio" name="sqId" onclick="javascript:abilitaBottone();" value="<%out.print(sq.getId());%>" /></th>
				<td>
					<%
					out.print(sq.getId());
					%>
				</td>
				<td>
					<%
					out.print(sq.getSurveyId());
					%>
				</td>
				<td>
					<%
					out.print(sq.getQuestionId());
					%>
				</td>
				<td>
					<%
					out.print(sq.getPosition());
					%>
				</td>
			</tr>
			<%
			}
			%>
		</table>
		<button type="button" id="buttonDelete" class="btn btn-danger" data-toggle="modal" data-target="#deleteSurveysQuestionsModal" disabled>Delete</button>
		<button type="button" id="buttonUpdate" class="btn btn-primary" data-toggle="modal" data-target="#updateSurveysQuestionsModal" disabled onclick="showUpdateSurveysQuestionsModal(); return false;">Update</button>

<!--Delete Modal -->
<div class="modal fade" id="deleteSurveysQuestionsModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Delete Surveys Questions</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>Do you really want to delete</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <input class="btn btn-danger" type="submit" value="Confirm" onclick="javascript:deleteSurveyqurestions();">
      </div>
    </div>
  </div>
</div>
	</form>
</div>




<!-- Update Modal -->
<div class="modal fade" id="updateSurveysQuestionsModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Update Surveys Questions</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form id="updateSurveysQuestionsForm">
	      <div class="modal-body">
			
			  	<label>ID</label><br>
		  		<input type="number" name="surveysQuestionsIdToUpdate" id="surveysQuestionsIdToUpdate" value=""><br>
		  		
		  		<label>Survey ID</label><br>
		  		<input type="number" name="surveysQuestionsSurveyIdToUpdate" id="surveysQuestionsSurveyIdToUpdate" value=""><br>
		  		
		  		<label>Question ID</label><br>
		  		<input type="number" name="surveysQuestionsQuestionIdToUpdate" id="surveysQuestionsQuestionIdToUpdate" value=""><br>
			
		  		<label>Position</label><br>
		  		<input type="number" name="surveysQuestionsPositionToUpdate" id="surveysQuestionsPositionToUpdate" value=""><br>		  		
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary" onClick="update();">Save changes</button>
	      </div>
      </form> 
    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>

</body>
</html>
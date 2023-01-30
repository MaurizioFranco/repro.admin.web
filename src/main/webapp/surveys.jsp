<%@page import="java.util.List"%>
<%@page import="proxima.informatica.academy.seventh.surveyquestion.service.SurveyService"%>
<%@page import="proxima.informatica.academy.dto.SurveyDto"%>
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
	
	function deleteSurvey() {
		console.log("Delete");
		document.getElementById("formSelectSurvey").action = "./DeleteSurveyServlet";
		document.getElementById("formSelectSurvey").method = "post";
		document.getElementById("formSelectSurvey").submit;
	}
	
	function updateSurvey() {
		console.log("Update");
		document.getElementById("formSelectSurvey").action = "./updateSurvey.jsp";
		document.getElementById("formSelectSurvey").method = "post";
		document.getElementById("formSelectSurvey").submit;
	}
	
</script>
<meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>List Surveys</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

<link rel="stylesheet" href="list.css">

</head>
<body>
	<%@include file="header.jsp"%>
<div class="container-fluid">
	<h1>Survey List</h1>
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
			List<SurveyDto> surveys = SurveyService.getInstance().selectAllSurveys();
			for (SurveyDto survey : surveys) {
				request.setAttribute("id", survey.getId());
				
			%>
			<tr>
				<th scope="row"><input type="radio" name="surveyId" onclick="javascript:abilitaBottone();" value="<%out.print(survey.getId());%>" /></th>
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
		<input class="btn btn-danger" type="submit" class="button" id="buttonDelete" value="Delete" disabled onclick="javascript:deleteSurvey();">
		<input class="btn btn-primary" type="submit" class="button"	id="buttonUpdate" value="Update" disabled onclick="javascript:updateSurvey();">
	</form>
</div>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>

</body>
</html>
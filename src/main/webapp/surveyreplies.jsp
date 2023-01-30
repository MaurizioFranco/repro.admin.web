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
		console.log("questa è una stampa di console");
		document.getElementById("deleteButton").disabled=false;
		document.getElementById("modificaButton").disabled=false;
	}
	function modificaSurveyreplies(){
		console.log("modifica");
		document.getElementById("formSelezioneSurveyreplies").action = "./updateSurveyreplies.jsp";
		document.getElementById("formSelezioneSurveyreplies").submit();
	}
	function deleteSurveyreplies(){
		console.log("delete");
		document.getElementById("formSelezioneSurveyreplies").action = "./DeleteSurveyRepliesServlet";
		document.getElementById("formSelezioneSurveyreplies").submit();
	}
</script>

</head>
	<%@include file="./header.jsp"%>
<body>
<div class="container-fluid">

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
		<button type="submit" id="modificaButton" value="CANCELLA" class="btn btn-danger" disabled onclick="javascript:deleteSurveyreplies();">ELIMINA</button>
		
		<button type="submit" id="deleteButton" value="MODIFICA" class="btn btn-primary" disabled onclick="javascript:modificaSurveyreplies();">MODIFICA</button>
	</form>
</div>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
</body>
</html>
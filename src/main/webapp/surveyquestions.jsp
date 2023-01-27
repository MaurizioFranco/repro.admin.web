<%@page import="repro.bo.giacomo.proxima.informatica.academy.seventh.service.SurveyquestionsService"%>
<%@page import="java.util.List"%>
<%@page import="proxima.informatica.academy.dto.SurveyquestionsDto"%>
<%@page import="repro.bo.giacomo.proxima.informatica.academy.seventh.service.RoleService"%>
<%@page import="proxima.informatica.academy.dto.RoleDto"%>
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
	
	function deleteUser() {
		console.log("Delete");
		document.getElementById("formSelectSurveyquestions").action = "./DeleteSurveyquestionsServlet";
		document.getElementById("formSelectSurveyquestions").method = "post";
		document.getElementById("formSelectSurveyquestions").submit;
	}
	
	function updateUser() {
		console.log("Update");
		document.getElementById("formSelectSurveyquestions").action = "./updateSurveyquestions.jsp";
		document.getElementById("formSelectSurveyquestions").method = "post";
		document.getElementById("formSelectSurveyquestions").submit;
	}
	
</script>
<meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>List Survey Questions</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

<link rel="stylesheet" href="list.css">

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
			List<SurveyquestionsDto> listSurveyquestions = new ArrayList<SurveyquestionsDto>();
			listSurveyquestions = SurveyquestionsService.getInstance().getAllSurveyquestions();
			for (SurveyquestionsDto sq : listSurveyquestions) {
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
		<input class="btn btn-danger" type="submit" class="button" id="buttonDelete" value="Delete" disabled onclick="javascript:deleteUser();">
		<input class="btn btn-primary" type="submit" class="button"	id="buttonUpdate" value="Update" disabled onclick="javascript:updateUser();">
	</form>
</div>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>

</body>
</html>
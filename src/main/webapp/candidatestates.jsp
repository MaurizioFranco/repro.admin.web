<%@page import="proxima.informatica.academy.dto.CandidateStatesDto"%>
<%@page import="proxima.informatica.academy.seventh.candidatestates.service.CandidateStatesService"%>
<%@page import="java.util.List"%>

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
			List<CandidateStatesDto> listCandidatestate = CandidateStatesService.getInstance().selectAll();
			for (CandidateStatesDto sq : listCandidatestate) {
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
					out.print(sq.getRole_id());
					%>
				</td>
				<td>
					<%
					out.print(sq.getStatus_code());
					%>
				</td>
				<td>
					<%
					out.print(sq.getStatus_label());
					%>
				</td>
				<td>
					<%
					out.print(sq.getStatus_color());
					%>
				</td>
				<td>
					<%
					out.print(sq.getStatus_description());
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

<div class="modal fade" id="updateCadndateStateModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="./UpdateCandidateStatesServlet" method="post">
	      <div class="modal-body">
			
			  	<label>ID</label><br>
		  		<input type="number" name="roleIdToUpdate" id="roleIdToUpdate" value=""><br>
		  		
			  	
			  	<label>Role Id</label><br>
		  		<input type="number" name="roleIdToUpdate" id="roleIdToUpdate" value=""><br>
		  		
		  		<label>Status code</label><br>
		  		<input type="text" name="status_code" id="status_code" value=""><br>
		  		
		  		<label>Status label</label><br>
		  		<input type="text" name="status_label" id="status_label" value=""><br>
			
		  		<label>Status description</label><br>
		  		<input type="number" name="status_description" id="status_description" value=""><br>
		  		
		  		<label>Status color</label><br>
		  		<input type="number" name="status_color" id="status_color" value=""><br>
		  				  		
			
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary">Save changes</button>
	        <input class="btn btn-primary" type="submit" id="button" value="Update">
	      </div>
      </form> 
    </div>
  </div>
</div>

</body>
</html>
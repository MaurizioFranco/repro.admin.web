<%@page import="proxima.informatica.academy.seventh.questions.service.QuestionsService"%>
<%@page import="java.util.List"%>

<%@page import="proxima.informatica.academy.dto.QuestionsDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%
    String deleteStatus = null ; 
    if (request.getAttribute("deleteConfirmed")!=null) { 
	    deleteStatus = ""+request.getAttribute("deleteConfirmed");
    }
	
    String insertStatus = null;
    if(request.getAttribute("insertConfirmed")!=null){
    	insertStatus = ""+request.getAttribute("insertConfirmed");
    }
%>
<html>
<head>
<meta charset="ISO-8859-1">
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	 
	 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

<title>Questions</title>
<script type="text/javascript">
// 			alert("sono qui");
			
			
			function abilitaButton(){
				console.log("Questa è la funzione");
				document.getElementById("deleteButton").disabled=false;
				document.getElementById("modifyButton").disabled=false;
				
			}
			
			function deleteQuestion(){
				console.log("delete");
				document.getElementById("selectionForm").action="./DeleteQuestionServlet";
				document.getElementById("selectionForm").method="POST";
				document.getElementById("selectionForm").submit();
			}
			
			function modifyQuestion(){
				console.log("modifica");
// 				document.getElementById("selectionForm").action="updateUser.jsp";
// 				document.getElementById("selectionForm").submit();
			}
			
			
			function initializeUpdateForm (item) {
				console.log("initializeUpdateForm - START - " + item);
				console.log(item);
				document.getElementById("questionIdToUpdate").value = item.id;
				document.getElementById("questionLabelToUpdate").value = item.label;
				document.getElementById("questionDescriptionToUpdate").value = item.description;
				
			}
			
			function showUpdateQuestionModal () {
				console.log("showUpdateRoleModal!!!");
				const xhttp = new XMLHttpRequest();
				  xhttp.onload = function() {
					  var role = JSON.parse(this.responseText) ;
					  console.log(role);
					  initializeUpdateForm (role);
				    }
				  xhttp.open("GET", "http://localhost:8080/repro.admin.web/GetQuestionServlet?id=24", true);
				  xhttp.send();
			}


		</script>
</head>
<body>
				<%
				if(insertStatus!=null){
				%>
				<div class="alert alert-success" role="alert">
				<% out.print("Question inserted correctly"); %>
				</div>
				<%
				}
				%>
				
				<%

				List<QuestionsDto> lista = null;
				lista = QuestionsService.getIstance().selectAll();
					if(lista.size() == 0){
				%>
					<div class="alert alert-danger" role="alert">
					<% out.print("There are no questions saved, create a new one"); %>
					</div>
				<%
				}
				%>
				<%
				if(lista.size() > 0){
				%>
	<form id="selectionForm">
			<table class="table table-striped">
				<thead>
				    <tr>
				    <th scope="col">#</th>
				      <th scope="col">id</th>
				      <th scope="col">label</th>
				      <th scope="col">description</th>
				      <th scope="col">ansa</th>
				      <th scope="col">ansb</th>
				      <th scope="col">ansc</th>
				      <th scope="col">ansd</th>
				      <th scope="col">anse</th>
				      <th scope="col">ansf</th>
				      <th scope="col">ansg</th>
				      <th scope="col">ansh</th>
				      <th scope="col">cansa</th>
				      <th scope="col">cansb</th>
				      <th scope="col">cansc</th>
				      <th scope="col">cansd</th>
				      <th scope="col">canse</th>
				      <th scope="col">cansf</th>
				      <th scope="col">cansg</th>
				      <th scope="col">cansh</th>
				      <th scope="col">full_answer</th>
				    </tr>
				  </thead>
				<%
					if(deleteStatus != null){
				%>
					<div class="alert alert-danger" role="alert">
					<% out.print("Question deleted successfully"); %>
					</div>
					<%
					}
					%>
				<%
					
			   
			   for (QuestionsDto item : lista) {
				%>
			    <tbody>
			    	<tr>
				    	<td><input type="radio" name="selectedUserId" value="<%out.print(item.getId());%>" onclick="javascript:abilitaButton()"></td>
				    	<td><%= item.getId() %></td>
		 		    	<td><%= item.getLabel() %></td>
		 		    	<td><%= item.getDescription() %></td>
		 		    	<td><%= item.getAnsa() %></td>
		 		    	<td><%= item.getAnsb() %></td>
		 		    	<td><%= item.getAnsc() %></td>
		 		    	<td><%= item.getAnsd()%></td>
		 		    	<td><%= item.getAnse()%></td>
		 		    	<td><%= item.getAnsf() %></td>
		 		    	<td><%= item.getAnsg() %></td>
		 		    	<td><%= item.getAnsh()%></td>
		 		    	<td><%= item.getCansa() %></td>
		 		    	<td><%= item.getCansb() %></td>
		 		    	<td><%= item.getCansc() %></td>
		 		    	<td><%= item.getCansd()%></td>
		 		    	<td><%= item.getCanse()%></td>
		 		    	<td><%= item.getCansf() %></td>
		 		    	<td><%= item.getCansg() %></td>
		 		    	<td><%= item.getCansh()%></td>
		 		    	<td><%= item.getFull_answer()%></td>
	 		    	</tr>
	 		     
				</tbody>
				<%
				  }
				}
				%>
			</table>
			
<!-- 			<input type="submit" value="Cancella" id="deleteButton" disabled onclick="javascript:deleteUser()"/> -->
			<button type="button" class="btn btn-danger" id="deleteButton" disabled onclick="javascript:deleteQuestion()">Cancella</button>
			<button type="button" class="btn btn-primary" id="modifyButton" data-toggle="modal" data-target="#updateQuestionModal" onclick="showUpdateQuestionModal(); return false;">
			  MODIFICA
			</button>
			
			</form>
		<a href="insertQuestion.jsp">
			<button type="button" class="btn btn-info" id="insertButton" >Inserisci question</button>
		</a>
			
			<!-- Modal -->
			<div class="modal fade" id="updateQuestionModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <form action="./UpdateRoleServlet" method="post">
				      <div class="modal-body">
						
						  	<label>ID</label><br>
					  		<input type="number" name="questionIdToUpdate" id="questionIdToUpdate" value=""><br>
					  		
					  		<label>Label</label><br>
					  		<input type="text" name="questionLabelToUpdate" id="questionLabelToUpdate" value=""><br>
					  		
					  		<label>Description</label><br>
					  		<input type="text" name="questionDescriptionToUpdate" id="questionDescriptionToUpdate" value=""><br>
						
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
	
	
	
	
	
	
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
	

</body>
</html>
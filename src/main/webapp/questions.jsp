<%@page import="centauri.academy.proxima.cerepro.entity.EntityInterface"%>
<%@page import="centauri.academy.proxima.cerepro.entity.Questions"%>
<%@page import="proxima.informatica.academy.seventh.service.QuestionsService"%>
<%@page import="java.util.List"%>


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
	 <%@include file="authentication.jsp"%>
	 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

<title>Questions</title>
<script type="text/javascript">
// 			alert("sono qui");
			
			
		function abilitaButton(){
			console.log("Questa è la funzione");
			document.getElementById("deleteButton").disabled=false;
			document.getElementById("modifyButton").disabled=false;
			
		}
		
		function modifyQuestion(){
			console.log("modifica");
			showUpdateQuestionModal();
		}
			
		function initializeUpdateForm (item) {
			console.log("initializeUpdateForm - START - " + item);
			console.log(item);
			document.getElementById("questionIdToUpdate").value = item.id;
			document.getElementById("questionLabelToUpdate").value = item.label;
			document.getElementById("questionDescriptionToUpdate").value = item.description;
			
		}
			
		function showUpdateQuestionModal () {
			console.log("showUpdateQuestionModal!!!");
			const xhttp = new XMLHttpRequest();
			  xhttp.onload = function() {
				  var item = JSON.parse(this.responseText) ;
				  console.log(item);
				  initializeUpdateForm (item);
			    }
			  var id= document.querySelector('input[name="selectedUserId"]:checked').value;
			  xhttp.open("GET", "http://localhost:8080/repro.admin.web/GetQuestionServlet?id="+id, true);
			  xhttp.send();
		}

		function update(){
			console.log("update - START");
			var idToUpdate = $("#questionIdToUpdate").val();
			var questionLabelToUpdate = $("#questionLabelToUpdate").val();
			var questionDescriptionToUpdate = $("#questionDescriptionToUpdate").val();
			console.log(idToUpdate,questionLabelToUpdate,questionDescriptionToUpdate);
			
			var itemToUpdate = {
			"id":idToUpdate,
			"label":questionLabelToUpdate,
			"description":questionDescriptionToUpdate,
			}
			
			$.ajax({
				type:"POST",
				url: "http://localhost:8080/repro.admin.web/UpdateQuestionServlet",
				data:itemToUpdate,
				success:function(result){
					console.log(result);
					if(result == 'OK'){
			        	$('#updateQuestionModal').modal('hide');
					}else{
						
					}
				},
				dataType:"text"
			});
		}
		

		
		function deleteQuestion(){
			console.log("delete");
			document.getElementById("selectionForm").method = "POST";
			document.getElementById("selectionForm").action = "./DeleteQuestionServlet";
			document.getElementById("selectionForm").submit();
		}
		
// 		function showDeleteModal(){
// 			console.log("showDeleteModal!!!");
// 			const xhttp = new XMLHttpRequest();
// 			  xhttp.onload = function() {
// 				  var item = JSON.parse(this.responseText) ;
// 				  console.log(item);
// 				  initializeDeleteForm (item);
// 			    }
// 			  var id= document.querySelector('input[name="selectedUserId"]:checked').value;
// 			  xhttp.open("GET", "http://localhost:8080/repro.admin.web/GetQuestionServlet?id="+id, true);
// 			  xhttp.send();
// 		}
		
// 		function initializeDeleteForm (item) {
// 			console.log("initializeDeleteForm - START - " + item);
// 			console.log(item);
// 			document.getElementById("idToCancel").value = item.id;
// 			document.getElementById("labelToCancel").value = item.label;
// 		}

// 		function deleteItem(){
// 			console.log("DELETE - START");
// 			var id = $("#idToCancel").val();
// 			var label = $("#labelToCancel").val();
// 			console.log(id, label);
			
// 			var itemToCancel = {
// 					"id":id,
// 					"label":label,
// 			}
			
// 			$.ajax({
// 				type:"POST",
// 				url: "http://localhost:8080/repro.admin.web/DeleteQuestionServlet",
// 				data:itemToCancel,
// 				success:function(result){
// 					console.log(result);
// 					if(result == 'OK'){
// 			        	$('#deleteModal').modal('hide');
// 			        	location.reload();
// 					}else{
						
// 					}
// 				},
// 				dataType:"text"
// 			});
// 		}
		
		
		</script>
</head>
<body>
<%@include file="header.jsp"%>
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

				List<EntityInterface> lista = null;
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
					
			   
			   for (EntityInterface entity : lista) {
				   Questions item = (Questions)entity;
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
		 		    	<td><%= item.getFullAnswer()%></td>
	 		    	</tr>
	 		     
				</tbody>
				<%
				  }
				}
				%>
			</table>
			
<!-- 			<input type="submit" value="Cancella" id="deleteButton" disabled onclick="javascript:deleteUser()"/> -->
			<button type="button" class="btn btn-danger" id="deleteButton" disabled data-toggle="modal" data-target="#deleteModal">Cancella</button>
			<button type="button" class="btn btn-primary" id="modifyButton" disabled data-toggle="modal" data-target="#updateQuestionModal" onclick="showUpdateQuestionModal(); return false;">
			  MODIFICA
			</button>
			<!-- Modal DELETE-->
		<div class="modal" id=deleteModal tabindex="-1" role="dialog">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title">Eliminazione question</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        <p>Sei sicuro di volre rimuovere questa Question?</p>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-primary" onclick="javascript:deleteQuestion();">SI</button>
		        <button type="button" class="btn btn-primary" data-dismiss="modal">NO</button>
		      </div>
		    </div>
		  </div>
		</div>
	
			</form>
		<a href="insertQuestion.jsp">
			<button type="button" class="btn btn-info" id="insertButton" >Inserisci question</button>
		</a>
			
		<!-- Modal UPDATE-->
		<div class="modal fade" id="updateQuestionModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <form action="./UpdateQuestionServlet" method="post">
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
			        <button type="button" class="btn btn-primary" onClick="update();">Save changes</button>
			      </div>
		      </form> 
		    </div>
		  </div>
		</div>
	
	
	
	
	
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.0/jquery.min.js" integrity="sha256-xNzN2a4ltkB44Mc/Jz3pT4iU1cmeR0FkXs4pru/JxaQ=" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
	

</body>
</html>
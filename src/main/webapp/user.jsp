<%@page import="centauri.academy.proxima.cerepro.entity.User"%>
<%@page import="centauri.academy.proxima.cerepro.entity.EntityInterface"%>
<%@page import="proxima.informatica.academy.seventh.service.UserService"%>
<%@page import="java.util.List"%>
<%@page import="java.nio.file.attribute.UserPrincipalLookupService"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<%@include file="authentication.jsp"%>

<head>

<script type="text/javascript">
	
	function initializeData () {
		console.log("initializeData - START");
		document.getElementById("tableData").innerHTML = "<img src='./img/loader/loading.gif' />" ;
		
		const xhttp = new XMLHttpRequest();
	    xhttp.onload = function() {
		  console.log(this.responseText);
		  var items = JSON.parse(this.responseText) ;
		  console.log(items);
		  initializeTable (items);
	    }
	    xhttp.open("GET", "http://localhost:8080/repro.admin.web/GetAllUsersServlet", true);
	    xhttp.send();
	}
	
	function initializeTable (items) {
		if (items != null) {
			
			var dynamicTableContent  = "<table class='table table-striped table-hover  table-bordered'>";
			dynamicTableContent += "<thead class='thead-dark'><tr>";
			dynamicTableContent += "<th scope='col'></th>" ;
			dynamicTableContent += "<th scope='col'>Id</th>" ;
			dynamicTableContent += "<th scope='col'>Email</th>" ;
			dynamicTableContent += "<th scope='col'>Password</th>" ;
			dynamicTableContent += "<th scope='col'>First Name</th>" ;
			dynamicTableContent += "<th scope='col'>Last Name</th>" ;
			dynamicTableContent += "<th scope='col'>Date of Birth</th>" ;
			dynamicTableContent += "<th scope='col'>Registration Date</th>" ;
			dynamicTableContent += "<th scope='col'>Role</th>" ;
			dynamicTableContent += "<th scope='col'>ImgPath</th>" ;
			dynamicTableContent += "<th scope='col'>Note</th>" ;
			dynamicTableContent += "<th scope='col'>Enabled</th>" ;
			dynamicTableContent += "</tr></thead>" ;
			if (items.length==0) {
				dynamicTableContent += "<tr><td colspan='5'>NON CI SONO USERS</td></tr>" ;
			} else {
				for (var i=0; i<items.length; i++) {
					dynamicTableContent += "<tr><td scope='col'><input type='radio' name='id' onclick='javascript:abilitaBottone();' value='" + items[i].id + "' /></td>" ;
					dynamicTableContent += "<td>" + items[i].id + "</td>" ;
					dynamicTableContent += "<td>" + items[i].email + "</td>" ;
					dynamicTableContent += "<td>" + items[i].password + "</td>" ;
					dynamicTableContent += "<td>" + items[i].firstname + "</td>" ;
					dynamicTableContent += "<td>" + items[i].lastname + "</td>" ;
					dynamicTableContent += "<td>" + items[i].dateofbirth + "</td>" ;
					dynamicTableContent += "<td>" + items[i].regdate + "</td>" ;
					dynamicTableContent += "<td>" + items[i].role + "</td>" ;
					dynamicTableContent += "<td>" + items[i].imgpath + "</td>" ;
					dynamicTableContent += "<td>" + items[i].note + "</td>" ;
					dynamicTableContent += "<td>" + items[i].enabled + "</td></tr>" ;

				}
			}
			dynamicTableContent += "</table>" ;
			document.getElementById("tableData").innerHTML = dynamicTableContent ;
		} else {
			document.getElementById("tableData").innerHTML = "ERRORE LATO SERVER. AL MOMENTO NON E' POSSIBILE AVERE LA LISTA DEGLI USER. RIPROVARE PIU? TARDI.";
		}
	}

	function abilitaBottone() {
		console.log("questa è la console");
 		document.getElementById("buttonDelete").disabled = false;
 		document.getElementById("buttonUpdate").disabled = false;
	}
	
	function deleteUser(){
		console.log("delete");
		document.getElementById("formSelectUser").method = "POST";
		document.getElementById("formSelectUser").action = "./DeleteUserServlet";
		document.getElementById("formSelectUser").submit();
 		initializeData ();
	}
	
</script>
<meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>List Users</title>

<link rel="icon" type="image/ico" href="./img/Logo-Centauri-Academy-2018.ico">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<link rel="stylesheet" href="css/style.css">

</head>
<body>
	<%@include file="header.jsp"%>
<div class="container-fluid">
<h1>User List</h1>		
		<div id="tableData">
		</div>
		<button type="button" class="btn btn-danger" id=buttonDelete disabled data-toggle="modal" data-target="#deleteUserModal">Cancella</button>
		<input class="btn btn-primary" type="submit" class="button"	id="buttonUpdate" value="Update" disabled onclick="javascript:updateUser();">
	<!-- Modal DELETE-->
		<div class="modal fade" id="deleteUserModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title">Eliminazione User</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        <p>Sei sicuro di volre rimuovere questo user?</p>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-primary" onclick="javascript:deleteUser();">SI</button>
		        <button type="button" class="btn btn-primary" data-dismiss="modal">NO</button>
		      </div>
		    </div>
		  </div>
		</div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>

</body>
</html>
<script>
    initializeData();
</script>
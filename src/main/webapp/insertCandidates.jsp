<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<%-- <%@include file="authentication.jsp"%> --%>

<head>
<meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Insert Candidates</title>
<link rel="icon" type="image/ico" href="./img/Logo-Centauri-Academy-2018.ico">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

</head>
<body>
<%@include file="header.jsp" %>

	<form action="./InsertCandidatesServlet" method="post">
  		
  		<label>User ID</label><br>
  		<input type="number" name="user_id"><br>
  		
  		<label>Course Code</label><br>
  		<input type="text" name="course_code"><br>
  		
  		<label>Candidacy Date Time</label><br>
  		<input type="number" name="candidacy_state_time"><br>
	
  		<label>First Name</label><br>
  		<input type="text" name="firstname"><br>
  		
  		<label>Last Name</label><br>
  		<input type="text" name="lastname"><br>
  		
  		<label>Email</label><br>
  		<input type="text" name="email"><br>
  		
  		<label>Registration Date</label><br>
  		<input type="number" name="regdate"><br>
	
  		<label>Inserted By</label><br>
  		<input type="number" name="inserted_by"><br>
  		
  		<label>Candidate State Code</label><br>
  		<input type="number" name="candidate_state_code"><br>
  		
		<input class="btn btn-primary" type="submit" id="button" value="Insert">
  		
	</form> 
	
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
	
</body>
</html>
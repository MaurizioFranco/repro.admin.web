<%@page import="proxima.informatica.academy.seventh.candidates.service.CandidatesService"%>
<%@page import="proxima.informatica.academy.dto.CandidatesDto"%>
<%@page import="proxima.informatica.academy.DatabaseManagerSingleton"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<%-- <%@include file="authentication.jsp"%> --%>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

<head>
<meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Update Candidates</title>
</head>
<body>
<%@include file="header.jsp" %>

<% CandidatesDto candidates = CandidatesService.getInstance().selectCandidatesById(Integer.parseInt(request.getParameter("id"))); %>
	<form action="UpdateSurveyServlet" method="post">
		
	  	<label>ID</label><br>
  		<input type="number" name="id" value="<%= candidates.getId() %>"><br>
  		
  		<label>User ID</label><br>
  		<input type="text" name="label" value="<%= candidates.getUser_id() %>"><br>
  		
  		<label>Course Code</label><br>
  		<input type="text" name="description" value="<%= candidates.getCourse_code() %>"><br>
	
  		<label>Candidacy Date Time</label><br>
  		<input type="number" name="level" value="<%= candidates.getCandidacy_date_time() %>"><br>
  		
  		<label>First Name</label><br>
  		<input type="text" name="label" value="<%= candidates.getFirstname() %>"><br>
  		
  		<label>Last Name</label><br>
  		<input type="text" name="description" value="<%= candidates.getLastname() %>"><br>
	
  		<label>Email</label><br>
  		<input type="number" name="level" value="<%= candidates.getEmail() %>"><br>
  		
  		<label>Registration Date</label><br>
  		<input type="text" name="label" value="<%= candidates.getRegdate() %>"><br>
  		
  		<label>Inserted By</label><br>
  		<input type="text" name="description" value="<%= candidates.getInserted_by() %>"><br>
	
  		<label>Candidate State Code</label><br>
  		<input type="number" name="level" value="<%= candidates.getCandidate_state_code() %>"><br>
  		
		<input class="btn btn-primary" type="submit" id="button" value="Update">
  		
	</form> 
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>

</body>
</html>
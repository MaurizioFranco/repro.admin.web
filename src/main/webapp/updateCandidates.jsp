<%@page import="proxima.informatica.academy.seventh.service.CandidatesService"%>
<%@page import="centauri.academy.proxima.cerepro.entity.Candidates"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>

<head>
<meta charset="ISO-8859-1">
<title>Update Candidates</title>
<link rel="icon" type="image/ico" href="./img/Logo-Centauri-Academy-2018.ico">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
</head>
<body>
	<%@include file="./header.jsp"%>


	<%int id = Integer.parseInt(request.getParameter("selectedCandidatesId"));%>
	<%Candidates candidates = CandidatesService.getInstance().selectById(id);%>
	
	<form method="post" action=./UpdateCandidatesServlet>
	
	<label>ID</label><br>
	<input type=text id="id" placeholder="Id" name="id_input" value="<%=candidates.getId()%>" readonly="readonly"><br>
	<label>User ID</label><br>
	<input type=text id="user_id" placeholder="User_id" name="user_id_input" value="<%=candidates.getUser_id()%>" readonly="readonly"><br>
	<label>Course Code</label><br>
	<input type=text id="course_code" placeholder="Course_code" name="course_code_input" value="<%=candidates.getCourse_code()%>" readonly="readonly"><br>
	<label>Candidacy Date Time</label><br>
	<input type=datetime-local id="candidacy_date_time" placeholder="Candidacy_date_time" name="candidacy_date_time_input" value="<%=candidates.getCandidacy_date_time()%>" readonly="readonly"><br>
	<label>First Name</label><br>
	<input type=text id="firstname" placeholder="Firstname" name="firstname_input" value="<%=candidates.getFirstname()%>" readonly="readonly"><br>
	<label>Lastname</label><br>
	<input type=text id="lastname" placeholder="Lastname" name="lastname_input" value="<%=candidates.getLastname()%>"><br>
	<label>E-mail</label><br>
	<input type=text id="email" placeholder="Email" name="email_input" value="<%=candidates.getEmail()%>"><br>
	<label>Regdate</label><br>
	<input type=datetime-local id="regdate" placeholder="Regdate" name="regdate_input" value="<%=candidates.getRegdate()%>"><br>
	<label>Inserted By</label><br>
	<input type=text id="inserted_by" placeholder="Inserted_by" name="inserted_by_input" value="<%=candidates.getInserted_by()%>"><br>
	<label>Candidate State Code</label><br>
	<input type=text id="candidate_state_code" placeholder="Candidate_state_code" name="candidate_state_code_input" value="<%=candidates.getCandidate_state_code()%>"><br>
	
	<label>Enabled</label><br>

	<input class="btn btn-primary" type="submit" id="button" value="Update">
	</form>


<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
</body>
</html>
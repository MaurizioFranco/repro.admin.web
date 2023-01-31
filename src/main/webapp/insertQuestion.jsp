<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">


<title>Insert question</title>
</head>
<body>

		<form action="./InsertQuestionServlet" method="POST">
			<div class="form-group">
				<label for="label">Label:</label>
				<input type="text" name="label"><br>
			</div>
			 <div class="form-group">
				  <label for="description">Description:</label>
				  <input type="text" name="description" ><br>
			</div>	  
				  <label for="ansa">Answer A:</label>
				  <input type="text" name="ansa" ><br>
			 <div class="form-group">	  
				  <label for="ansb">Answer B:</label>
				  <input type="text" name="ansb" ><br>
			 </div>	 
			 <div class="form-group">	  
				  <label for="ansc">Answer C:</label>
				  <input type="text" name="ansc" ><br>
			 </div>
			 <div class="form-group">	  
				  <label for="ansd">Answer D:</label>
				  <input type="text" name="ansd" ><br>
			 </div>
			 <div class="form-group">	  
				  <label for="anse">Answer E:</label>
				  <input type="text" name="anse" ><br>
			 </div>
			 <div class="form-group">	  
				  <label for="ansf">Answer F:</label>
				  <input type="text" name="ansf" ><br>
			 </div>
			 <div class="form-group">	  
				  <label for="ansg">Answer G:</label>
				  <input type="text" name="ansg" ><br>
			 </div>
			 <div class="form-group">	  
				  <label for="ansh">Answer H:</label>
				  <input type="text" name="ansh" ><br>
			 </div>	  
			 
			 <input id="button" class="btn btn-primary" type="submit"
				value="Insert now">
		</form>




		<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="./UploadServlet" enctype="multipart/form-data" method="post">
  <input type="file" name="fileToUpload" ><br>
  <input type="submit" value="Submit">
</form>
</body>
</html>
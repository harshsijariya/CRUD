<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>     <jsp:include page="index.html"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<title>SignUp</title>
<script>
function validateForm() {
  var x = document.forms["myform"]["name"].value;
  if (x == "") {
    alert("Name must be filled out");
    return false;
  }
  var y = document.forms["myform"]["pws"].value;
  if (y.length<4) {
	    alert("Password length must be at least four ");
	    return false;
	  }
  var z = document.forms["myform"]["cpws"].value;
  if(y==z){  
	  return true;  
	  }  
	  else{  
	  alert("Confirm password must be same!");  
	  return false;  
	  }  
  
  var x=document.myform.email.value;  
  var atposition=x.indexOf("@");  
  var dotposition=x.lastIndexOf(".");  
  if (atposition<1 || dotposition<atposition+2 || dotposition+2>=x.length){  
    alert("Please enter a valid e-mail address \n atpostion:"+atposition+"\n dotposition:"+dotposition);  
    return false;  
    }  
}
</script>





</head>
<body>
<div class="container">
<h2>SignUp</h2>
<form method="post" action="dbaccess.jsp" name="myform" onsubmit="return validateForm()">

<div class="form-group">
<label for="name">Full Name</label>
<input type="text" name="name"class="form-control" placeholder="Enter Your Name" id="name">
</div>
<div class="form-group">
<label for="email">Email</label>
<input type="email" name="email" class="form-control"placeholder="Enter Your Email" id="email">
</div>
<div class="form-group">
<label for="mobile">Mobile Number</label>
<input type="text" name="mobile" class="form-control" placeholder="Mobile Number" id="mobile">
</div>
<div class="form-group">
<label for="pws">Create Password</label>
<input type="password" name="pws" placeholder="Enter Password" class="form-control" id="pws">
</div>
<div class="form-group">
<label for="cpws">Confirm Password</label>
<input type="password" name="cpws" placeholder="Confirm Password"class="form-control" id="cpws">
</div>

<button type=submit class="btn btn-success">Submit</button>

</div>

</form>


</div>
</body>
</html>
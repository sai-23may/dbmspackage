<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>ForgotPassword</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
     <form action="forgetPasswordAction.jsp" method ="post">
     <input type="email" name="email" placeholder="Enter Email" required>
     <input type="number"name="number" placeholder="Enter Mobile number" required>
    <select name="Sequrityquestion">
    <option value="what was your first car">what was your first car</option>
    <option value="what was your first school name">what was your school name</option>
    </select>
    <input type="text" name="answer" placeholder="Enter Answer" required>
    <input type="password" name="newPassword" placeholder="Enter New Password to set" required>
    <input type="submit" value=" Save">
     </form>
      <h2><a href="login.jsp">Login</a></h2>
  </div>
  <div class='whyforgotPassword'>
<%
String msg=request.getParameter("msg");
if("done".equals(msg)){
	%>
	<h1>Password Changed Successfully!</h1>
<%}%> 
<%
if("invalid".equals(msg)){
	%>
	<h1>Some thing Went Wrong! Try Again !</h1>
<%}%>  




    <h2>Online Shopping</h2>
    <p>The Online Shopping System is the application that allows the users to shop online without going to the shops to buy them.</p>
  </div>
</div>
</body>
</html>
 <%@page import="project.ConectionProvider"%>
<%@page import="java.sql.*"%>
<%
String email=session.getAttribute("email").toString();
String address=request.getParameter("address");
String city=request.getParameter("city");
String state=request.getParameter("state");
String country=request.getParameter("country");
String mobilenumber=request.getParameter("mobilenumber");
String payementMethod=request.getParameter("paymentMethod");
String transactionId=request.getParameter("transactionId");
String status="bill";

try{
	Connection con=ConectionProvider.getCon();
	PreparedStatement ps=con.prepareStatement("update users set address=?,city=?,state=?,country=?,mobileNumber=? where email=?");
	ps.setString(1,address);
	ps.setString(2,city);
	ps.setString(3,state);
	ps.setString(4,country);
	ps.setString(5,mobilenumber);
	ps.setString(6,email);
	ps.executeUpdate();
	
	PreparedStatement ps1=con.prepareStatement("update cart set adress=?,city=?,state=?,country=?,mobileNumber=?,orderDate=now(),deliveryDate=DATE_ADD(orderDate,INTERVAL 7 DAY),payementMethod=? , transactionId=?,status=? where email=? and adress is NULL");
	ps1.setString(1,address);
	ps1.setString(2,city);
	ps1.setString(3,state);
	ps1.setString(4,country);
	ps1.setString(5,mobilenumber);
	ps1.setString(6,payementMethod);
	ps1.setString(7,transactionId);
	ps1.setString(8,status);
	ps1.setString(9,email);
	ps1.executeUpdate();
	System.out.println(email);
	response.sendRedirect("bill.jsp");
}
catch(Exception e){
	e.printStackTrace();
}
%>
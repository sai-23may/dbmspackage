<%@page import="project.ConectionProvider"%>
<%@page import="java.sql.*"%>
<%
String id=request.getParameter("id");
String email=request.getParameter("email");
String status="Cancel";
try{
	Connection con=ConectionProvider.getCon();
	Statement st=con.createStatement();
	st.executeUpdate("update cart set status='"+status+"' where product_id='"+id+"' and email='"+email+"' and adress is not NULL");
	response.sendRedirect("ordersReceived.jsp?msg=cancel");
}
catch(Exception e){
	response.sendRedirect("ordersReceived.jsp?msg=wrong");
	e.printStackTrace();
}
%>
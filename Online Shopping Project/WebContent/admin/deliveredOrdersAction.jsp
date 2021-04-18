<%@page import="project.ConectionProvider"%>
<%@page import="java.sql.*"%>
<%
String id=request.getParameter("id");
String email=request.getParameter("email");
String status="Delivered";
try{
	Connection con=ConectionProvider.getCon();
	Statement st=con.createStatement();
	st.executeUpdate("update cart setstatus='"+status+"' where product_id='"+id+"' and email='"+email+"' and adress is not NULL");
	response.sendRedirect("ordersReceived.jsp?msg=delivered");
}
catch(Exception e){
	response.sendRedirect("ordersReceived.jsp?msg=wrong");
	e.printStackTrace();
}
%>
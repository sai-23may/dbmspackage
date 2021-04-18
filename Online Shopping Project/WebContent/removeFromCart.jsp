 <%@page import="project.ConectionProvider"%>
<%@page import="java.sql.*"%>
<%
String email=session.getAttribute("email").toString();
String id=request.getParameter("id");
try
{
	Connection con=ConectionProvider.getCon();
	Statement st=con.createStatement();
	st.executeUpdate("delete from cart where email='"+email+"' and product_id='"+id+"' and adress is NULL");
	response.sendRedirect("myCart.jsp?msg=removed");
}
catch(Exception e){
	e.printStackTrace();
}
%>
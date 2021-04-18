<%@page import="project.ConectionProvider"%>
<%@page import="java.sql.*"%>
<%
String id=request.getParameter("id");
String name=request.getParameter("name");
String Catagory=request.getParameter("Catagory");
String Price=request.getParameter("Price");
String active=request.getParameter("active");

try{
	Connection con=ConectionProvider.getCon();
	Statement st=con.createStatement();
	st.executeUpdate("update product set name='"+name+"',catagory='"+Catagory+"',price='"+Price+"',active='"+active+"' where id='"+id+"'");
	if(active.equals("No")){
		st.executeUpdate("delete from cart where product_id='"+id+"' and address is NULL");
	}
	response.sendRedirect("allProductEditProduct.jsp?msg=done");
}
catch(Exception e)
{
	System.out.println(e);
	response.sendRedirect("allProductEditProduct.jsp?msg=wrong");
}
%>
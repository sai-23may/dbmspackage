<%@page import="project.ConectionProvider"%>
<%@page import="java.sql.*"%>
<%
String id=request.getParameter("id");
String name=request.getParameter("name");
String Category=request.getParameter("Category");
String Price=request.getParameter("Price");
String Active=request.getParameter("active");

try
{
	Connection con=ConectionProvider.getCon();
	System.out.println(id+name+Category+Price+Active);
	PreparedStatement ps=con.prepareStatement("insert into product values(?,?,?,?,?)");
	ps.setString(1,id);
	ps.setString(2,name);
	ps.setString(3,Category);
	ps.setString(4,Price);
	ps.setString(5,Active);
	ps.executeUpdate();
	response.sendRedirect("addNewProduct.jsp?msg=done");
}
catch(Exception e)
{
	response.sendRedirect("addNewProduct.jsp?msg=wrong");

}
%>
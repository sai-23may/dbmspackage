 <%@page import="project.ConectionProvider"%>
<%@page import="java.sql.*"%>
<%
String email=session.getAttribute("email").toString();
String id=request.getParameter("id");
String incdec=request.getParameter("quantity");
int price=0;
int total=0;
int quantity=0;
int final_total=0;
try
{
	Connection con=ConectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs1=st.executeQuery("select *from cart where email='"+email+"' and product_id='"+id+"' and adress is NULL");
	while(rs1.next())
	{
		price=rs1.getInt(4);
		total=rs1.getInt(5);
		quantity=rs1.getInt(3);
		
	}
	if(quantity==1 && incdec.equals("dec")){
		response.sendRedirect("myCart.jsp?msg=notPossible");
		}
	else if(quantity!=1 && incdec.equals("dec")){
		total=total-price;
		quantity=quantity-1;
		st.executeUpdate("update cart set total='"+total+"',quantity='"+quantity+"' where email='"+email+"' and product_id='"+id+"' and adress is NULL");
		response.sendRedirect("myCart.jsp?msg=dec");

	}
	else{
		total=total+price;
		quantity=quantity+1;
		st.executeUpdate("update cart set total='"+total+"',quantity='"+quantity+"' where email='"+email+"' and product_id='"+id+"' and adress is NULL");
		response.sendRedirect("myCart.jsp?msg=inc");
	}
}
catch(Exception e){
	e.printStackTrace();
}
%>
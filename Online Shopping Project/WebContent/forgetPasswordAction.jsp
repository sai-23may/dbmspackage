<%@page import="project.ConectionProvider"%>
<%@page import="java.sql.*"%>
<%
String email=request.getParameter("email");
String number=request.getParameter("number");
String newPassword=request.getParameter("newPassword");
String SequrityQuestion=request.getParameter("Sequrityquestion");
String answer=request.getParameter("answer");

int check=0;
try
{
	Connection con=ConectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from users where email='"+email+"' and mobileNumber ='"+number+"' and SecurityQuestion ='"+SequrityQuestion+"' and answer='" +answer+"'");
	while(rs.next())
	{
		check=1;	
		st.executeUpdate("update users set password='"+newPassword+"' where email='"+email+"'");
		response.sendRedirect("forgotPassword.jsp?msg=done");
	}
	if(check==0)
	{
		response.sendRedirect("forgotPassword.jsp?msg=invalid");
	}
}
catch(Exception e){
	System.out.println(e);
}
%>
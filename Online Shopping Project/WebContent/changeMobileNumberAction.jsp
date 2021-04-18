<%@page import="project.ConectionProvider"%>
<%@page import="java.sql.*"%>
<%
String email=session.getAttribute("email").toString();
String newMobileNumber=request.getParameter("newMobileNumber");
String password=request.getParameter("password");
int check=0;
try{
	Connection con=ConectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from users where email= '"+email+"' and password='"+password+"'");
	while(rs.next())
	{
		check=1;
		st.executeUpdate("update users set mobileNumber='"+newMobileNumber+"' where email='"+email+"'");
		response.sendRedirect("changePassword.jsp?msg=done");
	}
	if(check==0)
		response.sendRedirect("changePassword.jsp?msg=wrong");
}
catch(Exception e){
	e.printStackTrace();
	
}

%>
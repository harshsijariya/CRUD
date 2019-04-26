<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head><%String name=request.getParameter("email");
String pass=request.getParameter("pwd");
String sql="select * from Users where email='"+name+"' and password='"+pass+"'";
 %>
<body>
<%
  try {
    java.sql.Connection con;
    Class.forName("oracle.jdbc.driver.OracleDriver");
    con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hr", "harsh");
   // out.println ( "database successfully opened.");
    Statement stmt = con.createStatement();
    
    
   // sql = "SELECT * from PROFILE where contest='"+s8+"' order by marks desc";
    ResultSet rs = stmt.executeQuery(sql);%>
        
    
    <% 
  if(rs.next()){ session.setAttribute("name1",name) ; this.getServletContext().getRequestDispatcher("/success.jsp").include(request, response);
  }
   

  else{ this.getServletContext().getRequestDispatcher("/error.jsp").include(request, response);
  }

%>
 

<%
con.close();
} catch (Exception e) {
e.printStackTrace();
}%>

</body>
</html>
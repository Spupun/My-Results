<%-- 
    Document   : adminLoginAction
    Created on : 31 Oct, 2022, 11:39:17 AM
    Author     : MOHAN SUBUDHI
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*" %>
<%
    try{
        String username = request.getParameter("username");   
        String password = request.getParameter("password");
        Class.forName("com.mysql.jdbc.Driver");  
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project1?useSSL=false","root","12345");    
        PreparedStatement pst = conn.prepareStatement("Select username,password from login where username=? and password=?");
        pst.setString(1, username);
        pst.setString(2, password);
        ResultSet rs = pst.executeQuery();                        
        if(rs.next())                  
            response.sendRedirect("adminHome.jsp");
        else          
            response.sendRedirect("errorAdminLogin.html");
   }
   catch(Exception e){       
   }      
%>

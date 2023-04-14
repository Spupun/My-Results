
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
        String username=request.getParameter("name");
        String regd=request.getParameter("regd");
        String email=request.getParameter("email");
        String contact=request.getParameter("ph");
        String password=request.getParameter("password");
        int sts=0;
         if(username.isEmpty()&&password.isEmpty())
            out.println("id and password shouldnot be empty");
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project1?useSSL=false", "root", "12345");
            PreparedStatement pst = conn.prepareStatement("insert into stulogin(name,regd,email,contact,password)values(?,?,?,?,?)");
            pst.setString(1, username);
            pst.setString(2, regd);
            pst.setString(3, email);
            pst.setString(4, contact);
            pst.setString(5, password);
           
             sts = pst.executeUpdate();
             
            if (sts>0) {

                response.sendRedirect("stulogin.html");
            } 

        } 
        catch (Exception e) {
        out.println("Something went wrong !! Please try again"+e);
        }
        %>
    </body>
</html>

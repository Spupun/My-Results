<%-- 
    Document   : studentLogin
    Created on : 4 Nov, 2022, 11:47:23 PM
    Author     : MOHAN SUBUDHI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*" %>
<%
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        if(username.isEmpty()&&password.isEmpty())
            out.println("id and password should not be empty");
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project1?useSSL=false", "root", "12345");
            PreparedStatement pst = conn.prepareStatement("select email,password from stulogin where email=? and password=?");
            pst.setString(1, username);
            pst.setString(2, password);
           
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {              
                response.sendRedirect("cutmOneView.html");
            } 
            else {
                response.sendRedirect("errorstulogin.html");               
            }
        } 
        catch (Exception e) {
        }
    
            %>
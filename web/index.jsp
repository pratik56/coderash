<%-- 
    Document   : index
    Created on : Nov 25, 2017, 6:34:42 AM
    Author     : Rohit Surana
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
            if(request.getParameter("message") != null)
            {
        %>
                <h2><%= request.getParameter("message")%></h2>
        <%
            }
        %>
        <a href="adminsignup.jsp">Sign up</a>
        <a href="adminlogin.jsp">Sign in</a>
    </body>
</html>

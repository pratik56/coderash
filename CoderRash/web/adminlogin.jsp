<%@page import="royal.bean.Crbean"%>
<%@page import="javax.servlet.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        HttpSession Session = request.getSession(false);
        Crbean cr1 = (Crbean) Session.getAttribute("coderrashbean");
        if(cr1 != null)
        {
            Session.invalidate();
        }
        %>
        <form id="adminloginform" method="POST" action="adminlogin">
        Email:<input name="email" type="text" required ><br/>
        Password:<input name="password" type="password" required><br/>
        <button type="submit" >Log in</button>
    </form>
    </body>
</html>

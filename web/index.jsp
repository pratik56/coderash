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
        <title>Home</title>
        <link rel="stylesheet" type="text/css" href="stylesheets/style.css">
        <link rel="stylesheet" type="text/css" href="stylesheets/materialize.min.css">
    </head>
    <body>
        <div class="row">
            <h4><img src="icons/Logo.png"</h4>
        </div>
        <% 
            if(request.getParameter("message") != null)
            {
        %>
                <h2><%= request.getParameter("message")%></h2>
        <%
            }
        %>
        <div id="signupsignin" class="row">
                <div id = "button3">
                    <a id="next" class = "btn red" href="adminsignup.jsp">SignUp</a>
                </div>
            <div id="button4" style="position">
                    <a id="exit" class="btn red" href="adminlogin.jsp">SignIn</a>
                </div>
        </div>
        <br/>
        <br/>
        <div id="about">
            <div id="aboutheading">About Coderrash</div>
            <div id="aboutsection">There are many websites which allow competitive programming. But Coderrash is unique in a way that it allows players to view each 
others code to create pressure. Also admin can view code in a live mode and also after players have successfully submitted.</div>
            <br/>
            <div id="howitworks">How does it work?</div>
             <div id="how_it_works">Its simple - A host/company recruiter creates an account. After successful account creation he then creates an event
             where he provides the names of 2 competitors. After event creation a unique link is generated which is emailed to the competitiors.
             Competitors then can start coding through unique link by putting their name. 
             </div>
        <br/>
        <div id="team"> The coders who built coderrash</div><br/>
        <a role="button" class="btn red btn-default" href="https://www.linkedin.com/in/rohitssurana/">Rohit Surana</a>
        <a role="button" class="btn red btn-default" href="https://www.linkedin.com/in/pratik-thakkar-bba83464/">Pratik Thakker</a>
        <a role="button" class="btn red btn-default" href="https://www.linkedin.com/in/ashutosh-burde-47b60089/">Ashutosh Burde</a>
   </div>
        </body>
</html>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>coderrash</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link rel='stylesheet' href='stylesheets/style.css' />
    <link type="text/css" rel="stylesheet" href="stylesheets/materialize.min.css"  media="screen,projection"/>
</head>
<body>
     <%
            String serv_message = request.getParameter("message");
            if (serv_message == null) {
                serv_message = "";
            }
            
            String compete_path = request.getPathInfo();
            if(compete_path == null)
                compete_path = "";
     %>
<h2><i>Code Rash</i></h2>
<div class="row">
    <form action="${pageContext.request.contextPath}/crashcompete<%=compete_path%>" method="POST" class="col s12">
        <div class="row">
            <div class="input-field col s12">
                <input id="coder_name" name="coder_name" type="text" class="validate">
            </div>
        </div>
        <div id="submit">
        <button class="btn waves-effect waves-light" type="submit" name="action">Compete</button>
        </div>
    </form>
    <div><%=serv_message%></div>
</div>
</body>
</html>

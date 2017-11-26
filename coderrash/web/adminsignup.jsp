<%@page import="royal.bean.Crbean"%>
<%@page import="javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>AdminLogin</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="javascripts/ace.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript" src="../javascripts/materialize.min.js"></script>
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
<h2><i>Code Rash</i></h2>
<h3>Admin</h3>
<div class="row">
    <form id="signupform" action="adminsignup" method="POST" class="col s12">
        <div class="row">
            <div class="input-field col s6">
                <input name="first_name" id="first_name" type="text" class="validate">
                <label for="first_name">First Name</label>
            </div>
            <div class="input-field col s6">
                <input name="last_name" id="last_name" type="text" class="validate">
                <label for="last_name">Last Name</label>
            </div>
            <div class="input-field col s6">
                <input name="company_name" id="company_name" type="text" class="validate">
                <label for="company_name">Company Name</label>
            </div>
        </div>
        <div class="row">
            <div class="input-field col s12">
                <input name="password" id="password" type="password" class="validate">
                <label for="password">Password</label>
            </div>
        </div>
        <div class="row">
            <div class="input-field col s12">
                <input name="email" id="email" type="email" class="validate">
                <label for="email">Email</label>
            </div>
        </div>
        <div id="submit">
        <button class="btn waves-effect waves-light" type="submit" name="action">Submit</button>
        </div>
    </form>
</div>
</body>
</html>

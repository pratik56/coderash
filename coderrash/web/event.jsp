<%@page import="royal.bean.Crbean"%>
<%@page import="javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>CreateEvent</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="javascripts/ace.js" type="text/javascript" charset="utf-8"></script>
    <link rel='stylesheet' href='stylesheets/style.css' />
    <link type="text/css" rel="stylesheet" href="stylesheets/materialize.min.css" />
    <script type="text/javascript" src="javascripts/materialize.min.js"></script>
    <script type="text/javascript" src="javascripts/random.js"></script>
    <script type="text/javascript">
        function createevent()
        {
            document.getElementById("eventhash").value=rand();
            var x = document.getElementsByName('addevent');
            x.submit();
        }
    </script>
</head>
<body>
    <%
        HttpSession Session = request.getSession(false);
        Crbean cr1 = (Crbean) Session.getAttribute("coderrashbean");
        if(cr1 == null)
        {
            RequestDispatcher rd=request.getRequestDispatcher("index.jsp");  
            rd.forward(request, response);
        }
        %>
<h2><i>Code Rash</i></h2>
<h3>Admin</h3>
<div class="row">
    <form action="addevent" method="POST" name="addevent" id="addevent" class="col s12">
        <div class="row">
            <div class="input-field col s6">
                <input name="event_name" id="event_name" type="text" class="validate">
                <label for="event_name">Event Name</label>
            </div>
            <div class="input-field col s6">
                <label for="time">Time</label><br />
                <input name="time" id="Time" type="number" class="validate">
            </div>
        </div>
        <div class="row">
            <div class="input-field col s6">
                <input name="player1" id="player1" type="text" class="validate">
                <label for="player1">Player 1</label>
            </div>
            <div class="input-field col s6">
                <input name="player2" id="player2" type="text" class="validate">
                <label for="player2">Player 2</label>
            </div>
            <div>
             <label for="question1">Question 1</label>
                <input type="text" id="question1" name="question1" placeholder="">
             <label for="question2">Question 2</label>
                <input type="text" id="question1" name="question2" placeholder="">
             <label for="question3">Question 3</label>
                <input type="text" id="question3" name="question3" placeholder="">
            </div>
            <input id="eventhash" name="eventhash" type="hidden" value="">
        </div>
        <div id="submit">
            <button class="btn waves-effect waves-light" onclick="createevent()" name="action">Create Event</button>
        </div>
    </form>
</div>
</body>
</html>

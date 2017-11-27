<!DOCTYPE html>
<html>
<head>
    <title>Admin</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="javascripts/ace.js" type="text/javascript" charset="utf-8"></script>
    <script src="javascripts/setupadmin.js"></script>
    <link type="text/css" rel="stylesheet" href="stylesheets/materialize.min.css"  media="screen,projection"/>
    <link rel='stylesheet' href='stylesheets/style.css' />
<script>
    function getAce() {
        var editor = ace.edit("editor");
        editor.setTheme("ace/theme/monokai");
        editor.getSession().setMode("ace/mode/java");
        editor.setReadOnly(true);

        var editor2 = ace.edit("reflection");
        editor2.setTheme("ace/theme/monokai");
        editor2.getSession().setMode("ace/mode/java");
        editor2.setReadOnly(true);
    }
</script>

</head>
<body onload="getAce()">
<% 
    String message = null;
    message = request.getParameter("message");  
    if(message == null)
        message = "";
%>
<h5><%=message%> </h5>

<div class="row">
    <div class="col s12 m4 l2">
        <div id="button1" class="row">
            <a class="waves-effect waves-light btn" onclick="doContinuous()">Start</a>
        </div>
    </div>
    <div class="col s12 m4 l8">
        <h4><img src="icons/Logo.png"</h4>
        <h4><i>Admin</i></h4>
        <div id="clock"><h5><i>Timer:</i></h5></div>
    </div>
    <div class="col s12 m4 l2">
        <div id="button2" class="row">
            <a class="waves-effect waves-light btn">END</a>
        </div>
        <div id="button3" class="row">
            <a class="waves-effect waves-light btn">Exit</a>
        </div>
    </div>
</div>
<div id="mainPane" class="row">
    <div id="left" class="col s12 m4 l12">
        <h6>You</h6>
        <div>
            <div id="editor"></div>
        </div>
    </div>
    <div id="right" class="col s12 m4 l12">
        <h6>Opponent</h6>
        <div>
            <div id="reflection"></div>
        </div>
    </div>
</div>
<div id="bottom" class= "row">
    <div class="col s12 m6 l12">
        Answers 1:   <input type="text"  />
        Answers 2:   <input type="text"  />
        Answers 3:   <input type="text"  />
    </div>
</div>
</body>
</html>

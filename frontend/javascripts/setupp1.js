function doSomething(){

    var editor = ace.edit("editor");
    var editor2 = ace.edit("reflection");
    var code = editor.getValue();
    var sendcode = {xyz: code};

    $.ajax({
        type: 'POST',
        url: 'http://localhost:3000/player1/ajaxcall',
        data: sendcode

    })
        .done(function(data){
            var actualcode = data.xyz;
            console.log('GET response: ', JSON.stringify(actualcode));
            editor2.setValue(JSON.stringify(actualcode));
        })
        .fail(function(jqXHR, textStatus, err){
            conosle.log('AJAX error response: ', textStatus);
        })
}
function doContinuous(){
    setInterval(doSomething, 1000);
}
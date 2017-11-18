function doSomething(){

    var editor = ace.edit("editor");
    var editor2 = ace.edit("reflection");
    var code = editor.getValue();
    var sendcode = {xyz: code};

    $.ajax({
        type: 'POST',
        url: 'http://localhost:3000/player2/ajaxcall',
        data: sendcode

    })
        .done(function(data){
            var actualcode = data.xyz;
            console.log('POST response: ', JSON.stringify(actualcode));
            var noquote = JSON.stringify(actualcode, "", 2);
            var final = noquote.replace(/\"/g, "");
            editor2.setValue(final);
            editor2.find('\\n');
            editor2.replaceAll('\n');
        })
        .fail(function(jqXHR, textStatus, err){
            conosle.log('AJAX error response: ', textStatus);
        })
}
function doContinuous(){
    setInterval(doSomething, 1000);
}
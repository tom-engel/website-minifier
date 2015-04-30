function removeLineBreaks(text) {
    text = text.replace(/(\r\n|\n|\r)/gm," ");
    text = text.replace(/\s+/g," ");
    return text;
}

function grolb() {
    var text = document.getElementById('textinput').value;
    document.getElementById('textoutput').value = this.removeLineBreaks(text);
    return;
}

document.getElementById("btnDoIt").onclick = grolb();
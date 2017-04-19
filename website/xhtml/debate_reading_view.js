window.addEventListener('DOMContentLoaded', init, false);

function init(){
var buttons = document.getElementsByName('button')
var button = buttons[0]
button.addEventListener('click', show_hide, false);
}

function show_hide(){
    console.log('success!')
}
window.addEventListener('DOMContentLoaded', init, false);

function init() {
    var buttons = document.getElementsByTagName('button');
    var button = buttons[0];
    button.addEventListener('click', show_hide, false);
}

function show_hide() {
    var participants = document.getElementsByClassName('containerMeta');
    if (participants[0].style.display == 'flex') {
        participants[0].style.display = 'none';
    } else {
        participants[0].style.display = 'flex';
    }
}
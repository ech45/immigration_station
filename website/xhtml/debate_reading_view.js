window.addEventListener('DOMContentLoaded', init, false);

function init() {
    var buttons = document.getElementsByTagName('button');
    var button = buttons[0];
    button.addEventListener('click', show_hide, false);
    var radios = document.querySelectorAll('input[type="radio"]');
    for (var i = 0, length = radios.length; i < length; i++) {
        radios[i].addEventListener('change', radio_toggle, false);
    }
}

function show_hide() {
    var participants = document.getElementsByClassName('containerMeta');
    if (participants[0].style.display == 'flex') {
        participants[0].style.display = 'none';
    } else {
        participants[0].style.display = 'flex';
    }
}
function radio_toggle() {
    var non_immigrantion = document.getElementsByClassName('other');
    console.log(this.value);
}
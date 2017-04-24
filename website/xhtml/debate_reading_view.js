window.addEventListener('DOMContentLoaded', init, false);

function init() {
    var buttons = document.getElementsByTagName('button');
    var button = buttons[0];
    button.addEventListener('click', show_hide, false);
    var radios = document.querySelectorAll('input[type="radio"]');
    for (var i = 0, length = radios.length; i < length; i++) {
        radios[i].addEventListener('change', radio_toggle, false);
    }
    var keyword_checkboxes = document.querySelectorAll('input[type="checkbox"]');
    console.log('in init'):
    console.log(keyword_checkboxes);
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
    var non_immigration = document.getElementsByClassName('other');
    var value = this.value;
    for (var i = 0, length = non_immigration.length; i < length; i++) {
        if (value == 'imm') {
            non_immigration[i].style.display = 'none';
        } else {
            non_immigration[i].style.display = 'block';
        }
    }
}
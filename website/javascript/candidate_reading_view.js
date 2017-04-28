window.addEventListener('DOMContentLoaded', init, false);

function init() {
    var buttons = document.getElementsByTagName('button');
    var button = buttons[0];
    button.addEventListener('click', show_hide, false);
    var radios = document.querySelectorAll('input[type="radio"]');
    for (var i = 0, length = radios.length; i < length; i++) {
        radios[i].addEventListener('change', radio_toggle, false);
    }
    var checkboxes = document.querySelectorAll('input[type="checkbox"]');
    for (var i = 0, length = checkboxes.length; i < length; i++) {
        checkboxes[i].addEventListener('change', checkbox_toggle, false);
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
function checkbox_toggle() {
    var spans = document.getElementsByClassName(this.value);
    if (this.name == 'keyword') {
        for (var i = 0, length = spans.length; i < length; i++) {
            if (this.checked == true) {
                spans[i].style.backgroundColor = 'yellow';
                spans[i].style.color = 'black';
            } else {
                spans[i].style.backgroundColor = 'rgba(153, 24, 23, .70)';
                spans[i].style.color = 'white';
            }
        }
    } else {
        for (var i = 0, length = spans.length; i < length; i++) {
            if (this.checked == true) {
                spans[i].style.backgroundColor = 'pink';
                spans[i].style.color = 'black';
            } else {
                spans[i].style.backgroundColor = 'rgba(153, 24, 23, .70)';
                spans[i].style.color = 'white';
            }
        }
    }
}
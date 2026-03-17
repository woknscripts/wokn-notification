const container = document.getElementById('notification-container');

const icons  = { success: '✓', error: '✕', info: '?' };
const labels = { success: 'Success', error: 'Error', info: 'Info' };

const validPositions = [
    'top', 'top-right', 'top-left',
    'middle', 'middle-right', 'middle-left',
    'bottom', 'bottom-right', 'bottom-left'
];

function setPosition(position) {
    container.className = validPositions.includes(position) ? position : 'top-right';
}

function notify(type, message) {
    const t = (type && icons[type]) ? type : 'info';
    const el = document.createElement('div');
    el.className = 'notif ' + t;
    el.innerHTML =
        '<div class="notif-icon">' + icons[t] + '</div>' +
        '<div class="notif-text">' +
            '<span class="notif-type">' + labels[t] + '</span>' +
            '<span class="notif-message">' + message + '</span>' +
        '</div>' +
        '<div class="notif-progress"><div class="notif-progress-bar"></div></div>';

    container.appendChild(el);

    setTimeout(function() { el.classList.add('hide'); }, 4650);
    setTimeout(function() { if (el.parentNode) el.parentNode.removeChild(el); }, 5050);
}

window.addEventListener('message', function(e) {
    if (e.data.action === 'setPosition') {
        setPosition(e.data.position);
    } else if (e.data.action === 'notify') {
        notify(e.data.type, e.data.message);
    }
});

class Notification {
  constructor(title, content, duration, icon, color, sound) {
    this.title = title;
    this.content = content;
    this.duration = duration;
    this.icon = icon;
    this.color = color;
    this.sound = sound
  }

  show() {
    showNotification(this.title, this.content, this.duration, this.icon, this.color, this.sound)
  }
}

function generateRandom() {
    let min = 0
    let max = 42069
    let difference = max - min;
    let rand = Math.random();
    rand = Math.floor( rand * difference);
    rand = rand + min;
    return rand;
}

function showNotification(title , content, duration, icon, color, sound) {
        const mainDiv = document.getElementById("main");
        const randomID = generateRandom().toString()
        const notificationID = 'notification-'+randomID

        const notificationBody = document.createElement('div')
        notificationBody.className = 'notificationBody';
        notificationBody.id = 'notificationBody-'+randomID

        mainDiv.appendChild(notificationBody)

        var notification = document.createElement('div');
        notification.id = notificationID;
        notification.className = 'notification';
        
        var contentHTML = document.createElement('span');
        contentHTML.id = "content-"+notificationID;
        contentHTML.className = 'content';

        var iconHTML = document.createElement('i');
        iconHTML.className = icon;

        notificationBody.appendChild(notification);

        if (title != "") {
            var titleHTML = document.createElement('span');
            titleHTML.id = "title-"+notificationID;
            titleHTML.className = 'title';

            notification.appendChild(titleHTML);
        }

        notification.appendChild(contentHTML);
        notification.appendChild(iconHTML);
        anime({
            targets: notification,
            easing: 'easeOutBack',
            duration: 550,
            translateX: [1000, 585],
            begin: function(anim) {
                if (title != "") {
                    document.getElementById("title-"+notificationID).textContent = title;
                }
                document.getElementById("content-"+notificationID).textContent = content;
                document.getElementById(notificationID).style.backgroundColor = color;
                var audio = new Audio(sound);
                audio.volume = 0.25;
                audio.play();
            }
        });
        setTimeout(function() {
            anime({
                targets: notification,
                easing: 'easeOutBack',
                duration: 550,
                translateX: [585, 1000],
                complete: function(anim) {
                    notification.remove()
                }
            });
        }, duration);
}


$(document).ready(function() {
    window.addEventListener('message', function(event) {
        var data = event.data
        var newNotification =
            new Notification(data.title,data.content,data.duration,data.icon,data.color,data.sound)
        newNotification.show()
    });
});
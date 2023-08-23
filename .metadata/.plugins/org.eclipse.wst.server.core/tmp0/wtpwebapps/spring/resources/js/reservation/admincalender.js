$(function(){
    var calendarEl = $('#calendar1')[0];
    var calendar = new FullCalendar.Calendar(calendarEl, {
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,listWeek,listYear' // Added 'listYear' for year view
      },
      locale: 'en', // 언어 설정 (한국어)
      editable: true, // 이벤트를 편집 가능하게 설정
      selectable: true,// 이벤트를 선택 가능하게 설정
      select: function(info) {
        var events = calendar.getEvents();
        var conflict = false;
        events.forEach(function (event) {
          if (info.start < event.end && info.end > event.start) { // 이벤트가 중복되는지 확인합니다
            conflict = true;
          }
        });
        if (conflict) {
          Swal.fire({
            title: 'Conflict Detected',
            text: 'There is a conflict with another event.',
            icon: 'error',
          });
        } else {
          Swal.fire({
            title: 'Enter event title',
            input: 'text',
            inputPlaceholder: 'Enter a title',
            confirmButtonText: 'Confirm',
            preConfirm: (title) => {
              if (title) {
                calendar.addEvent({
                  title: title,
                  start: info.startStr,
                  end: info.endStr
                });
              }
            }
          });
        }
      },
      eventClick: function(info) {
        Swal.fire({
          title: 'Edit event information',
          input: 'text',
          inputValue: info.event.title,
          showCancelButton: true,
          confirmButtonText: 'Edit',
          cancelButtonText: 'Cancel',
          showDenyButton: true,
          denyButtonText: 'Delete',
          preConfirm: (newTitle) => {
            if (newTitle) {
              info.event.setProp('title', newTitle);
            }
          },
          preDeny: () => {
            info.event.remove();
          }
        });
      },
      eventDidMount: function(info) {
  if (info.event.title === '선택불가') {
  info.el.style.backgroundColor = 'red'; 
  info.el.style.color = 'white'; 
  }
  }
    });
  
    calendar.render();
  });
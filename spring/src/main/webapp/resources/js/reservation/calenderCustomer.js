var date = new Date();
var month = date.getMonth();
var year = date.getFullYear();
var today = date.getDate();

var monthNames = ["January", "February", "March", "April", "May", "June",
    "July", "August", "September", "October", "November", "December"];
var dayNames = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];

var calendar = document.getElementById('calendar');
var monthDiv = document.getElementById('month-display');

var prevMonthButton = document.querySelector('.prev-month');
var nextMonthButton = document.querySelector('.next-month');

function updateCalendar(month, year) {
    var firstDay = new Date(year, month, 1);
    var lastDay = new Date(year, month + 1, 0);

    monthDiv.innerHTML = monthNames[month] + " " + year;
    calendar.innerHTML = '';

    for (let i = 0; i < 7; i++) {
        calendar.innerHTML += '<div>' + dayNames[i] + '</div>';
    }

    for (let i = 1; i < firstDay.getDay(); i++) {
        calendar.innerHTML += '<div></div>';
    }

    for (let i = 1; i <= lastDay.getDate(); i++) {
        let dayDiv = document.createElement('div');
        dayDiv.innerText = i;
        if (i === today && month === date.getMonth() && year === date.getFullYear()) {
            dayDiv.classList.add("today");
        }

        dayDiv.addEventListener('mouseover', function() {
            dayDiv.style.backgroundColor = "#999";
            dayDiv.style.borderRadius = "50%";
        });

        dayDiv.addEventListener('mouseout', function() {
            dayDiv.style.backgroundColor = "";
            dayDiv.style.borderRadius = "50%";
        });

        dayDiv.addEventListener('click', function() {
            showDayDetails(i, month, year);
        });

        calendar.appendChild(dayDiv);
    }
}

function showDayDetails(day, month, year) {
    let formattedDay = day < 10 ? '0' + day : day;
    let formattedMonth = month + 2 < 10 ? '0' + (month + 2) : month + 1;
    let dateString = `${year}-${formattedMonth}-${formattedDay}`;

    Swal.fire({
        title: 'Enter details',
        html: `
            <input type="date" id="swal-input1" class="swal2-input" value="${dateString}">
            <input type="time" id="swal-input2" class="swal2-input">
            <input type="text" id="swal-input3" class="swal2-input" placeholder="Enter content">
            <h3>-Identification-</h3>
            <input type="text" id="swal-input4" class="swal2-input" placeholder="Enter user ID">
        `,
        focusConfirm: false,
        preConfirm: () => {
            return [
                document.getElementById('swal-input1').value,
                document.getElementById('swal-input2').value,
                document.getElementById('swal-input3').value,
                document.getElementById('swal-input4').value
            ]
        }
    }).then((result) => {
        if (result.value) {
            console.log('날짜: ', result.value[0]);
            console.log('시간: ', result.value[1]);
            console.log('내용: ', result.value[2]);
            console.log('사용자 ID: ', result.value[3]);

            $.ajax({
                type: 'POST',
                url: '/product/reserve',
                contentType: 'application/json; charset=utf-8',
                data: JSON.stringify({
                    date: new java.sql.Date(result.value[0]),
                    time: result.value[1],
                    request_term: result.value[2],
                    cid: result.value[3]
                })
            }).done(function(response) {
                Swal.fire('Success', 'Your reservation has been created.', 'success');
            }).fail(function(error) {
                Swal.fire('Error', 'An error occurred while creating your reservation.', 'error');
            });
        }
    });
}


prevMonthButton.addEventListener('click', function() {
    if (month > 0) {
        month--;
    } else {
        month = 11;
        year--;
    }
    updateCalendar(month, year);
});

nextMonthButton.addEventListener('click', function() {
    if (month < 11) {
        month++;
    } else {
        month = 0;
        year++;
    }
    updateCalendar(month, year);
});

updateCalendar(month, year);

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
    <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap" rel="stylesheet">
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link rel="stylesheet" href="/resources/css/reservation/admincalender.css">
    <title>Admin_calendar</title>
    <style>
    </style>
</head>
<body>
  <h1 style="text-align: center;">Admin_calendar</h1>
  
  <div id='wrap'>
    <div class="button-container">
      <button id='save' class="apple-style-button">save</button>
    </div>

    <div id='calendar-wrap'>
      <div id='calendar1'></div>
    </div>
  </div>
  
  <script src="/resources/js/reservation/admincalender.js"></script>
</body>
</html>

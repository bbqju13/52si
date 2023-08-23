$(function(){
    // 웰컴메시지를 받기 위해 message 입력 받기 전 빈 값으로 서버에 전송해서 웰컴메세지 받음
    callAjax();
    $('#chatForm').on('submit', function(event){
        event.preventDefault();
        if($('#message').val() == "") { // 질문을 입력하지 않고 전송 버튼 누를 때 웰컴 메세지 뜨지 않게
            alert("질문을 입력하세요");
            return false;
        }
        if($('#message').val() != ""){
            $('#chatBox').append('<div class="msgBox send"><span id="in"><span>' +
                $('#message').val() + '</span></span></div><br>');
        }
        callAjax();
        /* 입력란 비우기*/
        $('#message').val('');
    }); // submit 끝
    // 별도의 ajax 생성
    function callAjax() {
        $.ajax({
          url: "chatbotSend2",
          type: "post",
          data: { message: $("#message").val() },
          contentType: "application/x-www-form-urlencoded; charset=UTF-8", // Add this line
          success: function (res) {
            if (res !== "") {
              var msgObj = JSON.parse(res);
              var multilineStr = msgObj.description.replace("\n", "<br/>");
              var url = "";
              if (msgObj.hasOwnProperty("url")) {
                url = `<a href=${msgObj.url} target="_blank">${msgObj.url}</a>`;
              }
              multilineStr += "<br/>" + url;
              /* chatBox에 받은 메시지 추가 */
              $("#chatBox").append(
                '<div class="msgBox receive"><span id="in"><img class="robot-icon2" alt="robot-icon" src="/resources/img/icon_robot.png" /><span>AI봇 옥렌이</span><br/><span>' +
                  multilineStr +
                  "</span><br/>" +
                  "</span></div><br/><br/>"
              );
              // 스크롤해서 올리기
              $("#chatBox").scrollTop($("#chatBox").prop("scrollHeight"));
            }
          },
          error: function () {
            console.log("오류가 발생하였습니다.");
          },
        });
      }
});
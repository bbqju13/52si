function toggleTooltip() {
  var tooltip = document.getElementById("tooltip");
  tooltip.style.display = tooltip.style.display === "block" ? "none" : "block";
}
// 스크롤이 페이지 바닥에 도착했는지 판단하는 함수
function isBottom() {
  const scrollHeight = Math.max(
      document.body.scrollHeight, document.documentElement.scrollHeight,
      document.body.offsetHeight, document.documentElement.offsetHeight,
      document.body.clientHeight, document.documentElement.clientHeight
  );
  const totalScroll = window.pageYOffset + window.innerHeight;
  
  return totalScroll >= scrollHeight;
}

// 스크롤 이벤트 핸들러
window.onscroll = function() {
const footer = document.querySelector('.footer');
const section = document.querySelector('body');

// 스크롤이 바닥에 도착했다면 footer를 보이게 하고, 아니면 숨깁니다.
if (isBottom()) {
    footer.style.display = 'flex';
    section.style.marginBottom = '100px';  // footer의 높이와 일치하게 설정하세요.
} else {
    footer.style.display = 'none';
    section.style.marginBottom = '0';
}
};

document.addEventListener("DOMContentLoaded", function() {
  // 정보 버튼(info-button) 클릭 시 동작
  document.getElementById("info-button").addEventListener("click", function() {
    var infoModal = document.getElementById("info-modal");
    infoModal.style.display = "block";
    infoModal.style.width = "0px";
    infoModal.style.height = "0px";
    infoModal.animate([
      { width: "0px", height: "0px" },
      { width: "340px", height: "560px", opacity: 1 }
    ], {
      duration: 500,
      fill: "forwards"
    });
  });

  // 정보 모달(info-modal) 닫기 버튼(close-button) 클릭 시 동작
  document.getElementById("close-button").addEventListener("click", function() {
    var infoModal = document.getElementById("info-modal");
    infoModal.animate([
      { width: "340px", height: "560px", opacity: 1 },
      { width: "0px", height: "0px", opacity: 0 }
    ], {
      duration: 1500,
      fill: "forwards"
    }).onfinish = function() {
      infoModal.style.display = "none";
    };
  });

  // 관리자 버튼(admin-button-left) 클릭 시 동작
  document.getElementById("admin-button-left").addEventListener("click", function() {
    var adminModal = document.getElementById("admin-modal-left");
    adminModal.style.display = "block";
    adminModal.style.width = "0px";
    adminModal.style.height = "0px";
    adminModal.animate([
      { width: "0px", height: "0px" },
      { width: "260px", height: "560px", opacity: 1 }
    ], {
      duration: 500,
      fill: "forwards"
    });
  });

  // 관리자 모달(admin-modal-left) 닫기 버튼(close-button-admin-left) 클릭 시 동작
  document.getElementById("close-button-admin-left").addEventListener("click", function() {
    var adminModal = document.getElementById("admin-modal-left");
    adminModal.animate([
      { width: "260px", height: "560px", opacity: 1 },
      { width: "0px", height: "0px", opacity: 0 }
    ], {
      duration: 1500,
      fill: "forwards"
    }).onfinish = function() {
      adminModal.style.display = "none";
    };
  });
});
// ******************************************************************
// 호버메뉴
var navBar = document.getElementById('nav-bar');
      var navBtn = document.getElementById('nav-btn');

      navBtn.addEventListener('mouseenter', function() {
          navBar.style.width = '300px';
      });

      navBar.addEventListener('mouseleave', function() {
          navBar.style.width = '0';
      });
// section2
var endDate = new Date('2023-08-05').getTime();

var countdownInterval = setInterval(function() {
  var now = new Date().getTime();
  var distance = endDate - now;

  var days = Math.floor(distance / (1000 * 60 * 60 * 24));
  var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
  var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
  var seconds = Math.floor((distance % (1000 * 60)) / 1000);

  document.getElementById('days').innerText = String(days).padStart(2, '0') + ' DAYS';
  document.getElementById('hours').innerText = String(hours).padStart(2, '0') + ' HOURS';
  document.getElementById('minutes').innerText = String(minutes).padStart(2, '0') + ' MINUTES';
  document.getElementById('seconds').innerText = String(seconds).padStart(2, '0') + ' SECONDS';

  if (distance < 0) {
      clearInterval(countdownInterval);
      document.getElementById('days').innerText = '00 DAYS';
      document.getElementById('hours').innerText = '00 HOURS';
      document.getElementById('minutes').innerText = '00 MINUTES';
      document.getElementById('seconds').innerText = '00 SECONDS';
  }
}, 1000);

// 서치js
function openSearch() {
document.getElementById("myOverlay").style.height = "75%";
document.getElementById("blurryPart").style.height = "25%";
}

function closeSearch() {
document.getElementById("myOverlay").style.height = "0%";
document.getElementById("blurryPart").style.height = "0%";
}

document.getElementById('search').addEventListener('click', function() {
openSearch();
});



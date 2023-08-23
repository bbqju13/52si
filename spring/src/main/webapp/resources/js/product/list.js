var navBar = document.getElementById('nav-bar');
        var navBtn = document.getElementById('nav-btn');

        navBtn.addEventListener('mouseenter', function() {
            navBar.style.width = '300px';
        });

        navBar.addEventListener('mouseleave', function() {
            navBar.style.width = '0';
        });

        // top btn
var topButton = document.getElementById("top-button");
    
        // 스크롤을 내리면 버튼이 나타나도록 하는 함수
        window.onscroll = function() {scrollFunction()};
    
        function scrollFunction() {
            if (document.body.scrollTop > 100 || document.documentElement.scrollTop > 100) {
                topButton.style.display = "block";
            } else {
                topButton.style.display = "none";
            }
        }
    
        // 버튼 클릭 시 스크롤이 부드럽게 상단으로 이동하도록 하는 함수
        function topFunction() {
            window.scrollTo({top: 0, behavior: 'smooth'});
        }
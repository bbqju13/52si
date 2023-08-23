const detailBox = document.getElementById("detailBox");
const specBox = document.getElementById("specBox");
const cardBox = document.getElementById("cardBox");
const detailContent = document.getElementById("detailContent");
const specContent = document.getElementById("specContent");
const cardNotice = document.getElementById("cardNotice");

detailBox.addEventListener("click", function(){
    detailContent.style.display = "block";
    specContent.style.display = "none";
    cardNotice.style.display = "none";
})
specBox.addEventListener("click", function(){
    detailContent.style.display = "none";
    specContent.style.display = "block";
    cardNotice.style.display = "none";
})
cardBox.addEventListener("click", function(){
    detailContent.style.display = "none";
    specContent.style.display = "none";
    cardNotice.style.display = "block";
})



//별점
    const Star = (target) => {
        console.log(target);
        const starSpan = document.querySelector('.star span');
        if (starSpan) {
          const ratingValue = target.value * 0.5;
          starSpan.style.width = `${target.value * 10}%`;
          console.log("rrrrrr"+ratingValue);
          return ratingValue;
        } else {
          console.error("Element with class '.star span' not found!");
          return 0; 
        }
      }

    //상품평 작성 글자수 초과 체크 이벤트 리스너
    document.querySelector('.textArea').addEventListener('keydown',function(){
        //리뷰 400자 초과 안되게 자동 자름
        let review = document.querySelector('.textArea');
        let lengthCheckEx = /^.{400,}$/;
        if(lengthCheckEx.test(review.value)){
            //400자 초과 컷
            review.value = review.value.substr(0,400);
        }
    });


//리뷰
    async function postCommentToServer(cmtData){
        try{
            const url = '/comment/post';
            const config = {
                method:"post",
                headers: {
                    'content-type':'application/json; charset=utf-8'
                },
                body:JSON.stringify(cmtData)
            };
            const resp = await fetch(url, config);
            const result = await resp.text();  //isOK
            return result;
        }catch(err){
            console.log(err);
        }
    }
    
    document.getElementById('cmtPostBtn').addEventListener('click', () => {
        const cmtText = document.getElementById('cmtText').value;
        console.log(cmtText);
        if (cmtText == "" || cmtText == null) {
          alert("댓글을 입력해주세요");
          document.getElementById('cmtText').focus();
          return false;
        } else {
          const ratingValue = Star(document.getElementById('targetRatingInput'));
          
          let cmtData = {
            pno: pnoVal,
            writer: document.getElementById('cmtWriter').innerText,
            content: cmtText,
            rate: ratingValue
          };
          
          console.log(cmtData);
          postCommentToServer(cmtData).then(result => {
            //isOk 확인 데이터
            if (result > 0) {
              alert("댓글 등록 성공~!!");
              getCommentList(cmtData.pno);
            }
          });
        }
      })
    
    async function spreadCommentFromServer(pno){
        console.log(pno);
        try{
            const resp = await fetch('/comment/'+pno);
            const result = await resp.json();
            return result;
        }catch(err){
            console.log(err);
        }
    }


    function getStarsFromRate(rate) {

        switch (rate) {
          case 1:
            return '★';
          case 2:
            return '★★';
          case 3:
            return '★★★';
          case 4:
            return '★★★★';
          case 5:
            return '★★★★★';

          default:
            return '평가 없음'; // 평가가 1부터 5 사이가 아닌 경우
        }
    }

    //납부기간 및 렌탈료, 혜택가
    const paymentOption1 = document.getElementById('paymentOption01'); //36개월
    const paymentOption2 = document.getElementById('paymentOption02'); //48개월
    const paymentOption3 = document.getElementById('paymentOption03'); //60개월
    
    let paymentOptionPrice36, paymentOptionPrice48, paymentOptionPrice60;
    
    paymentOption1.addEventListener('click', () => {
      paymentOptionPrice36 = document.getElementById('paymentOption01').value / 36;
      const roundedAvgPrice36 = Math.floor(paymentOptionPrice36); 
      document.getElementById('finalPrice').innerText = `${roundedAvgPrice36}`+"원";
      document.getElementById('realFinalPrice').innerText = `${roundedAvgPrice36}`+"원";
    });
    
    paymentOption2.addEventListener('click', () => {
      paymentOptionPrice48 = document.getElementById('paymentOption01').value / 48;
      const roundedAvgPrice48 = Math.floor(paymentOptionPrice48); 
      document.getElementById('finalPrice').innerText = `${ roundedAvgPrice48}`+"원";
      document.getElementById('realFinalPrice').innerText = `${roundedAvgPrice48}`+"원";
    });
    
    paymentOption3.addEventListener('click', () => {
      paymentOptionPrice60 = document.getElementById('paymentOption01').value / 60;
      const roundedAvgPrice60 = Math.floor(paymentOptionPrice60); 
      document.getElementById('finalPrice').innerText = `${roundedAvgPrice60}`+"원";
      document.getElementById('realFinalPrice').innerText = `${roundedAvgPrice60}`+"원";
    });


    function getCommentList(pno) {
        spreadCommentFromServer(pno).then(result => {
            console.log(result);
            const ul = document.getElementById('cmtListArea');
            if (result.length > 0) {
                ul.innerHTML = "";
                let totalRating = 0; // 전체 별점 합계를 저장할 변수
                for (let cmvo of result) {
                    let li = `<li data-cno="${cmvo.cno}"><div>`;
                    li += `<div>${cmvo.writer}</div>`;
                    li += `<span id="cmtTextMod">${cmvo.content}</span></div>`;
                    li += `<span>${getStarsFromRate(cmvo.rate)}</span>`;
                    ul.innerHTML += li;
    
                    totalRating += cmvo.rate; // 별점을 누적하여 합계를 구함
                }
    
          // 평균 계산
          const avgRating = totalRating / result.length;
          const roundedAvgRating = Math.floor(avgRating); // 평균 평점의 소수점을 버림
          const avgStars = getStarsFromRate(roundedAvgRating);

          // 전체 리뷰 수 출력
          document.getElementById('countPrint').innerText = `${result.length}`+"건";

          document.getElementById('totalRating').innerText = `${avgStars} ${roundedAvgRating}`+"점";
      } else {
          let li = `<li>Comment List Empty</li>`;
          ul.innerHTML += li;

          // 전체 리뷰 수 출력 (댓글이 없을 경우 0으로 설정)
          document.getElementById('countPrint').innerText = 0;
      }
})
    }


    async function editCommentToServer(cmtDataMod){
        try{
            const url='/comment/'+cmtDataMod.cno;
            const config={
                method:'put',
                headers:{
                    'content-type':'application/json; charset=utf-8'
                },
                body:JSON.stringify(cmtDataMod)
            };
            const resp = await fetch(url, config);
            const result = await resp.text();
            return result;
        }catch(err){
            console.log(err);
        }
    }
    
    async function removeCommentToServer(cno){
        try{
            const url='/comment/'+cno;
            const config={
                method:'delete'
            };
            const resp = await fetch(url, config);
            const result = await resp.text();
            return result;
        }catch(err){
            console.log(err);
        }
    }
    
    document.addEventListener('click', (e)=>{
        console.log(e.target); 
        if(e.target.classList.contains('modBtn')){
            console.log("수정버튼 클릭시");
            //내가 클릭한 버튼의 댓글 뭉치
            let li = e.target.closest('li'); 
            let cnoVal = li.dataset.cno;
            let textContent = li.querySelector('#cmtTextMod').value;
            console.log("cno / content   => "+ cnoVal + "  " + textContent);
    
            let cmtDataMod={
                cno:cnoVal,
                content: textContent
            };
            console.log(cmtDataMod);
            //서버 연결
            editCommentToServer(cmtDataMod).then(result=>{
                if(result > 0){
                    alert('댓글 수정 성공~!!');
                }
                getCommentList(pnoVal);
            })
        }else if(e.target.classList.contains('delBtn')){
            console.log("삭제버튼 클릭시");
            let li = e.target.closest('li'); 
            let cnoVal = li.dataset.cno;
            console.log(cnoVal);
            removeCommentToServer(cnoVal).then(result =>{
                if(result >0){
                    alert('댓글 삭제 성공~!!');
                }
                getCommentList(pnoVal);
            })
        }
    })
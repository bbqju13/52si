    var policyModal = document.getElementById("policy-modal");
    var policyButton = document.getElementById("privacy-policy");
    var closeButton = document.getElementById("close-button-policy");

    var policyModal1 = document.getElementById("policy-modal1");
    var policyButton1 = document.getElementById("privacy-policy1");
    var closeButton1 = document.getElementById("close-button-policy1");

    policyButton.onclick = function() {
        policyModal.style.display = "block";
    }

    closeButton.onclick = function() {
        policyModal.style.display = "none";
    }

    policyButton1.onclick = function() {
        policyModal1.style.display = "block";
    }

    closeButton1.onclick = function() {
        policyModal1.style.display = "none";
    }

    window.onclick = function(event) {
        if (event.target == policyModal) {
            policyModal.style.display = "none";
        }
        if (event.target == policyModal1) {
            policyModal1.style.display = "none";
        }
    }

    function validateButton(event) { 
    // var cscontentTextarea = document.querySelector('textarea[name="cscontent"]');
    // var cscontentError = document.getElementById("cscontentError");
    var cstypeSelect = document.querySelector('select[name="cstype"]');
    var cstypeError = document.getElementById("cstypeError");
    var csnameInput = document.querySelector('input[name="csname"]');
    var csnameError = document.getElementById("csnameError");
    var cstelInput = document.querySelector('input[name="cstel"]');
    var cstelError = document.getElementById("cstelError");
    var isFormValid = true; // 폼 유효성 검사 결과
    console.log(isFormValid);
    // if (cscontentTextarea.value.trim() === "") {
    //     isFormValid = false;
    //     cscontentError.style.display = "block";
    // } else {
    //     cscontentError.style.display = "none";
    // }
    if (cstypeSelect.value.trim() === "") {
        console.log(cstypeSelect.value);
        isFormValid = false;
        cstypeError.style.display = "block";
    } else {
        cstypeError.style.display = "none";
    }
    if (csnameInput.value.trim() === "") {
        isFormValid = false;
        csnameError.style.display = "block";
    } else {
        csnameError.style.display = "none";
    }
    if (cstelInput.value.trim() === "") {
        isFormValid = false;
        cstelError.style.display = "block";
    } else {
        cstelError.style.display = "none";
    }

    console.log(isFormValid);
    // 폼 전송 막기
    if (!isFormValid) {
        event.preventDefault(); 
    }
}

// document.getElementById("registerForm").addEventListener("submit", function(e) {
//     var checkbox = document.querySelector('input[type="checkbox"]');
//     if (!checkbox.checked) {
//         e.preventDefault();
//     }
// });
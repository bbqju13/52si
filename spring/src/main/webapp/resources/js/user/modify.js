function validateButton(event) { 
    var cidInput = document.querySelector('input[name="cid"]');
    var cidError = document.getElementById("cidError");
    var cpwInput = document.querySelector('input[name="cpw"]');
    var cpwError = document.getElementById("cpwError");
    var cnameInput = document.querySelector('input[name="cname"]');
    var cnameError = document.getElementById("cnameError");
    var cageInput = document.querySelector('input[name="cage"]');
    var cageError = document.getElementById("cageError");
    var cgenderInput = document.querySelector('input[name="cgender"]');
    var cgenderError = document.getElementById("cgenderError");
    var cnick_nameInput = document.querySelector('input[name="cnick_name"]');
    var cnick_nameError = document.getElementById("cnick_nameError");
    var cemailInput = document.querySelector('input[name="cemail"]');
    var cemailError = document.getElementById("cemailError");
    var ctelInput = document.querySelector('input[name="ctel"]');
    var ctelError = document.getElementById("ctelError");
    var caddInput = document.querySelector('input[name="cadd"]');
    var caddError = document.getElementById("caddError");

    var isFormValid = true; // 폼 유효성 검사 결과

    if (cidInput.value.trim() === "") {
        isFormValid = false;
        cidError.style.display = "block";
    } else {
        cidError.style.display = "none";
    }
    
    if (cpwInput.value.trim() === "") {
        isFormValid = false;
        cpwError.style.display = "block";
    }

    if (cnameInput.value.trim() === "") {
        isFormValid = false;
        cnameError.style.display = "block";
    }

    if (cageInput.value.trim() === "" || isNaN(cageInput.value)) {
        isFormValid = false;
        cageError.style.display = "block";
    } else {
        cageError.style.display = "none";
    }

    if (cgenderInput.value.trim() === "") {
        isFormValid = false;
        cgenderError.style.display = "block";
    } else {
        cgenderError.style.display = "none";
    }

    if (cnick_nameInput.value.trim() === "") {
        isFormValid = false;
        cnick_nameError.style.display = "block";
    } else {
        cnick_nameError.style.display = "none";
    }

    if (cemailInput.value.trim() === "") {
        isFormValid = false;
        cemailError.style.display = "block";
    } else {
        cemailError.style.display = "none";
    }

    if (ctelInput.value.trim() === "") {
        isFormValid = false;
        ctelError.style.display = "block";
    } else {
        ctelError.style.display = "none";
    }

    if (caddInput.value.trim() === "") {
        isFormValid = false;
        caddError.style.display = "block";
    } else {
        caddError.style.display = "none";
    }

    // 폼 전송 막기
    if (!isFormValid) {
        event.preventDefault(); 
    }
}

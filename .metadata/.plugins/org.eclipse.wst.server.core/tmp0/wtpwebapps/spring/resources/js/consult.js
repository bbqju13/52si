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
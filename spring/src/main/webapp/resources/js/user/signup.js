const maleIcon = document.querySelector("#maleIcon");
        const femaleIcon = document.querySelector("#femaleIcon");

        maleIcon.addEventListener("click", function () {
            this.classList.add("selected");
            femaleIcon.classList.remove("selected");
        });

        femaleIcon.addEventListener("click", function () {
            this.classList.add("selected");
            maleIcon.classList.remove("selected");
        });

document.addEventListener("DOMContentLoaded", () => {
    const colorSelect = document.getElementById("color-select");
    const sizeSelect = document.getElementById("size-select");
    const selectedOptionsContainer = document.querySelector(".selected-options");
    const totalDisplay = document.querySelector(".total");
    //const price = 19900; // 예시 가격

    function updateTotal() {
        const optionDivs = selectedOptionsContainer.children;
        let totalPrice = 0;
        let totalCount = 0;
        for (let div of optionDivs) {
            const quantityInput = div.querySelector("input");
            const quantity = parseInt(quantityInput.value);
            totalPrice += price * quantity;
            totalCount += quantity;
            console.log(totalPrice)
        }
        totalDisplay.innerHTML = 'TOTAL: ' + totalPrice.toLocaleString() + ' 원 ' + '(' + totalCount + '개' + ')';
    }

    function updateSelectedOptions() {
        const color = colorSelect.value;
        const size = sizeSelect.value;
       	

        // 옵션이 둘 다 선택된 경우
        if (color && size) {
            const optionText = '색상 : ' + color + ' / 사이즈 : ' + size ;
            console.log("Color:", color);  
            console.log("Size:", size);   
            console.log("Option price:", price);  

            const existingOption = Array.from(selectedOptionsContainer.children).find(
                option => option.dataset.option === optionText
            );

            // 동일한 옵션이 이미 선택된 경우 업데이트하지 않음
            if (!existingOption) {
            	console.log(price)
                const optionDiv = document.createElement('div');
                optionDiv.dataset.option = optionText;
                optionDiv.innerHTML = '<span>' + optionText + '</span>' +
                    '<input type="number" value="1" min="1" style="width: 50px; margin-right: 10px;">' +
                    '<span>' + price.toLocaleString() + '원</span>' +
                    '<button type="button" onclick="this.parentElement.remove(); updateTotal();">x</button>';
                
                selectedOptionsContainer.appendChild(optionDiv);

                const quantityInput = optionDiv.querySelector("input");
                quantityInput.addEventListener("change", updateTotal);
                updateTotal();
            }

            // 선택 초기화
            colorSelect.value = "";
            sizeSelect.value = "";
        }
    }

    colorSelect.addEventListener("change", () => {
        console.log("Color changed:", colorSelect.value); 
        if (colorSelect.value && sizeSelect.value) {
            updateSelectedOptions();
        }
    });

    sizeSelect.addEventListener("change", () => {
        console.log("Size changed:", sizeSelect.value); 
        if (colorSelect.value && sizeSelect.value) {
            updateSelectedOptions();
        }
    });

    window.updateTotal = updateTotal;
});




/* 여기부터모달 */
	// 모달가져오기
    var modal = document.getElementById("myModal");

    // 모달버튼 가져오기
    var btn = document.getElementById("myBtn");

    //  <span> 닫기
    var span = document.getElementsByClassName("close")[0];

    // 모달열기 
    btn.onclick = function() {
        modal.style.display = "block";
    }

    // x 누름 닫히게
    span.onclick = function() {
        modal.style.display = "none";
    }

    // 모달밖클릭스 닫히게
    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }

    // 별점
    const stars = document.querySelectorAll(".rating span");
    stars.forEach(star => {
        star.addEventListener("click", () => {
            const value = star.getAttribute("data-value");
            stars.forEach(s => s.classList.remove("filled"));
            for (let i = 0; i < value; i++) {
                stars[i].classList.add("filled");
            }
        });
    });

    // 사진추가
    const fileInput = document.getElementById("file-input");
    const fileLabel = document.getElementById("file-label");

    fileInput.addEventListener("change", (event) => {
        const file = event.target.files[0];
        const reader = new FileReader();
        reader.onload = (e) => {
            fileLabel.innerHTML = `<img src="${e.target.result}" alt="Image">`;
        };
        reader.readAsDataURL(file);
    });
 





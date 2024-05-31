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
			//console.log('totalCount', totalCount)
		}
		totalDisplay.innerHTML = 'TOTAL: ' + totalPrice.toLocaleString() + ' 원 ' + '(' + totalCount + '개' + ')';
	}
	let newQuantity = 0;
	async function updateSelectedOptions() {
		const color = colorSelect.value;
		const size = sizeSelect.value;
		// product_info_no 값을 가져오기.
		let proInfoNo = '';
		let result = await fetch('getProductInfoNo.do?pno=' + productNo + '&color=' + color + '&size=' + size);
		result = await result.json();
		//console.log('result: ', result);
		//proInfoNo = result.productInfoNo;
		// 옵션이 둘 다 선택된 경우
		if (color && size) {
			const optionText = '색상 : ' + color + ' / 사이즈 : ' + size;
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
				optionDiv.setAttribute('data-pno', proInfoNo);
				optionDiv.setAttribute('id', 'option-container');
				//const que = document.querySelector(.) 
				//console.log(que);
				//console.log(newQuantity);
				optionDiv.dataset.option = optionText;
				optionDiv.innerHTML = '<div class="option"><span>' + optionText + '</span>' +
					'<input type="number" value="1" min="1" style="width: 50px; margin-right: 10px;">' +
					'<span class="option-price">' + price.toLocaleString() + '원</span>' +
					'<span class="option-qty">' + '개</span>' +
					'<button type="button" onclick="this.parentElement.remove(); updateTotal();">x</button></div>';

				selectedOptionsContainer.appendChild(optionDiv);

				const quantityInput = optionDiv.querySelector("input");
				quantityInput.addEventListener("change", function() {
					const newQuantity = parseInt(this.value, 10);
					console.log('this.value', this.value);
					const newTotalPrice = price * newQuantity;
					const optionPriceElement = optionDiv.querySelector(".option-price");
					const optionQuentity = optionDiv.querySelector(".option-qty");
					optionPriceElement.innerText = newTotalPrice.toLocaleString() + '원';
					optionQuentity.innerText = newQuantity + '개';
					updateTotal();
				});
				updateTotal();
			}
			// 선택 초기화
			colorSelect.value = "";
			sizeSelect.value = "";
		}
	} // 

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

	// 장바구니 클릭시 정보저장.
	document.querySelector('.add-to-cart').addEventListener('click', function() {
		document.querySelectorAll('.selected-options div').forEach(item => {
			console.log('item : ', item)
			/*<div data-pno="1" data-option="색상 : Red / 사이즈 : Large">
			<span>색상 : Red / 사이즈 : Large</span>
			<input type="number" value="1" min="1" style="width: 50px; margin-right: 10px;">
			<span class="option-price">12900원</span>
			<button type="button" onclick="this.parentElement.remove(); updateTotal();">x</button>
			</div>*/
			const optionContainer = document.getElementById('option-container');
			let pino = optionContainer.getAttribute('data-pno');
			console.log('Product Number (pno):', pino);
			//let cnt = newQuantity;
			/*let userId = ;*/
			//pno =  optionDiv.getAttribute('data-pno'),
			//quantity = optionDiv.querySelector('input').value
			//console.log(pno);
			//console.log(quantity);

			fetch('registerBasket.do')
				.then(resolve => resolve.json())
				.then(result => {
					console.log('result', result);
					console.log('productInfoNo',productInfoNo);
				/*	result.forEach(product => {
						//옵션 여러개 상품이 장바구니 데이터로 담기게하기 BasketVO에 
						//옵션에 표시되는 제품옵션번호와,유저아이디,하나의 옵션당 선택된 갯수 보내줘야함 

					})*/
				})
				.catch(err => console.log(err));
		});

		//location.href = 'basketList1.do';
	})

	// wish-list
	document.querySelector('.wish-list').addEventListener('click', function() {
		document.querySelectorAll('.selected-options div').forEach(item => {


		})
		location.href = 'basketList1.do';
	})

	//buy-now
	document.querySelector('.buy-now').addEventListener('click', function() {
		document.querySelectorAll('.selected-options div').forEach(item => {


		})
		location.href = 'orderForm.do?form=direct&pno=' + '';
	})

	// review.
	document.forms.reviewFrm.addEventListener('submit', function(e) {
		e.preventDefault();

		let score = document.querySelectorAll('div.rating span.filled').length;
		const content = document.querySelector('textarea[name="content"]').value;
		const fileField = document.querySelector('#file-input');

		let fdata = new FormData();
		fdata.append('pno', productNo);
		fdata.append('score', score);
		fdata.append("reviewImg", fileField.files[0]);
		fdata.append('content', content);
		console.log('productNo',productNo);
		fdata.forEach(item => {
			console.log(item);
		})

		fetch(this.action, {
			method: 'post',
			body: fdata
		})
			.then(result => result.json())
			.then(result => {
				console.log(result)
				document.querySelector('#myModal').style.display = 'none';
				location.href = 'productDetail.do?pno=' + productNo + '&page=1#reviewTop';
			})
			.catch(err => {
				console.log(err)
			});
	})
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

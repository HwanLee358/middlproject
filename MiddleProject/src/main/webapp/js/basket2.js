// 숫자 3자리 콤마찍기
Number.prototype.numberFormat = function() {
	if (this == 0)
		return 0;
	let regex = /(^[+-]?\d+)(\d{3})/;
	let nstr = (this + '');
	while (regex.test(nstr)) {
		nstr = nstr.replace(regex, '$1' + ',' + '$2');
	}
	return nstr;
};

function selectAll(selectAll) {
	const checkboxes
		= document.getElementsByName('buy');

	checkboxes.forEach((checkbox) => {
		checkbox.checked = selectAll.checked;
	})
}

let basket = {
	basketCount: 0, // 전체수량.
	basketTotal: 0, // 전체금액.

	list: function() {
		// 목록.
		svc.basketList(
			result => {
				console.log(result);
				result.forEach(basket1 => {
					console.log(basket1.basketNo);
					basket.basketCount += basket1.productCnt;
					basket.basketTotal += (basket1.productCnt * basket1.productPrice);

					const rowDiv = document.querySelector('div[data-id="0"]').cloneNode(true);
					rowDiv.style.display = 'block';
					rowDiv.setAttribute('data-id', basket1.basketNo);
					rowDiv.querySelector('div.img>img').setAttribute('src', './images/' + basket1.productName + '.jpg');
					rowDiv.querySelector('div.pname>span').innerText = basket1.productName;
					rowDiv.querySelector('div.basketprice').childNodes[2].textContent = basket1.productPrice.numberFormat() + "원";
					// 배송비
					rowDiv.querySelector('div.delivery_fee').value = basket1.deliveryfee;

					rowDiv.querySelector('div.basketprice input').value = basket1.productPrice;
					rowDiv.querySelector('div.basketprice input').setAttribute('id', 'p_price' + basket1.basketNo);

					rowDiv.querySelector('div.updown input').value = basket1.productCnt;
					rowDiv.querySelector('div.updown input').setAttribute('id', 'p_num' + basket1.basketNo);
					// event
					rowDiv.querySelector('div.updown input').onkeyup = () => basket.changePNum(basket1.basketNo);
					rowDiv.querySelector('div.updown span').onclick = () => basket.changePNum(basket1.basketNo);
					rowDiv.querySelector('div.updown span:nth-of-type(2)').onclick = () => basket.changePNum(basket1.basketNo);
					// 개별합계
					rowDiv.querySelector('div.sum').textContent = (basket.productCnt * basket.productPrice).numberFormat() + "원";
					rowDiv.querySelector('div.sum').setAttribute('id', 'p_sum' + basket1.basketNo);
					document.querySelector('#basket').append(rowDiv);
				});
				basket.reCalc();
			},
			err => {
				console.log(err);
			}
		) // end of basketList
	}, // end of list

	delItem: function() {
		// 
		console.log();
		let no = event.target.parentElement.parentElement.parentElement.dataset.id;
		console.log(no);

		svc.basketRemove(no,
			result => {
				if (result.retCode == 'OK') {
					console.log(result);
					let price = document.querySelector('#p_price' + no).value; // 단가
					let cnt = document.querySelector('#p_num' + no).value; // 현재수량
					// 합계반영
					basket.basketCount -= cnt;
					basket.basketTotal -= price * cnt;
					basket.reCalc();
					// 화면에서 지우기
					document.querySelector('div[data-id="' + no + '"]').remove();
				}
			},
			err => {
				console.log(err);
			});

	},

	reCalc: function() {
		//수량, 금액 합계 계산
		//합계 자리에 출력
		document.querySelector('#sum_p_num span').textContent = basket.basketCount;
		document.querySelector('#sum_p_price span').textContent
			= basket.basketTotal.numberFormat();
	},

	changePNum: function(basketNo) {
		console.log(event);
		let productCnt = -1;
		if (event.target.nodeName == "I") {
			if (event.target.className.indexOf("up") != -1) {
				productCnt = 1;
			}
		} else if (event.target.nodeName == "INPUT") {
			if (event.key == "ArrowUp") {
				productCnt = 1;
			}
		}
		let productPrice = document.querySelector('#p_price' + basketNo).value; // 금액
		let cntElem = document.querySelector('#p_num' + basketNo);
		let sumElem = document.querySelector('#p_sum' + basketNo);

		let bvo = { basketNo, productCnt }
		svc.basketUpdate(bvo, //
			result => {
				console.log(result);
				cntElem.value = parseInt(cntElem.value) + productCnt; // 수량변경
				sumElem.innerText = (productPrice * cntElem.value).numberFormat() + "원";
				// 전체수량, 금액
				basket.basketCount += productCnt;
				basket.basketTotal += (productPrice * productCnt);
				basket.reCalc();
			},
			err => {
				console.log(err);
			})
	}, // end of changePNum

	delCheckedItem: function() {
		document.querySelectorAll('input:checked').forEach((item, idx) => {
			if (idx > 0) {
				let no = item.parentElement.parentElement.parentElement.dataset.id;
				svc.basketRemove(no,
					result => {
						if (result.retCode == 'OK') {
							console.log(result);
							let price = document.querySelector('#p_price' + no).value; // 단가
							let cnt = document.querySelector('#p_num' + no).value; // 현재수량
							// 합계반영
							basket.basketCount -= cnt;
							basket.basketTotal -= (price * cnt);
							basket.reCalc();
							// 화면에서 지우기
							document.querySelector('div[data-id="' + no + '"]').remove();
						}
					},
					err => {
						console.log(err);
					});
			}
		})
	},
	// 장바구니 비우기
	delAllItem: function() {
		document.querySelectorAll('.row.data').forEach((item) => {
			let no = item.dataset.id;
			svc.basketRemove(no,
				result => {
					if (result.retCode == 'OK') {
						console.log(result);
						let price = document.querySelector('#p_price' + no).value; // 단가
						let cnt = document.querySelector('#p_num' + no).value; // 현재수량
						// 합계반영
						basket.basketCount -= cnt;
						basket.basketTotal -= (price * cnt);
						basket.reCalc();
						// 화면에서 지우기
						document.querySelector('div[data-id="' + no + '"]').remove();
					}
				},
				err => {
					console.log(err);
				});
		})
	},
	// 전체 상품 주문
	orderAllItem: function(){
		var form = document.createElement('form');
    	form.method = 'post';
    	form.action = "main.do"; // 임시로 main.do
    	
    	 var items = document.querySelectorAll('.row.data');
    	 items.forEach(function(item, index) {
			if (item.style.display !== 'none'){
			// 상품번호
            var itemId = document.createElement('input');
            itemId.type = 'hidden';
            itemId.name = 'item_id' + index;
            itemId.value = item.querySelector('.check input').value;
            form.appendChild(itemId);

            // 상품명
            var itemName = document.createElement('input');
            itemName.type = 'hidden';
            itemName.name = 'item_name' + index;
            itemName.value = item.querySelector('.pname span').textContent;
            form.appendChild(itemName);

            // 상품가격
            var itemPrice = document.createElement('input');
            itemPrice.type = 'hidden';
            itemPrice.name = 'item_price' + index;
            itemPrice.value = item.querySelector('.p_price').value;
            form.appendChild(itemPrice);

            // 상품수량
            var itemQuantity = document.createElement('input');
            itemQuantity.type = 'hidden';
            itemQuantity.name = 'item_quantity' + index;
            itemQuantity.value = item.querySelector('.p_num').value;
            form.appendChild(itemQuantity);

            // 배송비
            var deliveryFee = document.createElement('input');
            deliveryFee.type = 'hidden';
            deliveryFee.name = 'delivery_fee' + index;
            deliveryFee.value = item.querySelector('.delivery_fee').textContent;
            form.appendChild(deliveryFee);
			}
		 })
		    document.body.appendChild(form);
		    form.submit();
	},
	
	// 선택된 상품 주문
    orderSelectedItem: function() {
        var form = document.createElement('form');
        form.method = 'post';
        form.action = "main.do"; // 임시로 main.do

        var selectedItems = document.querySelectorAll('.row.data .check input[type="checkbox"]:checked');
        selectedItems.forEach(function(checkbox, index) {
            var item = checkbox.closest('.row.data');

            // 상품번호
            var itemId = document.createElement('input');
            itemId.type = 'hidden';
            itemId.name = 'item_id' + index;
            itemId.value = checkbox.value;
            form.appendChild(itemId);

            // 상품명
            var itemName = document.createElement('input');
            itemName.type = 'hidden';
            itemName.name = 'item_name' + index;
            itemName.value = item.querySelector('.pname span').textContent;
            form.appendChild(itemName);

            // 상품가격
            var itemPrice = document.createElement('input');
            itemPrice.type = 'hidden';
            itemPrice.name = 'item_price' + index;
            itemPrice.value = item.querySelector('.p_price').value;
            form.appendChild(itemPrice);

            // 상품수량
            var itemQuantity = document.createElement('input');
            itemQuantity.type = 'hidden';
            itemQuantity.name = 'item_quantity' + index;
            itemQuantity.value = item.querySelector('.p_num').value;
            form.appendChild(itemQuantity);

            // 배송비
            var deliveryFee = document.createElement('input');
            deliveryFee.type = 'hidden';
            deliveryFee.name = 'delivery_fee' + index;
            deliveryFee.value = item.querySelector('.delivery_fee').textContent;
            form.appendChild(deliveryFee);
        });

        document.body.appendChild(form);
        form.submit();
    }
};

basket.list();

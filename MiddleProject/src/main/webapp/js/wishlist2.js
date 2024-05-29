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

let wishlist = {
	wishlistCount: 0, // 전체수량.
	wishlistTotal: 0, // 전체금액.

	list: function() {
		// 목록.
		svc.wishList(
			result => {
				console.log(result);
				result.forEach(wishlist1 => {
					console.log(wishlist1.wishlistNo);
					wishlist.wishlistCount += wishlist1.productCnt;
					wishlist.wishlistTotal += (wishlist1.productCnt * wishlist1.productPrice);

					const rowDiv = document.querySelector('div[data-id="0"]').cloneNode(true);
					rowDiv.style.display = 'block';
					rowDiv.setAttribute('data-id', wishlist1.wishlistNo);
					rowDiv.querySelector('div.img>img').setAttribute('src', './images/' + wishlist1.productName + '.jpg');
					rowDiv.querySelector('div.pname>span').innerText = wishlist1.productName;
					rowDiv.querySelector('div.basketprice').childNodes[2].textContent = wishlist1.productPrice.numberFormat() + "원";
					// 배송비
					rowDiv.querySelector('div.delivery_fee').value = wishlist1.deliveryfee;

					rowDiv.querySelector('div.basketprice input').value = wishlist1.productPrice;
					rowDiv.querySelector('div.basketprice input').setAttribute('id', 'p_price' + wishlist1.wishlistNo);

					rowDiv.querySelector('div.updown input').value = wishlist1.productCnt;
					rowDiv.querySelector('div.updown input').setAttribute('id', 'p_num' + wishlist1.wishlistNo);
					// event
					rowDiv.querySelector('div.updown input').onkeyup = () => wishlist.changePNum(wishlist1.wishlistNo);
					rowDiv.querySelector('div.updown span').onclick = () => wishlist.changePNum(wishlist1.wishlistNo);
					rowDiv.querySelector('div.updown span:nth-of-type(2)').onclick = () => wishlist.changePNum(wishlist1.wishlistNo);					// 개별합계
					rowDiv.querySelector('div.sum').textContent = (wishlist.productCnt * wishlist.productPrice).numberFormat() + "원";
					rowDiv.querySelector('div.sum').setAttribute('id', 'p_sum' + wishlist1.wishlistNo);
					document.querySelector('#basket').append(rowDiv);
				});
				wishlist.reCalc();
			},
			err => {
				console.log(err);
			}
		) // end of wishlistList
	}, // end of list

	delItem: function() {
		// 
		console.log();
		let no = event.target.parentElement.parentElement.parentElement.dataset.id;
		console.log(no);

		svc.wishlistRemove(no,
			result => {
				if (result.retCode == 'OK') {
					console.log(result);
					let price = document.querySelector('#p_price' + no).value; // 단가
					let cnt = document.querySelector('#p_num' + no).value; // 현재수량
					// 합계반영
					wishlist.wishlistCount -= cnt;
					wishlist.wishlistTotal -= price * cnt;
					wishlist.reCalc();
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
		document.querySelector('#sum_p_num span').textContent = wishlist.wishlistCount;
		document.querySelector('#sum_p_price span').textContent
			= wishlist.wishlistTotal.numberFormat();
	}, 

	changePNum: function(wishlistNo) {
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
		let productPrice = document.querySelector('#p_price' + wishlistNo).value; // 금액
		let cntElem = document.querySelector('#p_num' + wishlistNo);
		let sumElem = document.querySelector('#p_sum' + wishlistNo);

		let bvo = { wishlistNo, productCnt }
		svc.wishlistUpdate(bvo, //
			result => {
				console.log(result);
				cntElem.value = parseInt(cntElem.value) + productCnt; // 수량변경
				sumElem.innerText = (productPrice * cntElem.value).numberFormat() + "원";
				// 전체수량, 금액
				wishlist.wishlistCount += productCnt;
				wishlist.wishlistTotal += (productPrice * productCnt);
				wishlist.reCalc();
			},
			err => {
				console.log(err);
			})
	}, // end of changePNum

	delCheckedItem: function() {
		document.querySelectorAll('input:checked').forEach((item, idx) => {
			if (idx > 0) {
				let no = item.parentElement.parentElement.parentElement.dataset.id;
				svc.wishlistRemove(no,
					result => {
						if (result.retCode == 'OK') {
							console.log(result);
							let price = document.querySelector('#p_price' + no).value; // 단가
							let cnt = document.querySelector('#p_num' + no).value; // 현재수량
							// 합계반영
							wishlist.wishlistCount -= cnt;
							wishlist.wishlistTotal -= (price * cnt);
							wishlist.reCalc();
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
			svc.wishlistRemove(no,
				result => {
					if (result.retCode == 'OK') {
						console.log(result);
						let price = document.querySelector('#p_price' + no).value; // 단가
						let cnt = document.querySelector('#p_num' + no).value; // 현재수량
						// 합계반영
						wishlist.wishlistCount -= cnt;
						wishlist.wishlistTotal -= (price * cnt);
						wishlist.reCalc();
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
    	form.action = "basketList1.do"; // 주문 페이지 URL로 변경 필요
    	
    	 var items = document.querySelectorAll('.row.data');
    	 items.forEach(function(item, index) {
			
		 })
		 
		    document.body.appendChild(form);
		    form.submit();
	},
	
	// 선택된 상품 주문
    orderSelectedItem: function() {
        var form = document.createElement('form');
        form.method = 'post';
        form.action = "basketList1.do"; // 주문 페이지 URL로 변경 필요

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

wishlist.list();

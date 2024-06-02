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
					console.log(basket1);
					basket.basketCount += basket1.productCnt;
					basket.basketTotal += (basket1.productCnt * basket1.productPrice);

					const rowDiv = document.querySelector('div[data-id="0"]').cloneNode(true);
					rowDiv.style.display = 'block';
					rowDiv.setAttribute('data-id', basket1.basketNo);
					rowDiv.querySelector('div.img>img').setAttribute('src', './images/wear/' + basket1.productImg + '.jpg');
					rowDiv.querySelector('div.pname>span').innerText = basket1.productName;
					rowDiv.querySelector('div.pname').children[3].innerText = `사이즈 : ${basket1.productSize}`;
					rowDiv.querySelector('div.pname').children[4].innerText = `색깔 : ${basket1.productColor}`;
					rowDiv.querySelector('div.basketprice').childNodes[2].textContent = Number(basket1.productPrice).numberFormat() + "원";
					// 배송비
					rowDiv.querySelector('div.delivery_fee').value = basket1.deliveryfee;

					rowDiv.querySelector('div.basketprice input').value = basket1.productPrice;
					rowDiv.querySelector('div.basketprice input').setAttribute('id', 'p_price' + basket1.basketNo);

					rowDiv.querySelector('div.updown input').value = basket1.productCnt;
					rowDiv.querySelector('div.updown input').setAttribute('id', 'p_num' + basket1.basketNo);
					// event
					rowDiv.querySelector('div.updown input').onkeyup = () => basket.changePNum(basket1.basketNo);
					//rowDiv.querySelector('div.updown span').onclick = () => basket.changePNum(basket1.basketNo);
					//rowDiv.querySelector('div.updown span:nth-of-type(2)').onclick = () => basket.changePNum(basket1.basketNo);
					// 개별합계
					rowDiv.querySelector('div.sum').textContent = (basket1.productCnt * basket1.productPrice).numberFormat() + "원";
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
		let productCnt = document.querySelector(`#p_num${basketNo}`).value;
		let s = event.code;
		let productPrice = document.querySelector('#p_price' + basketNo).value; // 금액
		let cntElem = document.querySelector('#p_num' + basketNo).value;
		let sumElem = document.querySelector('#p_sum' + basketNo);

		let bvo = { basketNo, productCnt }
		svc.basketUpdate(bvo, //
			result => {
				if(result.retCode == "OK"){
					console.log(result);
					cntElem = Number(productCnt); // 수량변경
					sumElem.innerText = (Number(productPrice) * cntElem).numberFormat() + "원";
					// 전체수량, 금액
					if(s == 'ArrowUp'){
						basket.basketCount += 1;
						basket.basketTotal += (productPrice * 1);				
					}
					if(s == 'ArrowDown'){
						basket.basketCount -= 1;
						basket.basketTotal -= (productPrice * 1);	
					}
					basket.reCalc();	
				}
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
    	form.action = "orderForm.do"; 
    	
    	 document.querySelectorAll('.row.data').forEach((item) => {
			let no = item.dataset.id;
			svc.orderItem(no,
				result => {
					if (result.retCode == 'OK') {
						console.log(result);
					}
				},
				err => {
					console.log(err);
				});
		})
	},
	
	// 선택된 상품 주문
    orderSelectedItem: function() {
        const basketNo = new Array();
        let i = 0;
        var selectedItems = document.querySelectorAll('.row.data .check input[type="checkbox"]:checked');
        selectedItems.forEach(function(checkbox, index) {
			let s = checkbox.parentElement.parentElement.parentElement.dataset.id;
            if(s > 0){
				basketNo[i] = s;
				i++;
			}
        });
        location.href = `orderForm.do?form=basket&selete=seleted&bno=${basketNo}`;
        //form.submit();
    }
};

basket.list();

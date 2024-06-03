/**
 * 
 */

 function wishtobasket(){	
	let bno = event.target.parentElement.dataset.product_no;
	console.log(bno);
	menusvc.addBasket(bno,
			result => console.log(result),
			err => console.log(err)
		)
 }
 
 function insertWishList(){
	let pno = event.target.parentElement.dataset.product_no;
	menusvc.addWishList(pno,
			result => {
				if(result.productNo == pno){
					alert("관심상품 등록되었습니다.");
					wishCnt();
				}
				},
			err => console.log(err)
		)
 }

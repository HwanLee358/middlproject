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
			result => console.log(result),
			err => console.log(err)
		)
 }

/**
 * 
 */

 function insertBasket(){
	
	let bno = event.target.parentElement.dataset.product_no;
	menusvc.addBasket(bno,
			result => console.log(result),
			err => console.log(err)
		)
		
 }

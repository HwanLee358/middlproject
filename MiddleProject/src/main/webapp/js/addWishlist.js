/**
 * 
 */

  function insertWishlist(){
	
	let bno = event.target.parentElement.dataset.product_no;
	menusvc.addWishlist(bno,
			result => console.log(result),
			err => console.log(err)
		)
		
 }

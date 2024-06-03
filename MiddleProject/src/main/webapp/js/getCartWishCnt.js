/**
 * 
 */
wishCnt();
cartCnt();
function wishCnt(){
	fetch('wishCnt.do')
	     .then(resolve=> resolve.json())
	     .then(result =>{
			console.log(result);
			document.querySelector('.wish-btn .total-items').innerHTML = result.wishCount;
		 })
		 .catch(err => console.log(err))
}

function cartCnt(){
	fetch('basketCnt.do')
		.then(resolve=> resolve.json())
		.then(result => {
			console.log(result);
			document.querySelector('.main-btn .total-items').innerHTML = result.basketCount;
		})
		.catch(err => console.log(err))
}
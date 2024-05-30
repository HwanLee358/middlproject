/**
 * 
 */
document.querySelector('.payMent').addEventListener('click',function(){
	const postNo = new Array;
	let i = 0;
	document.querySelectorAll('.productInfo').forEach(e=>{
		postNo[i] = e.defaultValue;
		i++;
	})
	fetch('order.do',{
		method: 'post',
		headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
		body: 'pNo='+postNo
	})
		.then(resolve => console.log(resolve))
		.catch(errorCall => console.log(errorCall));
})
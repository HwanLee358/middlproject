/**
 * 
 */
document.querySelector('.payMent').addEventListener('click',function(){
	const postNo = new Array;
	let i = 0;
	let f = document.forms[0];
	let name = f.name.value;
	let phone = f.phone.value;
	let email = f.email.value;
	let address1 = f.address1.value;
	let address2 = f.address2.value;
	let address3 = f.address3.value;
	let address4 = f.address4.value;
	
	document.querySelectorAll('.productInfo').forEach(e=>{
		postNo[i] = e.defaultValue;
		i++;
	})
	fetch('order.do',{
		method: 'post',
		headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
		body: `pNo=${postNo}&name=${name}&phone=${phone}&email=${email}&address1=${address1}&address2=${address2}&address3=${address3}&address4=${address4}`
	})
		.then(resolve => console.log(resolve))
		.catch(errorCall => console.log(errorCall));
})
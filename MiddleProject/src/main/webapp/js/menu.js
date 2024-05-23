/**
 * 
 */
showList();
function showList() {
	const mainCategory = new Array;
	const subCategory = new Array;
	svc.menuList({ bno: 1 },
		result => {
			result.forEach(e => {
				let tmpl = document.querySelector('.xan.on').cloneNode(true);
				tmpl.setAttribute('style','display: inline-block;');
				
				document.querySelector('.gnb').appendChild(tmpl);
				console.log(e.main);
				if(e.sub == ''){
					console.log("확인");
				}
				console.log(e.sub);
			})
		},
		err => console.log(err)
	)
	console.log(mainCategory);
	console.log(subCategory);
}
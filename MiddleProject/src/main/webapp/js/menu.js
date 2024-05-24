/**
 * 
 */
showList();
function showList() {
	svc.menuList({ bno: 1 },
		result => {
			result.forEach(e => {
				let tmpl = document.querySelector('.xan.on').cloneNode(true);
				tmpl.setAttribute('style','display: inline-block;');
				tmpl.children[0].setAttribute('href', "?cate_no="+e.mainNo);
				tmpl.children[0].children[0].innerHTML = ' '+ e.main + ' <b></b>';
				if(e.sub == ''){
					tmpl.children[1].remove();
				}else{
					tmpl.children[1].children[0].remove();
					let ul = document.createElement('ul');
					e.sub.forEach(s =>{
						let li = document.createElement('li');
						let a = document.createElement('a');
						a.setAttribute('href','#');
						a.innerText = s;
						li.append(a);
						ul.append(li);
					})
					let i = 0;
					e.subNo.forEach(k =>{
						ul.childNodes[i].children[0].setAttribute('href',"#"+k);
						i++;
					})
					tmpl.children[1].append(ul);				
				}
				document.querySelector('.gnb').appendChild(tmpl);
				console.log(e);
			})
		},
		err => console.log(err)
	)
}
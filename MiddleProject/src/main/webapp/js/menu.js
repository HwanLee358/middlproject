/**
 * 
 */
showList();
function showList() {
	menusvc.menuList({ bno: 1 },
		result => {
			result.forEach(e => {
				let tmpl = document.querySelector('.xan.on').cloneNode(true);
				tmpl.setAttribute('style','display: inline-block;');
				tmpl.children[0].setAttribute('href', "list.do?cate_no="+e.mainNo);
				tmpl.children[0].children[0].innerHTML = ' '+ e.main + ' <b></b>';
				//let all_no = e.mainNo;
				if(e.sub == ''){
					tmpl.children[1].remove();					
				}else{
					tmpl.children[1].children[0].remove();
					let ul = document.createElement('ul');
					/*let all_li = document.createElement('li');
					let all_a = document.createElement('a');
					all_a.setAttribute('href',"#"+all_no);
					all_a.innerText = "All";
					all_li.append(all_a);
					ul.append(all_li);*/
					let str = new Array();
					e.sub.forEach(s =>{
						let li = document.createElement('li');
						let a = document.createElement('a');
						a.setAttribute('href','#');
						a.innerText = s;
						str.push(s);
						li.append(a);
						ul.append(li);
					})

					let i = 0;
					e.subNo.forEach(k =>{
						ul.childNodes[i].children[0].setAttribute('href',"list.do?cate_no="+k+"&name="+str[i]);
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

function requestSearch(e){
	let search = document.querySelector(e).value;
	window.location.href= 'search.do?keyword='+search;
}
function menuWishCnt(){
	
}
function menuBasketCnt(){
	
}


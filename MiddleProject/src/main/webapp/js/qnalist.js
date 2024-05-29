/**
 * 
 */

const QnAsvc = {
	qnaList(param={},successCall,errorCall){
		fetch('qnaList.do',{
			method: 'post',
			headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
			body: 'pno=' + param.pno + '&page=' + param.page
		})
			.then(resolve => resolve.json()) 
			.then(successCall)
			.catch(errorCall);
	},
	getTotalCount(qno = 1, successCall, errorCall) {
		fetch('getTotalCnt.do?qno=' + qno)
			.then(resolve => resolve.json())
			.then(successCall)
			.catch(errorCall);
	}
}


let page = 1;
qnaListshow();
//console.log(qnaNo);

function qnaListshow(){
	QnAsvc.qnaList({pno : qnaNo, page: page},
		result => {
			result.forEach(e =>{
				console.log(e);
				let tr = document.querySelector('.nbg').cloneNode(true);
				tr.style.display = '';
				let d = new Date(e.creationDate);
				tr.children[0].querySelector('.reviewnum').innerText = e.postNo;
				tr.children[2].querySelector('.reviewnum').children[0].setAttribute('href','qnaInfo.do?qno='+e.postNo);
				tr.children[2].querySelector('.reviewnum').children[0].innerText = e.postTitle;
				tr.children[3].querySelector('.reviewnum').innerText = e.userId;
				tr.children[4].querySelector('.reviewnum').innerText = d.getFullYear() +'-'+('0'+(d.getMonth()+1)).slice(-2)+'-'+('0'+d.getDate()).slice(-2);
				tr.children[5].querySelector('.reviewnum').innerText = e.views;
				let tbody = document.querySelector('.qna-list tbody');
				tbody.append(tr);
			})
		},
		err => console.log(err)
	)
}

/**
 * 
 */

const QnAsvc = {
	qnaList(param = {}, successCall, errorCall) {
		fetch('qnaList.do', {
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
console.log(qnaNo);

function qnaListshow() {
	QnAsvc.qnaList({ pno: qnaNo, page: page },
		result => {
			result.forEach(e => {
				let tr = document.querySelector('.nbg').cloneNode(true);
				tr.style.display = '';
				let d = new Date(e.creationDate);
				tr.children[0].querySelector('.reviewnum').innerText = e.postNo;
				tr.children[2].querySelector('.reviewnum').children[0].setAttribute('href', 'qnaInfo.do?qno=' + e.postNo + '&pno=' + qnaNo);
				tr.children[2].querySelector('.reviewnum').children[0].innerText = e.postTitle;
				tr.children[3].querySelector('.reviewnum').innerText = e.userId;
				tr.children[4].querySelector('.reviewnum').innerText = d.getFullYear() + '-' + ('0' + (d.getMonth() + 1)).slice(-2) + '-' + ('0' + d.getDate()).slice(-2);
				tr.children[5].querySelector('.reviewnum').innerText = e.views;
				let tbody = document.querySelector('.qna-list tbody');
				tbody.append(tr);
			})
			makePageInfo();
		},
		err => console.log(err)
	)
}

let pagination = document.querySelector('.paging-wrap .paging');
function makePageInfo() {
	QnAsvc.getTotalCount(qnaNo, PageList, err => console.log(err))

}
function PageList(result) {
	let totalCnt = 10;
	let startPage, endPage, realEnd;
	let prev, next;

	realEnd = Math.ceil(totalCnt / 5);

	endPage = Math.ceil(page / 5) * 5;
	startPage = endPage - 4;
	endPage = endPage > realEnd ? realEnd : endPage;

	prev = startPage > 1;
	next = endPage < realEnd;


	pagination.innerHTML = '';
	// a 태그 생성
	if (prev) {
		let aTag = document.createElement('a');
		aTag.setAttribute('data-page', startPage - 1);
		aTag.setAttribute('href', '#');
		aTag.innerHTML = "&laquo;";
		aTag.addEventListener('click', function(e) {
			e.preventDefault(); // a 태그는 페이지이동. 차단

			page = e.target.dataset.page;
			qnaListshow();
		})
		pagination.appendChild(aTag);
	}
	for (let pg = startPage; pg <= endPage; pg++) {
		let aTag = document.createElement('a');
		aTag.setAttribute('data-page', pg);
		aTag.setAttribute('href', pg);
		if (pg == page) {
			aTag.className = 'active';
		}
		aTag.innerHTML = pg;
		aTag.addEventListener('click', function(e) {
			e.preventDefault(); // a 태그는 페이지이동. 차단

			page = e.target.dataset.page;
			qnaListshow();
		})
		pagination.appendChild(aTag);
	}
	if (next) {
		let aTag = document.createElement('a');
		aTag.setAttribute('data-page', endPage + 1);
		aTag.setAttribute('href', '#');
		aTag.innerHTML = "&raquo;";
		aTag.addEventListener('click', function(e) {
			e.preventDefault(); // a 태그는 페이지이동. 차단

			page = e.target.dataset.page;
			qnaListshow();
		})
		pagination.appendChild(aTag);
	}
}
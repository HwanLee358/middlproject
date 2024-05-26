/**
 * 
 */

 // 페이징 생성.
let pagination = $('div.pagination');

function makePageInfo() {
	svc.getTotalCount(bno// param1
		, createPageList // param2
		, err => console.log(err))
}

function createPageList(result) {

	// 페이지 속성 지정.
	let totalCnt = result.totalCount;// 127;
	let startPage, endPage, realEnd;
	let prev, next;

	realEnd = Math.ceil(totalCnt / 5);
	endPage = Math.ceil(page / 5) * 5;
	startPage = endPage - 4;
	endPage = endPage > realEnd ? realEnd : endPage;
	prev = startPage > 1;
	next = endPage < realEnd;

	// a 태그 생성.
	pagination.html('');
	// 이전페이지 여부.
	if (prev) {
		let aTag = $('<a>&laquo;</a>')//
			.attr('href', '#')//
			.attr('data-page', startPage - 1);
		aTag.on('click', function(e) {
			e.preventDefault(); // a 태그는 페이지이동.
			page = $(e.target).data('page'); // 
			showList();
		})
		aTag.appendTo(pagination);
	}
	for (let pg = startPage; pg <= endPage; pg++) {
		let aTag = $('<a />').html(pg) //
			.attr('data-page', pg)//
			.attr('href', pg);
		if (pg == page) {
			//aTag.attr('class', 'active');
			aTag.addClass('active');
		}
		aTag.on('click', function(e) {
			e.preventDefault(); // a 태그는 페이지이동.
			page = e.target.dataset.page; // 
			showList();
		})
		pagination.append(aTag);
	}
	// 이후페이지 여부.
	if (next) {
		let aTag = $('<a>&raquo;</a>')//
			.attr('href', '#')//
			.attr('data-page', endPage + 1);
		aTag.on('click', function(e) {
			e.preventDefault(); // a 태그는 페이지이동.
			page = e.target.dataset.page; // 
			showList();
		})
		pagination.append(aTag);
	}

} // end of createPageList
// 수정기능 추가.
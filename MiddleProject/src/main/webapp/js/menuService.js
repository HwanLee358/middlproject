/**
 * 
 */
const svc = {
	// 댓글목록 => 페이지, 성공콜백, 실패콜백
	menuList(param = {}, successCall, errorCall) {
		fetch('header.do')
			.then(resolve => resolve.json()) // json -> 객체.
			.then(successCall)
			.catch(errorCall);
	}
}	
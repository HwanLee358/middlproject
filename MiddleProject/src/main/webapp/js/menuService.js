/**
 * 
 */
const menusvc = {
	// 댓글목록 => 페이지, 성공콜백, 실패콜백
	menuList(param = {}, successCall, errorCall) {
		fetch('header.do')
			.then(resolve => resolve.json()) // json -> 객체.
			.then(successCall)
			.catch(errorCall);
	},
	// 위시리스트 갯수
	wishCnt(param = {}, successCall, errorCall){
		fetch('wishCnt.do')
		    .then(resolve => resolve.json())
		    .then(successCall)
		    .catch(errorCall)
	},
	// 장바구니 갯수
	basketCnt(param = {}, successCall, errorCall){
		fetch('basketCnt.do')
		    .then(resolve => resolve.json())
		    .then(successCall)
		    .catch(errorCall)
	},
	addBasket(bno = 1, successCall, errorCall){
		fetch('addbasket.do',{
			method: 'post',
			headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
			body: 'bno=' + bno
		})
		    .then(resolve => resolve.json())
		    .then(successCall)
		    .catch(errorCall)
	}	    
}	
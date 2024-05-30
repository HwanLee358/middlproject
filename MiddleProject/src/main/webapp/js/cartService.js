/**
 * cartService.js
 */

const svc = {
	// 장바구니 목록.
	basketList(successCall, errorCall) {
		fetch('basketList.do')
			.then(resolve => resolve.json()) // json문자->객체.
			.then(successCall)
			.catch(errorCall);
	},
	wishList(successCall, errorCall) {
		fetch('wishList.do')
			.then(resolve => resolve.json()) // json문자->객체.
			.then(successCall)
			.catch(errorCall);
	},
	basketUpdate(bvo = {}, successCall, errorCall) {
		fetch('editBasket.do', {
			method: 'post',
			headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
			body: 'basketNo=' + bvo.basketNo + '&productCnt=' + bvo.productCnt
		})
			.then(resolve => resolve.json())
			.then(successCall)
			.catch(errorCall);
	},
	basketRemove(basketNo = 1, successCall, errorCall) {
		fetch('delBasket.do', {
			method: 'post',
			headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
			body: 'basketNo=' + basketNo
		})
			.then(resolve => resolve.json())
			.then(successCall)
			.catch(errorCall);
	},
	wishlistRemove(wishlistNo = 1, successCall, errorCall) {
		fetch('delWishList.do', {
			method: 'post',
			headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
			body: 'wishlistNo=' + wishlistNo
		})
			.then(resolve => resolve.json())
			.then(successCall)
			.catch(errorCall);
	},
	orderItem(basketNo = 1, successCall, errorCall) {
		fetch('orderbasket.do', {
			method : 'post',
			headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
			body: 'basketNo=' + basketNo
		})
			.then(resolve => resolve.json())
			.then(successCall)
			.catch(errorCall);
	}
	
}
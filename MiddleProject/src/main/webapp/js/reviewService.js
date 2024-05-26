/**
 * 
 */
const svr ={
	// 전체건수
	getTotalCount(rno = 1, successCall, errorCall) {
		fetch('reviewCnt.do?rno=' + rno)
			.then(resolve => resolve.json())	//{totalCount: 10}
			.then(successCall)
			.catch(errorCall);
	}
	
	
	
	
	
	
}
 
 
 
 
 
 
 
 
 
 
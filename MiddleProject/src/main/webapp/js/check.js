
        function check_pw(){
 
            var pw = document.getElementById('pw').value;
            var SC = ["!","@","#","$","%"];
            var check_SC = 0;
 
            if(pw.length < 4 || pw.length>16){
                window.alert('비밀번호는 4글자 이상, 16글자 이하만 이용 가능합니다.');
                document.getElementById('pw').value='';
            }
        // 비번일치
            for(var i=0;i<SC.length;i++){
                if(pw.indexOf(SC[i]) != -1){
                    check_SC = 1;
                }
            }
            if(check_SC == 0){
                window.alert('!,@,#,$,% 의 특수문자가 들어가 있지 않습니다.')
                document.getElementById('pw').value='';
            }
            if(document.getElementById('pw').value !='' && document.getElementById('pw2').value!=''){
                if(document.getElementById('pw').value==document.getElementById('pw2').value){
                    document.getElementById('check').innerHTML='비밀번호가 일치합니다.'
                    document.getElementById('check').style.color='blue';
                }
                else{
                    document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';
                    document.getElementById('check').style.color='red';
                     var input = document.getElementById("pw2");
    	               input.value = "";
    	               
                }
            }
        }

        
        
        
        // 중복체크
        function checkUserId() {
    	    var userId = document.getElementsByName("userId")[0].value;
    	    // AJAX 요청으로 서버에 아이디 중복 체크 요청
    	    // 서버 응답에 따라 아이디가 존재하면 버튼을 비활성화하고, 존재하지 않으면 버튼을 활성화
    	    var xhr = new XMLHttpRequest();
    	    xhr.open("POST", "check.do");
    	    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    	    xhr.onreadystatechange = function () {
    	        if (xhr.readyState === 4 && xhr.status === 200) {
    	            var response = JSON.parse(xhr.responseText);
    	            if (response.status === "DUPLICATED") {
    	                alert("아이디가 이미 존재합니다.");    	
    	               var input = document.getElementById("member_id");
    	               input.value = "";
    	               
    	            } else {
    	                alert("사용 가능한 아이디입니다.");
    	            }
    	        }
    	    };
    	    xhr.send("userId=" + userId);
    	}
    	
 			function regist(){
			
		var id = $("#member_id").val();
		
				
	  if(idc == false || id === ""){
	      alert('아이디를 확인 해 주세요')
	  }else if(overChk == false){
	      alert('아이디 중복 검사를 해주세요')
	  }else{
	      $('form').submit();
	  } 
	} ;
        

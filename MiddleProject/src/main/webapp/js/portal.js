

//카카오 로그인
function kakaoLogin() {
  Kakao.init('javascript 키 입력');
  Kakao.Auth.login({
    success: function () {
      Kakao.API.request({
        url: '/v2/user/me',
        success: function (response) {
          const token = response.id;
          apiLogin(`kakao_${token}`, `kakao_pw_${token}`, 1);
        },
        fail: function (error) { console.log(error) },
      })
    },
    fail: function (error) {
      console.log(error)
    },
  })
}

//네이버 로그인
let naverLogin = new naver.LoginWithNaverId(
  {
    clientId: "client id 입력",
    callbackUrl: "callback url 입력",
    isPopup: false,
    callbackHandle: true
  }
);
naverLogin.init();
window.addEventListener('load', function () {
  naverLogin.getLoginStatus(function (status) {
    if (status) {
      const token = naverLogin.user.id;
      apiLogin(`naver_${token}`, `naver_pw_${token}`, 2);
    }
  });
});
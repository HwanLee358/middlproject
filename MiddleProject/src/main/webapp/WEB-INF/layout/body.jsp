<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>

.main_top .swiper-container {
    width: 100%;
    height: 100%;
}
.swiper-container {
    margin-left: auto;
    margin-right: auto;
    position: relative;
    overflow: hidden;
    z-index: 1;
}
.swiper-wrapper {
	transform: translate3d(0, 0, 0);
}
.swiper-wrapper {
    position: relative;
    width: 100%;
    height: 100%;
    z-index: 1;
    display: -webkit-box;
    display: -moz-box;
    display: -ms-flexbox;
    display: -webkit-flex;
    display: flex;
    -webkit-transition-property: -webkit-transform;
    -moz-transition-property: -moz-transform;
    -o-transition-property: -o-transform;
    -ms-transition-property: -ms-transform;
    transition-property: transform;
    -webkit-box-sizing: content-box;
    -moz-box-sizing: content-box;
    box-sizing: content-box;
}
.main_top .swiper-slide {
    height: 100%;
    text-align: center;
    background: #fff;
    display: -webkit-box;
    display: -ms-flexbox;
    display: -webkit-flex;
    display: flex;
    -webkit-box-pack: center;
    -ms-flex-pack: center;
    -webkit-justify-content: center;
    justify-content: center;
    -webkit-box-align: center;
    -ms-flex-align: center;
    -webkit-align-items: center;
    align-items: center;
}
.main_top .swiper-slide a {
    display: block;
    width: 100%;
    height: 100%;
    background-repeat: no-repeat;
    background-position: center center;
    background-size: auto 100%;
}
.main_top .swiper-slide a img {
    max-width: 100%;
}
</style>
<div class="main_top" style="position:relative; margin:0 0 100px;">
			<div class="swiper-container swiper-container-fade swiper-container-horizontal">
				<div class="swiper-wrapper">
					<div class="swiper-slide swiper-slide-duplicate">
						<a href="#">
							<img src="images/main_banner_4_2.jpg">
						</a>
					</div>
				</div>
			</div>
		</div>
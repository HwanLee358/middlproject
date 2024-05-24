<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>
.contents.wide {
    width: 100%;
    max-width: 100%;
    min-width: 1240px;
}
.contents {
    position: relative;
    width: 100%;
    max-width: 1600px;
    margin: 0 auto;
    padding: 70px 20px 50px;
    box-sizing: border-box;
}
.contents:after, .contents:before {
    content: "";
    display: block;
    clear: both;
    zoom: 1;
    width: 100%;
    height: 0;
    font-size: 0;
    line-height: 0;
    overflow: hidden;
}
.xans-product-menupackage {
    margin: 0 0 27px;
}
.xans-product-menupackage .title {
    min-height: 30px;
    padding: 10px 0 60px;
    text-align: center;
}
.xans-product-menupackage .title .banner {
    margin: 0 0 20px;
}
.xans-product-menupackage .title h2 {
    display: block;
    background: none;
    margin-bottom: 10px;
    margin: 0 auto;
    text-align: center;
    padding: 0 0 5px;
}
.xans-product-menupackage .title h2 span {
    position: relative;
    display: inline-block;
    zoom: 1;
    font-size: 24px;
    letter-spacing: 3px;
    color: #222;
    background: #fff;
}
.list_cate_sub {
    text-align: center;
    padding: 5px 10px 0;
}
.list_cate_sub li {
    display: inline-block;
    zoom: 1;
    vertical-align: top;
}
.list_cate_sub li a {
    display: inline-block;
    zoom: 1;
    padding: 10px;
    color: #999;
    font-size: 14px;
    position: relative;
}
.list_normal {
    position: relative;
    max-width: 1600px;
    margin: 0 auto 30px;
}
.ec-base-product {
    width: 100%;
    max-width: 1600px;
    margin: 0 auto 100px;
}
.ec-base-product .prdList {
    display: table;
    width: 100%;
    min-width: 1400px;
    max-width: 1600px;
    margin: 0 auto;
    font-size: 0;
    line-height: 0;
    padding: 0 2%;
    box-sizing: border-box;
}
.ec-base-product ul.grid4 > li {
    width: 25%;
}
.ec-base-product .prdList > li {
    position: relative;
    display: inline-block;
    margin: 0 0 50px;
    color: #757575;
    vertical-align: top;
}	
.ec-base-product .prdList .thumbnail {
    position: relative;
    margin: 0 15px 15px;
    text-align: center;
}
.ec-base-product .prdList .thumbnail .prdImg {
    position: relative;
}
.ec-base-product .prdList .thumbnail .prdImg > a > img {
    width: 100%;
    box-sizing: border-box;
}
.ec-base-product .prdList .thumbnail a img {
    max-width: 100%;
    box-sizing: border-box;
}

.ec-base-product .prdList .thumbnail .icon {
    margin: 0;
    vertical-align: middle;
    padding: 0;
    width: 100%;
    border: 0;
}
.ec-base-product .prdList .icon {
    position: absolute;
    bottom: 0;
    left: 0;
    opacity: 0;
}
.ec-base-product .prdList .thumbnail .button {
    float: left;
    margin: 0;
}
.ec-base-product .prdList .thumbnail .button > span {
    background: rgba(255, 255, 255, 0.5);
    width: 37px;
    height: auto;
    text-align: center;
    display: inline-block;
    float: left;
    transition: all 0.4s;
}
.ec-base-product .prdList .thumbnail .button img {
    cursor: pointer;
}
.ec-base-product .prdList .thumbnail .button > span {
    background: rgba(255, 255, 255, 0.5);
    width: 37px;
    height: auto;
    text-align: center;
    display: inline-block;
    float: left;
    transition: all 0.4s;
} 
.ec-base-product .prdList .thumbnail .button > span:hover {
    background: rgba(255, 255, 255, 0.9);
}
.ec-base-product .prdList li:hover .icon {
    opacity: 1;
    transition: all 1s;
}
.ec-base-product .prdList .description, .ec-base-product .spec li, .ec-base-product .prdList .promotion {
    text-align: left;
}
.ec-base-product .prdList .description {
    margin: 0 auto;
    padding: 0 15px;
    font-size: 12px;
    line-height: 18px;
    position: relative;
}
.ec-base-product .prdList .description .name {
    display: block;
    font-weight: normal;
    padding-bottom: 5px;
    letter-spacing: 1.5px;
}
.ec-base-product .prdList .description .name a {
    color: #2e2e2e;
}
.ec-base-product .prdList .description .name {
    display: block;
    font-weight: normal;
    padding-bottom: 5px;
    letter-spacing: 1.5px;
}
.ec-base-product .spec {
    margin: 0;
    padding: 0;
}
</style>
</head>
<body>
	<div class="contents wide">
		<div class="xans-product-menupackage">
			<div class="xans-product-headcategory title">
				<p class="banner"></p>
				<!-- main -->
				<h2><span>TOP</span></h2>
				<!-- sub -->
				<ul class="list_cate_sub">
					<li><a href="#">All</a></li>
					<li><a href="#">니트티/베스트</a></li>
					<li><a href="#">셔츠/블라우스</a></li>
					<li><a href="#">맨투맨/후드</a></li>
					<li><a href="#">티셔츠</a></li>
				</ul>
			</div>
		</div>
		<!-- 추천상품 -->
		<div class=""></div>
		<!-- 일반상품 -->
		<div class="list_normal">
			<div class="ec-base-product">
				<ul class="prdList grid4">
					<li id="" class="xans-recode-">
						<div class="thumbnail">
							<div class="prdlmg">
								<a href="#" name=""><img src="images/리모라운드넥니트.gif" id="" alt=""></a>
							</div>
							<div class="icon">
								<div class="button">
										<span>
											<img src="images/icon_202204071148303300.png" class="icon_img ec-product-listwishicon" alt="">
										</span>
										<span>
											<img src="images/icon_202204071148220700.png" class="ec-admin-icon cart">
										</span>
								</div>									
							</div>
						</div>
						<div class="description">
							<strong class="name">
								<a href="#">
									<span class="title displaynone"></span>
									<b>
										<span style="font-size:12px;color:#555555;">리모라운드넥니트</span><b></b>
									</b>
								</a>
							</strong>
							<ul class="xans-element- xans-product xans-product-listitem spec">
								<li class="xans-record-">
									<span style="font-size:12px;color:#000000;font-weight:bold;">12,900</span>
								</li>
								<li class="xans-record-">
									<strong class="title">
										<span style="font-size:10px;color:#333333;font-weight:bold;">리뷰</span> :
									</strong>
									<span style="font-size:10px;color:#333333;font-weight:bold;">1</span>
								</li>
							</ul>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>
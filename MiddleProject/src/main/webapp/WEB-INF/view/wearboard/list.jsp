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
								<a href=""><img src="" id="" alt=""></a>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>
package com.wear.review.service;

import com.wear.review.vo.BasketVO;
import com.wear.review.vo.ProductInfoVO;
import com.wear.review.vo.ProductVO;
import com.wear.wishlist.vo.WishVO;

public interface ProductService {

	ProductVO getProduct(int proNo);

	ProductInfoVO getProductInfoNo(ProductInfoVO pvo);

	boolean addBasket(BasketVO bvo);
	int getBasket(BasketVO gb);
	
	
	boolean addWish(WishVO wvo);

}
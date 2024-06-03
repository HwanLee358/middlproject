<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="button-container">
    <a href='memberManagement.do' class='members'>회원관리</a>
    <a href='#' class='product'>제품관리</a>
</div>

<style type="text/css">
body {
    font-size: 14px;
    font-family: Arial, sans-serif;
}

.button-container {
    display: flex;
    justify-content: space-between;
    width: 1000px;
    margin: 0 auto;
    padding-top: 20px;
    margin: 100px;
}

.members, .product {
    display: flex;
    justify-content: center;
    align-items: center;
    font-weight: bold;
    text-decoration: none;
    font-family: Arial;
    font-size: 35px;
    width: 200px;
    height: 100px;
    padding: 35px;
    border-radius: 14px;
    text-shadow: -1px -1px 0px;
    text-align: center;
}

.members {
    box-shadow: inset #ffffff 0px 5px 33px -1px, #f7c3f0 2px 23px 19px;
    background: linear-gradient(#ffebf4, #ffc4e1);
    color: #e378c8;
    border: 7px solid #f5badb;
}

.members:active {
    box-shadow: inset #ffffff 0px 5px 33px -1px, #f7c3f0 2px 0 19px;
    position: relative;
    top: 23px;
}

.members:hover {
    background: linear-gradient(#ffc4e1, #ffebf4);
}

.product {
    box-shadow: inset #ffffff 0px 5px 33px -1px, #acc293 2px 23px 19px;
    background: linear-gradient(#eaf7d7, #e3f5d0);
    color: #739c43;
    border: 5px solid #e3f5d0;
}

.product:active {
    box-shadow: inset #ffffff 0px 5px 33px -1px, #acc293 2px 0 19px;
    position: relative;
    top: 23px;
}

.product:hover {
    background: linear-gradient(#e3f5d0, #eaf7d7);
}
</style>

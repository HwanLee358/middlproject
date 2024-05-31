<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="css/wearList.css" rel="stylesheet" />
<style>
input[type=text], select, textarea{
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  resize: vertical;
}

label {
  padding: 12px 12px 12px 0;
  display: inline-block;
}

input[type=submit] {
  background-color: #04AA6D;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  float: right;
}

input[type=submit]:hover {
  background-color: #45a049;
}

.container {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
  width: 1200px;
  margin: auto;
}

.col-25 {
  float: left;
  width: 20%;
  margin-top: 6px;
}

.col-75 {
  float: left;
  width: 70%;
  margin-top: 6px;
}

/* Clear floats after the columns */
.row::after {
  content: "";
  display: table;
  clear: both;
}
</style>	
<div class="xans-product-menupackage">
	<div class="xans-product-headcategory title">
		<p class="banner"></p>
		<!-- main -->
		<h2>
			<span>Q&A</span>
		</h2>
		<!-- sub -->
	</div>
</div>
<div class="container">
  <form action="qnaWrite.do" method="get">
  <div class="row">
    <div class="col-25">
      <label for="title">제목</label>
    </div>
    <div class="col-75">
      <input type="text" id="ntitle" name="title" placeholder="제목을 입력해주세요">
    </div>
  </div>
  <div class="row">
    <div class="col-25">
      <label for="writer">작성자</label>
    </div>
    <div class="col-75">
      <input type="text" value="${logId }" disabled>
      <input type="hidden" name="writer" value="${logId }">
    </div>
  </div>
  <div class="row">
    <div class="col-25">
      <label for="subject">SUBJECT</label>
    </div>
    <div class="col-75">
      <select id="nsubject" name="subject">
        <option value="상품문의">상품문의</option>
        <option value="배송문의">배송문의</option>
        <option value="반품문의">반품문의</option>
      </select>
    </div>
  </div>
  <div class="row">
    <div class="col-25">
      <label for="content">내용</label>
    </div>
    <div class="col-75">
      <textarea id="ncontent" name="content" placeholder="내용을 입력해주세요.." style="height:200px"></textarea>
    </div>
  </div>
  <br>
	  <div class="row">
	    <input type="submit" value="Submit">
	  </div>
  <input type="hidden" name="pno" value="${pNo }">	  
  </form>
</div>
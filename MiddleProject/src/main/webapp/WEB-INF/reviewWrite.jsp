<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="write-container">
	<div class="v5_41">
		<form action="reviewWrite.do" method="post"
			enctype="multipart/form-data">
			<div class="v5_42">Write a Review</div>

			<div class="v5_44"></div>

			<div class="v5_45"></div>

			<div class="v5_49">
				<input type="text" name="title" placeholder="Review Title"
					class="v5_49" required>
			</div>

			<div class="v5_50">
				<input type="file" name="file" class="v5_50" required>
			</div>

			<div class="v5_51">
				<textarea name="content" placeholder="Review Content" class="v5_67"
					required></textarea>
			</div>

			<div class="v5_52">
				<span class="v5_55">5</span> <input type="hidden" name="rating"
					value="5">
			</div>

			<div class="v5_57">
				<input type="submit" value="Submit" class="v5_58">
			</div>
		</form>
	</div>
</div>
	
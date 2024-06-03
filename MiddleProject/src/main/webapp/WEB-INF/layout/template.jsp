<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>어디든 Wear</title>
<style type="text/css">
#JD-Container {
	padding-top: 120px;
}
</style>
<link rel="stylesheet" href="css/header.css">
<link rel="stylesheet" href="css/footer.css">
<link rel="stylesheet" href="css/LineIcons.3.0.css">
</head>
<body id="JD-COMMON">	
	<!-- Header-->
	<tiles:insertAttribute name="header" />
	<!-- Section-->
	<div id="JD-Container">
		<tiles:insertAttribute name="body" />
	</div>
	<!-- Footer-->
	<tiles:insertAttribute name="footer" />
</body>
</html>
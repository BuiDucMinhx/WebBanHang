<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Category Management</title>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light pl-5 pr-5">
		<a class="navbar-brand" href="#">HIDDEN BRAND</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNavDropdown">
			<ul class="navbar-nav">
				<li class="nav-item active"><a class="nav-link" href="#">Home
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Features</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="#">Pricing</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#"
					id="navbarDropdownMenuLink" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"> Dropdown link </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
						<a class="dropdown-item" href="#">Action</a> <a
							class="dropdown-item" href="#">Another action</a> <a
							class="dropdown-item" href="#">Something else here</a>
					</div></li>
				<form class="form-inline " style="right: 50; position: absolute;">
					<input class="form-control mr-sm-2" type="search"
						placeholder="Search" aria-label="Search">
					<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
				</form>
			</ul>
		</div>
	</nav>
	<div class="row pl-5 pr-5">
		<div class="col-9">
			<h3>CATEGORY MANAGEMENT</h3>
			<jsp:include page="_form.jsp" />
			<hr>
			<jsp:include page="_table.jsp" />
		</div>
		<div class="col-3">
			<ul class="list-group">
				<li class="list-group-item">Dapibus ac facilisis in</li>
				<li class="list-group-item list-group-item-primary">This is a
					primary list group item</li>
				<li class="list-group-item list-group-item-secondary">This is a
					secondary list group item</li>
				<li class="list-group-item list-group-item-success">This is a
					success list group item</li>
				<li class="list-group-item list-group-item-danger">This is a
					danger list group item</li>
				<li class="list-group-item list-group-item-warning">This is a
					warning list group item</li>
				<li class="list-group-item list-group-item-info">This is a info
					list group item</li>
				<li class="list-group-item list-group-item-light">This is a
					light list group item</li>
				<li class="list-group-item list-group-item-dark">This is a dark
					list group item</li>
			</ul>
		</div>
	</div>
</body>

</html>
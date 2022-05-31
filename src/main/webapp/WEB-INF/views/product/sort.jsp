<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css"
	rel='stylesheet' type='text/css'>

<div class="container">
	<div class="row">

		<p></p>
		<h1>SORT TABLE BY ${field}</h1>


		<div class="col-md-10 col-md-offset-1">

			<div class="panel panel-default panel-table">
				
				<div class="panel-body">
					<table class="table table-striped table-bordered table-list">
						<thead>
							<tr>
								<th><a href="/product/sort?field=id">Id</a></th>
								<th><a href="/product/sort?field=name">Name</a></th>
								<th><a href="/product/sort?field=price">Price</a></th>
								<th><a href="/product/sort?field=createDate">Date</a></th>
							</tr>
						</thead>
						<tbody>

							<c:forEach var="item" items="${items}">
								<tr>
									<td>${item.id}</td>
									<td>${item.name}</td>
									<td>${item.price}</td>
									<td>${item.createDate}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>

				</div>
				<div class="panel-footer">
					
				</div>
			</div>

		</div>
	</div>
</div>
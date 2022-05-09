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
		<h1>Pagination</h1>
		<div class="col-md-10 col-md-offset-1">
			<div class="panel panel-default panel-table">
				<div class="panel-body">
					<table class="table table-striped table-bordered table-list">
						<thead>
							<tr>
								<th>Id</th>
								<th>Name</th>
								<th>Price</th>
								<th>Date</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${page.content}">
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
					<div class="row">
						<div class="col col-xs-4">Page ${page.number+1} of
							${page.totalPages}</div>
						<div class="col col-xs-8">
							<a href="/product/page?p=0">First</a>| <a
								href="/product/page?p=${page.number-1}">Previous</a>| <a
								href="/product/page?p=${page.number+1}">Next</a>| <a
								href="/product/page?p=${page.totalPages-1}">Last</a>
							<ul>
								<li>Số thực thể hiện tại: ${page.numberOfElements}</li>
								<li>Trang số: ${page.number+1}</li>
								<li>Kích thước trang: ${page.size}</li>
								<li>Tổng số thực thể: ${page.totalElements}</li>
								<li>Tổng số trang: ${page.totalPages}</li>
							</ul>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>
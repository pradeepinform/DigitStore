<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register-User</title>
<%@include file="component/common_css_js.jsp"%>
</head>
<body style="background-color:#ffe6e6;">
	<%@include file="component/navbar.jsp"%>
	<div class="container-fluid">

		<div class="row mt-5">
			<div class="col-md-4 offset-md-4">

				<div class="card">

					<div class="card-body px-5">
						 <div class="container text-center">
		
		</div> 

						<h2 class="text-center my-3">Sign up Here</h2>

						<form action="RegiterServlet" method="post">


							<div class="form-group">
								<label for="name">Customer Name</label> <input
									name="customer_name" type="name" class="form-control" id="name"
									aria-describedby="namehelp" placeholder="Enter Name">

							</div>


							<div class="form-group">
								<label for="email">Customer Email</label> <input
									name="customer_email" type="email" class="form-control"
									id="email" aria-describedby="emailHelp"
									placeholder="Enter Email">

							</div>

							<div class="form-group">
								<label for="password">Customer Password</label> <input
									name="customer_password" type="password" class="form-control"
									id="password" aria-describedby="passwordHelp"
									placeholder="Enter Password">

							</div>

							<div class="form-group">
								<label for="phone">Customer Phone</label> <input
									name="customer_phone" type="number" class="form-control"
									id="phone" aria-describedby="phoneHelp"
									placeholder="Enter phone">

							</div>

							<div class="form-group">
								<label for="address">Customer Address</label>
								<textarea name="customer_address" style="height: 100px"
									class="form-control" id="exampleFormControlTextarea1" rows="3"
									placeholder="Enter your address"></textarea>
							</div>

							<div class="container text-center">
								<button class="btn btn-outline-success">Register</button>
								<button class="btn btn-outline-warning">Reset</button>



							</div>
						</form>



					</div>


				</div>

			</div>


		</div>


	</div>
	<%@include file="component/common_modals.jsp" %>
</body>
</html>
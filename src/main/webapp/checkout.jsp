

<%


Customer customer = (Customer) session.getAttribute("current-customer");

if (customer == null) {
	session.setAttribute("message", "You are not logged in!!");
	response.sendRedirect("login.jsp");
	return;

} 



%>








<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>checkout</title>
<%@include file="component/common_css_js.jsp"%>

</head>
<body>
	<%@include file="component/navbar.jsp"%>
	<div class="container">

		<div class="row mt-5">
			<div class="col-md-6">
				<!-- card -->
				<div class="card">
					<div class="cart-body">
						<h3 class="text-center mb-2">Your selected item</h3>
						<div class="cart-body"></div>


					</div>



				</div>


			</div>
			<div class="col-md-6">
				<!-- form details -->
				<div class="card">
					<div class="cart-body">
						<h3 class="text-center mb-2">Your details for orders</h3>

						<form action="">

							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
								  value="<%=customer.getCustomerEmail() %>"	type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email">

							</div>

							<div class="form-group">
								<label for="name">Your name</label> <input value="<%=customer.getCustomerName() %>" type="text"
									class="form-control" id="name" aria-describedby="nameHelp"
									placeholder="Enter name">
							</div>
							
							<div class="form-group">
								<label for="name">Your phone no</label> <input value="<%=customer.getCustomerPhone() %>" type="text"
									class="form-control" id="name" aria-describedby="nameHelp"
									placeholder="Enter phone no">
							</div>
							
							<div class="form-group">
								<label for="exampleFormControlTextarea1">Your Address</label>
								<textarea value="<%=customer.getCustomerAddress()  %>" class="form-control" id="exampleFormControlTextarea1"
									placeholder="Enter Your Address" rows="3"></textarea>
							</div>


							<div class="container text-center">

								<button class="btn btn-outline-success">Buy Now</button>
								<button class="btn btn-outline-primary ">Continue Buy</button>

							</div>

						</form>

					</div>



				</div>

			</div>

		</div>

	</div>

	<%@include file="component/common_modals.jsp"%>
</body>
</html>
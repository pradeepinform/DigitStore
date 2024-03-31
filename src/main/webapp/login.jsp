<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer-Login</title>
<%@include file="component/common_css_js.jsp"%>
</head>
<body >

	<%@include file="component/navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card mt-3">


					<div class="card-header custom-bg text-white text-center">

						<h3>Login Here</h3>

					</div>
</div>
					<div class="card-body">
					
					<%@include file="component/message.jsp" %>

						<form action="LoginServlet" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									name="email" type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email">
				  
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									name="password" type="password" class="form-control" id="exampleInputPassword1"
									placeholder="Password">
							</div>
							
							<a href="register.jsp" class="text-center d-block mb-2">if not registered click here</a>
							<div class="container text-center">
							
							<button type="submit" class="btn btn-primary border-0  ">Submit</button>
							<button type="reset" class="btn btn-warning border-0">Reset</button>
							
							</div>
						</form>

					


			</div>

		</div>
</div>

	</div>
<%@include file="component/common_modals.jsp" %>
</body>
</html>
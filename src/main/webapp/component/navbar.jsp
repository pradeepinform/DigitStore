<%@page import="com.india.digit.shop.entity.Customer"%>

<%


Customer  customer1 =(Customer)session.getAttribute("current-customer");

%>


<nav class="navbar navbar-expand-lg navbar-dark  custom-bg">
	<div class="container">

		<a class="navbar-brand" href="index.jsp">hub-shop</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="index.jsp">Home <span class="sr-only">(current)</span></a></li>
<li class="nav-item active"><a class="nav-link"
					href="material.jsp">Material <span class="sr-only">(current)</span></a></li>

					
					
					

			</ul>
			
			<ul class="navbar-nav ml -auto">
			
			<li class="nav-item active">
			<a class="nav-link" href="#" data-toggle="modal" data-target="#cart"> <i class="fa fa-cart-plus" style="font-size:20px;"></i><span class="ml-0 cart-items">(0)</span></a>
			
			</li>

<%

if(customer1==null)
{
	%>
	
	
				<li class="nav-item active"><a class="nav-link"
					href="login.jsp">Login </a></li>

				<li class="nav-item active"><a class="nav-link"
					href="register.jsp">Register </a>
					</li>
	
	<% 
	
}
else{
	%>
	<li class="nav-item active"><a class="nav-link"
					href="<%= customer1.getCustomerType().equals("admin")?"admin.jsp":"normal.jsp"%>"><%=customer1.getCustomerName() %> </a></li>

				<li class="nav-item active"><a class="nav-link"
					href="LogoutServlet">Logout </a>
					</li>
	
	<% 
}

%>


			</ul>

		</div>


	</div>
</nav>
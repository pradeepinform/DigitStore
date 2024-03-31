
<%@page import="com.india.digit.shop.helper.Helper"%>
<%@page import="com.india.digit.shop.entity.Category"%>
<%@page import="com.india.digit.shop.dao.CategoryDao"%>
<%@page import="com.india.digit.shop.entity.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.india.digit.shop.dao.ProductDao"%>
<%@page import="com.india.digit.shop.entity.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hub-online-shop</title>
<%@include file="component/common_css_js.jsp"%>

<script type="text/javascript"></script>

</head>
<body>
	<%@include file="component/navbar.jsp"%>
	<div class="container-fluid">

		<div class="row mt-3 mx-2">



			<%
			String cat = request.getParameter("category");
			// out.println(cat);

			ProductDao dao = new ProductDao(FactoryProvider.getFactory());

			List<Product> list = null;
			if (cat == null || cat.trim().equals("all")) {
				list = dao.getAllProducts();

			} else {
				int cid = Integer.parseInt(cat.trim());
				list = dao.getAllProductById(cid);
			}

			//List<Product> list=dao.getAllProducts();
			CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
			List<Category> clist = cdao.getCategories();
			%>

			<!--show category  -->


			<div class="col-md-2">

				<div class="list-group mt-4">
					<a href="index.jsp?category=all"
						class="list-group-item list-group-item-action active"> All
						Products </a>



					<%
					for (Category c : clist) {
					%>

					<a href="index.jsp?category=<%=c.getCategory_Id()%>"
						class="list-group-item list-group-item-action"><%=c.getCategory_Title()%></a>

					<%
					}
					%>

				</div>
			</div>

			<!--show products  -->

			<div class="col-md-10">

				<!-- row -->
				<div class="row mt-3">
					<!--col:12  -->
					<div class="col-md-12">
						<div class="card-columns">

							<!--traversing products  -->

							<%
							for (Product p : list) {
							%>
							<!-- Product Card -->
							<div class="card product-card">

								<div class="text-center">
									<h5 class="card-title"><%=p.getProduct_Name()%></h5>
								</div>
								<hr>
								<div class="container text-center">
									<img alt="" src="image/products/<%=p.getProduct_Photo()%>"
										style="max-height: 250px; max-width: 200px; width: auto;"
										class="card-img-top m-4">

								</div>

								<hr>
								


								<div class="card-body">

									
									<p class="card-text">
									
									
										 <%=Helper.get10Words(p.getProduct_Description())%> 
										 
										
										 
																	
									</p>
									
									
									
									<div class="card-footer text-center">
										<a href="<%=p.getLink() %>"><button class="btn custom-bg text-white " >Buy Now</button></a>
										 <button class="btn custom-bg text-white m-2 "
											onclick="add_to_cart(<%=p.getProduct_Id()%>,<%=p.getProduct_Price()%>, '<%=p.getProduct_Name()%>', '<%=p.getProduct_Quantity()%>')">Add
											Card</button>
										<button class="btn btn-outline-warning ">
											<span class="text-secondary ">&#36;<%=p.getProduct_Price()%>
											</span>
										</button>

									</div>


								</div>
							</div>






							<%
							}

							if (list.size() == 0) {
							out.println("<h2>No item in this Category</h2>");
							}
							%>

						</div>

					</div>


				</div>

			</div>


		</div>
	</div>


 <%@include file="component/common_modals.jsp" %>


</body>
</html>





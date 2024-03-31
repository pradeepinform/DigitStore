<%@page import="java.util.Map" %>
	<%@page import="com.india.digit.shop.helper.Helper" %>
		<%@page import="com.india.digit.shop.entity.Category" %>
			<%@page import="java.util.List" %>
				<%@page import="com.india.digit.shop.entity.FactoryProvider" %>
					<%@page import="com.india.digit.shop.dao.CategoryDao" %>
						<%@page import="com.india.digit.shop.entity.Customer" %>
							<% Customer customer=(Customer) session.getAttribute("current-customer"); if
								(customer==null) { session.setAttribute("message", "You are not logged in!!" );
								response.sendRedirect("login.jsp"); return; } else { if
								(customer.getCustomerType().equals("normal")) {
								session.setAttribute("message", "You are not admin ! do not access this page" ); return;
								} } %>


								<% CategoryDao cdao=new CategoryDao(FactoryProvider.getFactory()); List<Category> list =
									cdao.getCategories();


									//getting count

									Map<String,Long> m = Helper.getCount(FactoryProvider.getFactory());



										%>





										<%@ page language="java" contentType="text/html; charset=UTF-8"
											pageEncoding="UTF-8" %>
											<!DOCTYPE html>
											<html>

											<head>
												<meta charset="UTF-8">
												<title>Admin</title>
												<%@include file="component/common_css_js.jsp" %>
											</head>

											<body>


												<%@include file="component/navbar.jsp" %>

													<div class="container admin">

														<div class="container-fluid mt-3">
															<%@include file="component/message.jsp" %>

														</div>


														<div class="row mt-3">
															<!-- first col -->
															<div class="col-md-4">
																<!-- first box -->
																<div class="card">
																	<div class="card-body text-center">

																		<div class="container">
																			<img style="max-width: 120px;"
																				class="image-fluid rounded-circle"
																				alt="customer_icon"
																				src="image/customer.png">

																		</div>
																		<%-- <h1>
																			<%=m.get("customerCount ") %></h1> --%>
						<h1><%=m.get(" customerCount") %>
																				</h1>
																				<h1 class="text-uppercase text-muted">
																					Customers</h1>


																	</div>

																</div>

															</div>
															<!--second col  -->
															<div class="col-md-4">
																<div class="card">
																	<div class="card-body text-center">
																		<div class="container">
																			<img style="max-width: 120px;"
																				class="image-fluid rounded-circle"
																				alt="list_icon" src="image/list.png">

																		</div>
																		<h1>
																			<%=list.size() %>
																		</h1>
																		<h1 class="text-uppercase text-muted">Categories
																		</h1>


																	</div>

																</div>

															</div>
															<!-- third col -->
															<div class="col-md-4">
																<div class="card">
																	<div class="card-body text-center">
																		<div class="container">
																			<img style="max-width: 120px;"
																				class="image-fluid rounded-circle"
																				alt="customer_icon"
																				src="image/product.png">

																		</div>
																		<%-- <h1>
																			<%=m.get("productCount ") %></h1> --%>
						<h1><%=m.get(" productCount") %>
																				</h1>
																				<h1 class="text-uppercase text-muted">
																					Products</h1>


																	</div>

																</div>

															</div>

														</div>
														<!-- second row -->
														<div class="row mt-4">
															<div class="col-md-6">
																<div class="card" data-toggle="modal"
																	data-target="#add-category-modal">
																	<div class="card-body text-center">
																		<div class="container">
																			<img style="max-width: 120px;"
																				class="image-fluid rounded-circle"
																				alt="customer_icon"
																				src="image/plus.png">

																		</div>
																		<p class="mt-2">Click here to add new category
																		</p>
																		<h1 class="text-uppercase text-muted">Add
																			Category</h1>


																	</div>

																</div>

															</div>

															<div class="col-md-6">
																<div class="card " data-toggle="modal"
																	data-target="#add-product-modal">
																	<div class="card-body text-center">
																		<div class="container">
																			<img style="max-width: 120px;"
																				class="image-fluid rounded-circle"
																				alt="customer_icon"
																				src="image/product.png">

																		</div>
																		<p class="mt2">Click here to add new Products
																		</p>
																		<h1 class="text-uppercase text-muted">Add
																			Products</h1>


																	</div>

																</div>

															</div>


														</div>

													</div>
													<!-- add category modal -->



													<!-- Modal -->
													<div class="modal fade" id="add-category-modal" tabindex="-1"
														role="dialog" aria-labelledby="exampleModalLabel"
														aria-hidden="true">
														<div class="modal-dialog" modal-lg role="document">
															<div class="modal-content">
																<div class="modal-header custom-bg text-white">
																	<h5 class="modal-title" id="exampleModalLabel">Fill
																		Category
																		Details</h5>
																	<button type="button" class="close"
																		data-dismiss="modal" aria-label="Close">
																		<span aria-hidden="true">&times;</span>
																	</button>
																</div>

																<div class="modal-body">

																	<form action="ProductOperationServlet"
																		method="post">

																		<input type="hidden" name="operation"
																			value="addcategory">

																		<div class="form-group">
																			<input type="text" class="form-control"
																				name="catTitle"
																				placeholder="Enter Category title  "
																				required />


																		</div>


																		<div class="form-group">
																			<textarea style="height: 250px"
																				class="form-control "
																				name=" catDescrition"
																				placeholder="Enter category description "></textarea>


																		</div>


																		<div class="container text-center">
																			<button class="btn btn-outline-success">Add
																				Category</button>
																			<button type="button"
																				class="btn btn-warning"
																				data-dismiss="modal">Close</button>

																		</div>


																	</form>

																</div>
															</div>
														</div>
													</div>

													<!-- start product modal -->
													<!-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 -->
													<!-- Modal -->
													<div class="modal fade" id="add-product-modal" tabindex="-1"
														role="dialog" aria-labelledby="exampleModalLabel"
														aria-hidden="true">
														<div class="modal-dialog modal-lg" role="document">
															<div class="modal-content">
																<div class="modal-header">
																	<h5 class="modal-title" id="exampleModalLabel">
																		Product Details</h5>
																	<button type="button" class="close"
																		data-dismiss="modal" aria-label="Close">
																		<span aria-hidden="true">&times;</span>
																	</button>
																</div>
																<div class="modal-body">


																	<!-- Start Form -->


																	<form action="ProductOperationServlet" method="post"
																		enctype="multipart/form-data">

																		<input type="hidden" name="operation"
																			value="addproduct">

																		<!-- product title  -->
																		<div class="form-group">
																			<input type="text" class="form-control"
																				placeholder="Enter title of product"
																				name="product_Name" required />
																		</div>

																		<!--product description-->

																		<div class="form-group">

																			<textarea style="height: 150px"
																				class="form-control"
																				placeholder="Enter product description"
																				name="product_Description"></textarea>
																		</div>

																		<!-- product price  -->
																		<div class="form-group">
																			<input type="number" class="form-control"
																				placeholder="Enter price of product"
																				name="product_Price" required />
																		</div>

																		<!-- product discount  -->
																		<div class="form-group">
																			<input type="number" class="form-control"
																				placeholder="Enter discount of product"
																				name="product_Discount" required />
																		</div>

																		<!-- product quantity  -->
																		<div class="form-group">
																			<input type="number" class="form-control"
																				placeholder="Enter Quantity of product"
																				name="product_Quantity" required />
																		</div>


																		<!-- Product Category-->







																		<div class="form-group">
																			<select name="catId" class="form-control"
																				id="">


																				<% for (Category c : list) { %>


																					<option
																						value="<%=c.getCategory_Id()%>">
																						<%=c.getCategory_Title()%>
																					</option>

																					<% } %>

																			</select>
																		</div>

																		<!-- product file -->

																		<div class="form-group">
																			<label for="product_Photo">Select Photo of
																				Product</label> <br>
																			<input type="file" id="product_Photo"
																				name="product_Photo" required />
																		</div>
																		<div class="form-group">
																			<label for="product_links">links</label>
																			<br> <input type="text" class="form-control"
																				name="link"
																				aria-label="Paste or search for a link"
																				data-initial-value="">
																		</div>


																		<!--submit button  -->

																		<div class="container text-center">
																			<button type="submit"
																				class="btn btn-outline-success">Add
																				Product</button>

																		</div>






																	</form>















																	<!-- End Form -->










																</div>
																<div class="modal-footer">
																	<button type="button" class="btn btn-secondary"
																		data-dismiss="modal">Close</button>
																	<button type="button" class="btn btn-primary">Save
																		changes</button>
																</div>
															</div>
														</div>
													</div>

													<!-- End product modal -->
													<%@include file="component/common_modals.jsp" %>
											</body>

											</html>
package com.india.digit.shop.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.india.digit.shop.dao.CategoryDao;
import com.india.digit.shop.dao.ProductDao;
import com.india.digit.shop.entity.Category;
import com.india.digit.shop.entity.FactoryProvider;
import com.india.digit.shop.entity.Product;

@MultipartConfig
public class ProductOperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	public ProductOperationServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		PrintWriter out = response.getWriter();

		String op = request.getParameter("operation");
		if (op.trim().equals("addcategory")) {
			// add category
			// fetching category data
			String title = request.getParameter("catTitle");
			String catDescrition = request.getParameter("catDescrition");

			Category category = new Category();

			category.setCategory_Title(title);
			category.setCategory_Description(catDescrition);

			// category database save

			CategoryDao categorydao = new CategoryDao(FactoryProvider.getFactory());
			int catId = categorydao.saveCategory(category);
			out.println("Category saved");
			HttpSession httpsession = request.getSession();
			httpsession.setAttribute("message", "Category added successfully "+catId);
			response.sendRedirect("admin.jsp");
			return;

		} else if (op.trim().equals("addproduct")) {

			// add product
			//work
			String name = request.getParameter("product_Name");
			String description = request.getParameter("product_Description");
			int price = Integer.parseInt(request.getParameter("product_Price"));
			int discount = Integer.parseInt(request.getParameter("product_Discount"));
			int quantity = Integer.parseInt(request.getParameter("product_Quantity"));
			int catId = Integer.parseInt(request.getParameter("catId"));
			Part part = request.getPart("product_Photo");
			String link = request.getParameter("link");
			
			Product product = new Product();
			product.setProduct_Name(name);
			product.setProduct_Description(description);
			product.setProduct_Price(price);
			product.setProduct_Discount(discount);
			product.setProduct_Quantity(quantity);
			product.setProduct_Photo(part.getSubmittedFileName());
			product.setLink(link);
			
			//get category by id
			CategoryDao cdoa = new CategoryDao(FactoryProvider.getFactory());
			
			Category category = cdoa.getCategoryById(catId);
			product.setCategory(category);
			
			//product save........
			ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
			
			//System.out.println(pdao);
			pdao.saveProduct(product);
			
			
			//pic upload
			
			//find out the path to upload photo
			
			
			@SuppressWarnings("deprecation")
			String path = request.getRealPath("image") + File.separator + "products" + File.separator + part.getSubmittedFileName();
			System.out.println(path);
			
			
			
			
			
			
			
			//uploading code
			
			try {
				
				FileOutputStream fos = new FileOutputStream(path);
				InputStream is = part.getInputStream();
				
				//reading data
				
				byte [] data= new byte[is.available()];
				is.read(data);
				//writing the data
				 fos.write(data);
				 fos.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
			
			
			//out.println("Product Save");
			
			HttpSession httpsession = request.getSession();
			httpsession.setAttribute("message", "Product is added successfully ");
			response.sendRedirect("admin.jsp");
			return;
			
		}
	}

}

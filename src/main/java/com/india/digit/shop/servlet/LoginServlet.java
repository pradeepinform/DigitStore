package com.india.digit.shop.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.india.digit.shop.dao.CustomerDao;
import com.india.digit.shop.entity.Customer;
import com.india.digit.shop.entity.FactoryProvider;;


public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		PrintWriter out = response.getWriter();
		
		try {

			String email = request.getParameter("email");
			String password = request.getParameter("password");
			
			//validation
			
			//authenticating customer  
			
			CustomerDao customerdao = new CustomerDao(FactoryProvider.getFactory());
		Customer customer = customerdao.getCustomerByEmailAndPassword(email, password);
			//System.out.println(customer);
		
		HttpSession httpsession = request.getSession();
		
		if(customer==null)
		{
			
			httpsession.setAttribute("message","Invalid details !!do it again it's wrong");
			response.sendRedirect("login.jsp");
			return;
		}
		else {
			out.println("<h1> Welcome user =>"+customer.getCustomerName()+"</h1>");
			
			
			//login
			
			httpsession.setAttribute("current-customer", customer);
			//admin
			
			if(customer.getCustomerType().equals("admin"))
			{
				response.sendRedirect("admin.jsp");
			}//normal
			
			else if (customer.getCustomerType().equals("normal")) {
				response.sendRedirect("normal.jsp");
				
			}
			else {
				out.println("We have not identified customer type");
			}
			
			
			
			
			
		}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
	}

}

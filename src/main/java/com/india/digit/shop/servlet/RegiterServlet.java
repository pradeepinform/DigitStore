package com.india.digit.shop.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.india.digit.shop.entity.Customer;
import com.india.digit.shop.entity.FactoryProvider;


public class RegiterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public RegiterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		PrintWriter out = response.getWriter();
		
		try {
			
			String name = request.getParameter("customer_name");
			String email = request.getParameter("customer_email");
			String password = request.getParameter("customer_password");
			String phone = request.getParameter("customer_phone");
			String address = request.getParameter("customer_address");
			
			/* validation */
			
		//creating user object to store data
		Customer customer=new Customer(name, email, password, phone, "default.jpg", address,"normal");   
			Session session = FactoryProvider.getFactory().openSession();
			
			Transaction tx = session.beginTransaction();
			int customerId=(Integer) session.save(customer);
			
			
			tx.commit();
			
			session.close();
			
			HttpSession httpSession = request.getSession();
			httpSession.setAttribute("message", "Registration Successful"+customerId);
			
			response.sendRedirect("register.jsp");
			return;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}

package com.india.digit.shop.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.india.digit.shop.entity.Customer;

public class CustomerDao {

	private SessionFactory factory;

	public CustomerDao(SessionFactory factory) {
		this.factory = factory;
	}
	
	 
	// get customer by email and password


	public Customer getCustomerByEmailAndPassword(String email, String password)
	{
		Customer customer= null;
		
		try {
			
			
			String query = "from Customer where customerEmail =: e and customerPassword=:p ";
			Session session = this.factory.openSession();
			
			Query q = session.createQuery(query);
			 
			q.setParameter("e", email);
			q.setParameter("p", password);
			
			
			customer =(Customer) q.uniqueResult();
			 
			session.close();
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
		
		
		
		return customer;
		
	}
	
}

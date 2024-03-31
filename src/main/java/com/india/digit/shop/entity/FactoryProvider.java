 package com.india.digit.shop.entity;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class FactoryProvider {
	private static SessionFactory factory;
	
	public static SessionFactory getFactory()
	{
		
		try {
			
			if(factory==null)
			{
				factory=new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
				
				  Configuration cfg = new Configuration(); cfg.configure("hibernate.cfg.xml");
				  SessionFactory session = cfg.buildSessionFactory(); session.openSession();
				  session.close();
				 
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return factory;
	}

}

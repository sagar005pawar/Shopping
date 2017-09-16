package com.dao;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.jws.soap.SOAPBinding.Use;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.TransientObjectException;
import org.springframework.jdbc.core.JdbcTemplate;
import com.model.User;
import com.model.Products;
import com.model.Shopping;

public class DAO implements DaoIn {

	private static SessionFactory sessionFactory = HibernateUtilities.getsSessionFactory();
	private Session session;
	private JdbcTemplate template;

	@Override
	public User getUser(String username, String password) {
		try {
			String q1="SELECT * FROM user where username=? and password=?;";
			return template.queryForObject(q1, new Object[]{username, password}, new UserMap());
		} catch(Exception e){
			return null;
		}
	}
		

	public boolean ReplaceSingleItem(Shopping s1)
	{
		boolean b1=false;
		this.session = sessionFactory.openSession();
		this.session.beginTransaction();
		try {
			String queryString = "from Products where PrName = :prname and Type = :type";
			  org.hibernate.Query query = this.session.createQuery(queryString);
			  query.setString("prname", s1.getPrName());						  
			  query.setString("type", s1.getType());						  
			  Object queryResult = query.uniqueResult();
			  Products p1 = (Products)queryResult;
			  System.out.println(p1.getQA());
			  p1.setQA(p1.getQA()+s1.getQN());
			  System.out.println("new= "+p1.getQA());
			  this.session.delete(s1);
			  this.session.update(p1);
			  b1=true;
			System.out.println("Replace Item..");
		} catch (Exception e) {
			this.exceptional();
			System.err.println(e);
		} finally {
			this.closeSession();
		}		
		return b1;
	}
	
	public void ShoppingTruncate()
	{
		try {
			this.session = sessionFactory.openSession();
			this.session.beginTransaction();
	
			org.hibernate.Query queryResult = this.session.createQuery("from Shopping");
			List<Shopping> allUsers = queryResult.list(); 
			for (Shopping user : allUsers) {
				this.session.delete(user);
			}
			System.out.println("Truncate");
		} catch (Exception e) {
			this.exceptional();
			System.err.println(e);
		} finally {
			this.closeSession();
		}		
	}
	
	public List<Shopping> shoppingtable()
	{
		ArrayList<Shopping> a1 = new ArrayList<Shopping>();
		
		try {
			this.session = sessionFactory.openSession();
			this.session.beginTransaction();
	
			org.hibernate.Query queryResult = this.session.createQuery("from Shopping");
			a1 = (ArrayList<Shopping>) queryResult.list(); 
			System.out.println("Show Shopping");	
		} catch (Exception e) {
			this.exceptional();
			System.err.println(e);
		} finally {
			this.closeSession();
		}		
		return a1;
	}

	public Shopping latestCommander(Products pr, double total){
		Shopping T = new Shopping();
		this.session = sessionFactory.openSession();
		this.session.beginTransaction();
		try {
			int a=pr.getQA(), n=pr.getQN();
			double p = pr.getPrice();
			String ft=pr.getType(), i=pr.getPrName();
				if(n > 0) {
					if(n <= a) {
						total = total + (p * n);
						a-=n;
						String queryString = "from Products where PrName = :prname and Price = :price and Type = :type";
						  org.hibernate.Query query = session.createQuery(queryString);
						  query.setString("prname", i);						  
						  query.setDouble("price", p);
						  query.setString("type", ft);
						  Object queryResult = query.uniqueResult();

						  Products p1 = (Products)queryResult;
						  System.out.println(p1.getQA());
						  p1.setQA(a);
						  System.out.println(p1.getQA());
						  this.session.update(p1);
						  System.out.println("Product updated...");  
							try {
								  Shopping s1= new Shopping();
								  query = this.session.createQuery("from Shopping where PrName = :prname and Type = :type");
									java.util.List allUsers;			  
									query.setString("prname", i);
									query.setString("type", ft);
									allUsers = query.list();
									for (int j = 0; j < allUsers.size(); j++) {
										s1 = (Shopping) allUsers.get(j);
										System.out.println("shopping table item: "+s1.getPrName());
									}
									if(s1.getPrName() != null) {
										s1.setPrName(i);
										s1.setQN(n+s1.getQN());
										s1.setPrice(p);
										s1.setType(ft);
										s1.setAmt((p*n)+s1.getAmt());
										this.session.update(s1);
										System.out.println("Update in shopping Table..");							
									} else {
										  s1.setPrName(i);
										  s1.setQN(n);
										  s1.setPrice(p);
										  s1.setType(ft);
										  s1.setAmt(p*n);
										  System.out.println(s1.getAmt());
										  this.session.save(s1);
										  System.out.println("Inserted Shop Item...\n");
									}						  
							}catch(TransientObjectException e){
								  Shopping s1= new Shopping();
								  s1.setPrName(i);
								  s1.setQN(n);
								  s1.setPrice(p);
								  s1.setType(ft);
								  s1.setAmt(p*n);
								  System.out.println(s1.getAmt());
								  this.session.save(s1);
								  System.out.println("Inserted Shop Item by QuerySyntaxException catch clause... \n" + e);
							}									  
					}else{
//						Pw.println(i + ": " + n + " But now here available only this QtA ("+ a +")");
					}
				}else if(a==0) {
//					Pw.println(i+": Already SOLD-OUT");
				}else {
//					Pw.println(i+": " + n + " is Invalid, Please enter in-bet(0-" + a + ")");			
				}
				T.setTotal(total);
				return T;
		} catch (Exception e) {
			this.exceptional();
			System.err.println(e);
		} finally {
			this.closeSession();
		}		
		return T;	
	}
	
	
	public Shopping Commander(int n,int a,double p,String ft,String i,String u,double total){
		
		Shopping T = new Shopping();
		this.session = sessionFactory.openSession();
		this.session.beginTransaction();
		try {
				if(n > 0) {
					if(n <= a) {
						total = total + (p * n);
						a-=n;
						String queryString = "from Products where PrName = :prname and Price = :price and Type = :type";
						  org.hibernate.Query query = session.createQuery(queryString);
						  query.setString("prname", i);						  
						  query.setDouble("price", p);
						  query.setString("type", ft);
						  Object queryResult = query.uniqueResult();

						  Products p1 = (Products)queryResult;
						  System.out.println(p1.getQA());
						  p1.setQA(a);
						  System.out.println(p1.getQA());
						  this.session.update(p1);
						  System.out.println("Product updated...");  
							try {
								  Shopping s1= new Shopping();
								  query = this.session.createQuery("from Shopping where PrName = :prname and Type = :type");
									java.util.List allUsers;			  
									query.setString("prname", i);
									query.setString("type", ft);
									allUsers = query.list();
									for (int j = 0; j < allUsers.size(); j++) {
										s1 = (Shopping) allUsers.get(j);
										System.out.println("shopping table item: "+s1.getPrName());
									}
									if(s1.getPrName() != null) {
										s1.setPrName(i);
										s1.setQN(n+s1.getQN());
										s1.setPrice(p);
										s1.setType(ft);
										s1.setAmt((p*n)+s1.getAmt());
										this.session.update(s1);
										System.out.println("Update in shopping Table..");							
									} else {
										  s1.setPrName(i);
										  s1.setQN(n);
										  s1.setPrice(p);
										  s1.setType(ft);
										  s1.setAmt(p*n);
										  System.out.println(s1.getAmt());
										  this.session.save(s1);
										  System.out.println("Inserted Shop Item...\n");
									}						  
							}catch(TransientObjectException e){
								  Shopping s1= new Shopping();
								  s1.setPrName(i);
								  s1.setQN(n);
								  s1.setPrice(p);
								  s1.setType(ft);
								  s1.setAmt(p*n);
								  System.out.println(s1.getAmt());
								  this.session.save(s1);
								  System.out.println("Inserted Shop Item by QuerySyntaxException catch clause... \n" + e);
							}									  
					}else{
//						Pw.println(i + ": " + n + " But now here available only this QtA ("+ a +")");
					}
				}else if(a==0) {
//					Pw.println(i+": Already SOLD-OUT");
				}else {
//					Pw.println(i+": " + n + " is Invalid, Please enter in-bet(0-" + a + ")");			
				}
				T.setTotal(total);
				return T;
		} catch (Exception e) {
			this.exceptional();
			System.err.println(e);
		} finally {
			this.closeSession();
		}		
		return T;	
	}	
	
	
	public boolean ItemInserting(Products p) {
		boolean status=false;
		try {
			Products p1= null;
			this.session = sessionFactory.openSession();
			this.session.beginTransaction();
			org.hibernate.Query queryResult = this.session.createQuery("from Products where PrName = :prname and type = :type");
			java.util.List allUsers;
			queryResult.setString("prname", p.getPrName());
			queryResult.setString("type", p.getType());
			allUsers = queryResult.list(); 
			for (int i = 0; i < allUsers.size(); i++) {
				p1 = (Products) allUsers.get(i);
				System.out.println(p1.getId());
			}
			if(p1 != null) {
				p1.setQA(p.getQA() + p1.getQA());
				p1.setPrice(p.getPrice());
				this.session.update(p1);
				status=true;
				System.out.println("Update..");							
			} else {				
				session.save(p);
				status=true;
				System.out.println("INSERT..");			
			}
		} catch (Exception e) {
			this.exceptional();
			System.err.println(e);
		} finally {
			this.closeSession();
		}		
		return status;
	}
	
	public boolean ItemUpdating(Products p) {
		try {
			this.session = sessionFactory.openSession();
			this.session.beginTransaction();
			if((getProduct(p.getId()))!=null) {
				session.update(p);
				System.out.println("Updated..!");
				return true;				
			}
		} catch (Exception e) {
			this.exceptional();
			System.err.println(e);
		} finally {
			this.closeSession();
		}		
		return false;
	}

	
	public boolean ItemDeletion(String id) {
		boolean status=false;
		try {
			this.session = sessionFactory.openSession();
			this.session.beginTransaction();
			System.out.println("dao del..");
			String queryString = "from Products where Id = :idsa";
			  org.hibernate.Query query = this.session.createQuery(queryString);
			  query.setString("idsa", id);
				System.out.println("dao d");

			  Object queryResult = query.uniqueResult();
			  Products p1 = (Products)queryResult;
			  System.out.println(p1.getPrName());
			  this.session.delete(p1);
			  System.out.println("Deleted Item...");
			  status=true;
		} catch (Exception e) {
			this.exceptional();
			System.err.println(e);
		} finally {
			this.closeSession();
		}		
		return status;
	}
	
	
	public boolean SectionDeletion(String type) {
		boolean status=false;
		try {
			this.session = sessionFactory.openSession();
			this.session.beginTransaction();
			Query queryResult = this.session.createQuery("FROM Products WHERE Type = :type");
			queryResult.setString("type", type);
			java.util.List allPr;
			allPr = queryResult.list(); 
			for (int i = 0; i < allPr.size(); i++) {
				Products p1 = (Products) allPr.get(i);
				System.out.println(p1);
				this.session.delete(p1);
			}
			status=true;			
			System.out.println("Deleted Section...");
		} catch (Exception e) {
			this.exceptional();
			System.err.println(e);
		} finally {
			this.closeSession();
		}		
		return status;
	}

	
	
	
	public List<Products> DPSections(){
		ArrayList<Products> a1 = new ArrayList<Products>();
		try {		
			this.session = sessionFactory.openSession();
			this.session.beginTransaction();
			a1.addAll((ArrayList<Products>)(this.session.createQuery("from Products group by type order by id")).list());
		} catch (Exception e) {
			this.exceptional();
			System.err.println(e);
		} finally {
			this.closeSession();
		}		
		return a1;
	}

	public boolean RShopItemUpdating(int id,String prname,String type,int qta,double price){
		boolean status = false;
		try {
			this.session = sessionFactory.openSession();
			this.session.beginTransaction();
			Products p1=new Products(id, prname, qta, price, type);
			this.session.update(p1);
			status=true;				
		} catch (Exception e) {
			this.exceptional();
			System.err.println(e);
		} finally {
			this.closeSession();
		}		
		return status;	
	}

	
	public boolean ReplaceItems(Shopping s1) {
		ArrayList<Products> a1 = new ArrayList<Products>(); 
		boolean status = false;
		for (Products p:SectonItemsListfR(s1.getType())) {
			if(p!=null) {
				if(s1.getPrName().equals(p.getPrName())){
					status=RShopItemUpdating(p.getId(), s1.getPrName(), s1.getType(), p.getQA()+s1.getQN(), p.getPrice());
					return status;
				}
			}
		}
		return status;	
	}	
	
	public List<Products> SectonItemsListfR(String type) {
		ArrayList<Products> a1 = new ArrayList<Products>(); 
		try{
			this.session = sessionFactory.openSession();
			this.session.beginTransaction();
			org.hibernate.Query queryResult = this.session.createQuery("from Products where type = :type");
			queryResult.setString("type", type);
			a1 = (ArrayList<Products>) queryResult.list(); 			
		} catch (Exception e) {
			this.exceptional();
			System.err.println(e);
		} finally {
			this.closeSession();
		}				
		return a1;
	}	
	
	
	public List<Products> SectonItemsList(String type) {
		ArrayList<Products> a1 = new ArrayList<Products>(); 
		try {
			this.session = sessionFactory.openSession();
			this.session.beginTransaction();
			org.hibernate.Query queryResult = this.session.createQuery("from Products where type = :type");
			queryResult.setString("type", type);
			a1 = (ArrayList<Products>) queryResult.list(); 			
		} catch (Exception e) {
			this.exceptional();
			System.err.println(e);
		} finally {
			this.closeSession();
		}		
		return a1;
	}	

	public User changePassword(User u1){
		User u = getUser(u1.getId());
		try {
			u.setPassword(u1.getPassword());
			this.session = sessionFactory.openSession();
			this.session.beginTransaction();
			this.session.update(u);		
			return u;
		} catch (Exception e) {
			this.exceptional();
			System.err.println(e);
			return null;
		} finally {
			this.closeSession();
		}
	}
	
	public User saveChanges(User u1) {
		User u = getUser(u1.getId());
		try {
			u.setFname(u1.getFname());
			u.setLname(u1.getLname());
			u.setEmail(u1.getEmail());
			u.setContact(u1.getContact());
			u.setPincode(u1.getPincode());
			u.setCity(u1.getCity());
			this.session = sessionFactory.openSession();
			this.session.beginTransaction();
			this.session.update(u);		
		} catch (Exception e) {
			this.exceptional();
			System.err.println(e);
		} finally {
			this.closeSession();
		}		
		return u;
	}

	public User SingupDAO(User u1) {
		try {
			this.session = sessionFactory.openSession();
			this.session.beginTransaction();
			this.session.saveOrUpdate(u1);			
		} catch (Exception e) {
			this.exceptional();
			System.err.println(e);
		} finally {
			this.closeSession();
		}		
		return u1;
	}
	
	public User validateUser(User u1) {			
		try {		
			this.session = sessionFactory.openSession();
			this.session.beginTransaction();
			String queryString = "from User where username = :username and password = :pass";
			org.hibernate.Query query = this.session.createQuery(queryString);
			query.setString("username", u1.getUsername());
			query.setString("pass", u1.getPassword());
			Object queryResult = query.uniqueResult();
			return ((User)queryResult);
		} catch (Exception e) {
			this.exceptional();
			System.err.println("e= "+e);
			return new User();
		} finally {
			this.closeSession();
		}		
	}
	
	public List<User> getUnAuthorizedAdmins() {
		List<User> a1 = new ArrayList<>();
		try {		
			this.session = sessionFactory.openSession();
			this.session.beginTransaction();
			String queryString = "from User where user = :user and admin = :admin";
			org.hibernate.Query query = this.session.createQuery(queryString);
			query.setString("user", "admin");
			query.setBoolean("admin", false);
			a1 = query.list();
			return a1;
		} catch (Exception e) {
			this.exceptional();
			System.err.println(e);
		} finally {
			this.closeSession();
		}		
		return null;
	}
	
	public List<User> getAuthorizedAdmins() {
		List<User> a1 = new ArrayList<>();
		try {		
			this.session = sessionFactory.openSession();
			this.session.beginTransaction();
			String queryString = "from User where user = :user and admin = :admin";
			org.hibernate.Query query = this.session.createQuery(queryString);
			query.setString("user", "admin");
			query.setBoolean("admin", true);
			a1 = query.list();
			return a1;
		} catch (Exception e) {
			this.exceptional();
			System.err.println(e);
		} finally {
			this.closeSession();
		}		
		return null;
	}

	public List<User> getCustomers() {
		List<User> a1 = new ArrayList<>();
		try {		
			this.session = sessionFactory.openSession();
			this.session.beginTransaction();
			String queryString = "from User where user = :user";
			org.hibernate.Query query = this.session.createQuery(queryString);
			query.setString("user", "cust");
			a1 = query.list();
			return a1;
		} catch (Exception e) {
			this.exceptional();
			System.err.println(e);
		} finally {
			this.closeSession();
		}		
		return null;
	}

	@Override
	public Products getProduct(int id) {
		try {		
			this.session = sessionFactory.openSession();
			this.session.beginTransaction();
			String queryString = "from products where id = :id";
			org.hibernate.Query query = this.session.createQuery(queryString);
			query.setInteger("id", id);
			Object queryResult = query.uniqueResult();
			return ((Products)queryResult);
		} catch (Exception e) {
			this.exceptional();
			System.err.println(e);
		} finally {
			this.closeSession();
		}		
		return null;
	}

	
	@Override
	public User getUser(int id) {
		try {		
			this.session = sessionFactory.openSession();
			this.session.beginTransaction();
			String queryString = "from User where id = :id";
			org.hibernate.Query query = this.session.createQuery(queryString);
			query.setInteger("id", id);
			Object queryResult = query.uniqueResult();
			return ((User)queryResult);
		} catch (Exception e) {
			this.exceptional();
			System.err.println(e);
		} finally {
			this.closeSession();
		}		
		return null;
	}

	public boolean adminApprove(int id, int fromBy){
		try {
			User u = getUser(id);
			this.session = sessionFactory.openSession();
			this.session.beginTransaction();
			u.setAdmin(true);
			u.setFromBy(fromBy);
			this.session.update(u);
			return true;
		} catch (Exception e) {
			this.exceptional();
			System.err.println(e);
		} finally {
			this.closeSession();
		}		
		return false;
	}
	
	public boolean AdminUnApproval(int id, int fromBy){
		try {
			User u = getUser(id);
			this.session = sessionFactory.openSession();
			this.session.beginTransaction();
			u.setAdmin(false);
			u.setFromBy(fromBy);
			this.session.update(u);
			return true;				
		} catch (Exception e) {
			this.exceptional();
			System.err.println(e);
		} finally {
			this.closeSession();
		}		
		return false;
	}

	public boolean AdminRemoved(int id){
		try {
			User u = getUser(id);
			this.session = sessionFactory.openSession();
			this.session.beginTransaction();
			this.session.delete(u);
			return true;
		} catch (Exception e) {
			this.exceptional();
			System.err.println(e);
		} finally {
			this.closeSession();
		}		
		return false;
	}
	
	public List<Products> getProducts() {
		ArrayList<Products> a1 = new ArrayList<Products>();
		try {
			this.session = sessionFactory.openSession();
			this.session.beginTransaction();
			org.hibernate.Query queryResult = this.session.createQuery("from Products");
			a1 = (ArrayList<Products>) queryResult.list(); 
			//a1.forEach(System.out::println);
		} catch (Exception e) {
			this.exceptional();
			System.err.println(e);
		} finally {
			this.closeSession();
		}		
		return a1;		
	}

	public JdbcTemplate getTemplate() {
		return template;
	}

	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}
		
	public void closeSession(){
		if(this.session.isConnected()){
			this.session.getTransaction().commit();
			this.session.close();
			System.out.println("Session closed..");
		}else{
			System.out.println("Session already Disabled..");
		}
		
	}
	
	public void exceptional(){
		if(this.session.isConnected()){
			this.session.getTransaction().commit();
			this.session.close();
			System.out.println("Session closed..");
			sessionFactory.close();
			System.out.println("Hibernate SessionFactory closed..");
		} else {
			sessionFactory.close();
			System.out.println("Hibernate SessionFactory closed..");
		}
	}



}

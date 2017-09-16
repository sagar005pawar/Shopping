package com.dao;

import java.io.IOException;
import java.sql.SQLException;
import java.util.*;
import com.model.*;

public interface DaoIn {
	
	public User getUser(String username, String password);
	public User getUser(int id);
	public User  validateUser(User u1);
	public List<Products> getProducts();
	public void closeSession();
	public void exceptional();
	public User SingupDAO(User u1);
	public List<Products> SectonItemsList(String type);
	public List<Products> SectonItemsListfR(String type);
	public boolean ReplaceItems(Shopping s1);
	public boolean RShopItemUpdating(int id,String prname,String type,int qta,double price);
	public List<Products> DPSections();
	public boolean SectionDeletion(String type);
	public boolean ItemDeletion(String id);
	public boolean ItemUpdating(Products p);
	public boolean ItemInserting(Products p);	
	public Shopping Commander(int n,int a,double p,String ft,String i,String u,double total); 
	public List<Shopping> shoppingtable();
	public void ShoppingTruncate();
	public boolean ReplaceSingleItem(Shopping s1);
	public Shopping latestCommander(Products p, double total);
	public List<User> getCustomers();
	public List<User> getAuthorizedAdmins();
	public List<User> getUnAuthorizedAdmins();
	public boolean AdminUnApproval(int id, int fromBy);
	public boolean AdminRemoved(int id);
	public boolean adminApprove(int id, int fromBy);
	public User saveChanges(User u1);
	public User changePassword(User u1);
	public Products getProduct(int id);
	
}

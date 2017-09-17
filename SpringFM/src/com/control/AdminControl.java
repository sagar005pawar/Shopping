package com.control;

import java.util.stream.Collectors;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.model.Products;
import com.model.Shopping;
import com.model.User;
import com.service.ServiceIn;

@org.springframework.stereotype.Controller
@PropertySource(value = { "classpath:/SpringFM.properties" })
public class AdminControl {

	@Autowired
	private ServiceIn service;

	@SuppressWarnings("unused")
	@Autowired
	private Environment environment;
	
	@Autowired
	private HttpSession sess;

	
	@RequestMapping("/Homepage")
	public ModelAndView homepage() {
		sess.setAttribute("Products", (service.getProducts()).stream().collect(Collectors.toList()));
		return new ModelAndView("Homepage");
	}	
	
	@RequestMapping("/DisplayProductSections")
	public ModelAndView home() {
		try {			
			sess.setAttribute("sc", (service.getProducts()).stream().sorted((f1, f2)->f1.getType().toLowerCase().compareTo(f2.getType().toLowerCase())).map(Products::getType).distinct().collect(Collectors.toList()));
			return new ModelAndView("Home");
		} catch (Exception e) {
			return new ModelAndView("redirect:/AdminLogout");
		}
	}	
	
	@RequestMapping(value="/SectionItemsList/{type}", method=RequestMethod.GET)
	public ModelAndView sectionItemsList(@PathVariable("type") String type) {
		try {
			System.out.println("SectionItemsListToUser.. "+ type);
			sess.setAttribute("asi", (service.getProducts()).stream().filter(p->p.getType().equals(type)).sorted().collect(Collectors.toList()));
			return new ModelAndView("Products");
		} catch (Exception e) {
			return new ModelAndView("Wel");
		}
	}	

	@RequestMapping("/LinkItemDeletion/{idsa}")
	public ModelAndView linkItemDeletion(@PathVariable("idsa") int id) {		
		try{
			if(service.ItemDeletion(String.valueOf(id))) {
				System.out.println("Deleted Product");
				return new ModelAndView("redirect:/Homepage");
			}else{
				System.out.println("Deletion Failure");
				return new ModelAndView("DeleteItem", "msg", "Deletion Failure ID= "+id);
			}												
		} catch (Exception e) {
			System.out.println("Deletion Failure");
			return new ModelAndView("DeleteItem", "msg", "Deletion Failure ID= " + id);
		}
	}	

	
	@RequestMapping("/LinkSectionDeletion/{type}")
	public ModelAndView linkSectionDeletion(@PathVariable("type") String type) {		
		try {
			if(service.SectionDeletion(type)) {
				System.out.println("Deleted Section");
				return new ModelAndView("redirect:/Homepage");
			} else {
				System.out.println("Deletion Failure");
				return new ModelAndView("DeleteItem", "msg", "Deletion Failure Section= " + type);
			}						
		} catch (Exception e) {
			System.out.println("Deletion Failure");
			return new ModelAndView("DeleteItem", "msg", "Deletion Failure Section= " + type);
		}
	}	

	@RequestMapping("/ItemDeletion")
	public ModelAndView itemDeletion(@ModelAttribute("id") int id) {		
		try{
			if(service.ItemDeletion(String.valueOf(id))) {
				System.out.println("Deleted Product");
				return new ModelAndView("DeleteItem", "msg", "Deleted ID= "+id);
			}else{
				System.out.println("Deletion Failure");
				return new ModelAndView("DeleteItem", "msg", "Deletion Failure ID= "+id);
			}												
		} catch (Exception e) {
			System.out.println("Deletion Failure");
			return new ModelAndView("DeleteItem", "msg", "Deletion Failure ID= " + id);
		}
	}	
	
	@RequestMapping("/SectionDeletion")
	public ModelAndView sectionDeletion(@ModelAttribute("type") String type) {		
		try {
			if(service.SectionDeletion(type)) {
				System.out.println("Deleted Section");
				return new ModelAndView("DeleteItem", "msg", "Deleted Section= " + type);
			} else {
				System.out.println("Deletion Failure");
				return new ModelAndView("DeleteItem", "msg", "Deletion Failure Section= " + type);
			}						
		} catch (Exception e) {
			System.out.println("Deletion Failure");
			return new ModelAndView("DeleteItem", "msg", "Deletion Failure Section= " + type);
		}
	}	

	@RequestMapping("/UpdateItem/{id}/{prname}/{type}/{qty}/{price}")
	public ModelAndView updateItem(@PathVariable("id") String id1,@PathVariable("prname") String prname,@PathVariable("type") String type,@PathVariable("qty") String qty,@PathVariable("price") String price) {
		Products p1 = new Products(Integer.parseInt(id1), prname, Integer.parseInt(qty), Double.parseDouble(price), type);
		System.out.println("Updating..");
		return new ModelAndView("Updating", "pro", p1);
	}	
	
	@RequestMapping("/UpdateProduct")
	public ModelAndView updateProduct(@ModelAttribute Products p, BindingResult br) {
		if(br.hasErrors()){
			return new ModelAndView("Updating", "msg", br.getAllErrors());			
		}
		System.out.println("Updating=  " + p);
		if (service.ItemUpdating(p)) {
			return new ModelAndView("Updating", "msg", p.getPrName() + " Updated...");	
		} else {
			return new ModelAndView("Updating", "msg", p.getPrName() + " NOT Updated...");
		}
	}

	@RequestMapping("/InsertItem/{type}")
	public ModelAndView insertItem(@PathVariable("type") String type) {		
		return new ModelAndView("InsertItem", "type", type);
	}

	@RequestMapping("/ItemInserting")
	public ModelAndView InsertingItem(@ModelAttribute() Products p, BindingResult br) {
		if(br.hasErrors()){
			return new ModelAndView("InsertItem", "msg", br.getAllErrors());			
		}
		System.out.println("Inserting=  " + p);
		if (service.ItemInserting(p)) {
			return new ModelAndView("InsertItem", "msg", p.getType() + " Inserted...");
		} else {
			return new ModelAndView("InsertItem", "msg", p.getType() + " NOT Inserted...");
		}
	}
	
	@RequestMapping("/ItemUpdating")
	public ModelAndView itemUpdating(@ModelAttribute() Products p, BindingResult br) {
		if(br.hasErrors()) {
			return new ModelAndView("UpdateItem", "msg", br.getAllErrors());
		}
		System.out.println("Updating=  " + p);
		if (service.ItemUpdating(p)) {
			System.out.println("if");
			return new ModelAndView("UpdateItem", "msg", p.getType() + " Updated...");
		} else {
			System.out.println("els");
			return new ModelAndView("UpdateItem", "msg", p.getType() + " NOT Updated...");
		}
	}

	@RequestMapping("/newAdmins")
	public ModelAndView newAdmins() {
		try {			
			ModelAndView model = new ModelAndView("Admins");
			model.addObject("users", service.getUnAuthorizedAdmins().stream().filter(p->p.getFromBy()==0).sorted().collect(Collectors.toList()));
			model.addObject("heading", "NEW Admins");
			return model;
		} catch (Exception e) {
			return new ModelAndView("redirect:/AdminLogout");
		}
	}	
	
	@RequestMapping("/Suspended")
	public ModelAndView Suspended() {
		try {			
			ModelAndView model = new ModelAndView("Admins");
			model.addObject("users", service.getUnAuthorizedAdmins().stream().filter(p->p.getFromBy()!=0).sorted().collect(Collectors.toList()));
			model.addObject("heading", "Suspended Admins");
			return model;
		} catch (Exception e) {
			return new ModelAndView("redirect:/AdminLogout");
		}
	}	
	
	@RequestMapping("/Admins")
	public ModelAndView admins() {
		try {			
			ModelAndView model = new ModelAndView("Admins");
			model.addObject("users", service.getAuthorizedAdmins().stream().sorted().collect(Collectors.toList()));
			model.addObject("heading", "Authorized Admins");
			return model;
		} catch (Exception e) {
			return new ModelAndView("redirect:/AdminLogout");
		}
	}	

	@RequestMapping("/Customers")
	public ModelAndView customers() {
		try {			
			ModelAndView model = new ModelAndView("Admins");
			model.addObject("users", service.getCustomers().stream().sorted().collect(Collectors.toList()));
			model.addObject("heading", "Shop-CustomerS");
			return model;
		} catch (Exception e) {
			return new ModelAndView("redirect:/AdminLogout");
		}
	}	

	@RequestMapping("/AdChangePassword")
	public ModelAndView changePassword(@ModelAttribute("user") User u, BindingResult br) {
		ModelAndView model = new ModelAndView("Profile");
		if(br.hasErrors()) {
			System.out.println("errors= " + br.getErrorCount());
		}
		if(!br.hasErrors()) {
			u=service.changePassword(u);
			model.addObject("urPro", u);
			model.addObject("msg", "Password Changed..!");
			sess.setAttribute("user", u);				
		}
		return model;
	}			

	@RequestMapping("/AdSaveChanges")
	public ModelAndView saveChanges(@ModelAttribute("user") User u, BindingResult br) { 
		ModelAndView model = new ModelAndView("Profile");
		if(br.hasErrors()) {
			System.out.println("errors= " + br.getErrorCount());
		}
		if(!br.hasErrors()) {
			u=service.saveChanges(u);
			model.addObject("urPro", u);
			model.addObject("msg", "User Modified..!");
			sess.setAttribute("user", u);
		}
		return model;
	}			

	@RequestMapping("/profile/{id}")
	public ModelAndView profile(@PathVariable("id") int id) {		
		return new ModelAndView("Profile", "urPro", service.getUser(id));
	}
			
	@RequestMapping("/NewAdminApprove/{id}/{fromBy}")
	public ModelAndView newAdminApprove(@PathVariable("id") int id, @PathVariable("fromBy") int fromBy) {
		ModelAndView model = new ModelAndView("Admins");
		if(service.adminApprove(id, fromBy)){
			model.addObject("heading", "NEW Admins");
			model.addObject("msg", "Admin Approved= "+id);
			model.addObject("users", service.getUnAuthorizedAdmins().stream().filter(p->p.getFromBy()==0).sorted().collect(Collectors.toList()));
		} else {
			model.addObject("heading", "NEW Admins");
			model.addObject("msg", "Admin Approval= FAILED");
			model.addObject("users", service.getUnAuthorizedAdmins().stream().filter(p->p.getFromBy()==0).collect(Collectors.toList()));
		}
		return model;			
	}

	@RequestMapping("/AdminApprove/{id}/{fromBy}")
	public ModelAndView adminApprove(@PathVariable("id") int id, @PathVariable("fromBy") int fromBy) {
		ModelAndView model = new ModelAndView("Admins");
		if(service.adminApprove(id, fromBy)){
			model.addObject("heading", "Suspended Admins");
			model.addObject("msg", "Admin Approved= "+id);
			model.addObject("users", service.getUnAuthorizedAdmins().stream().filter(p->p.getFromBy()!=0).sorted().collect(Collectors.toList()));
		} else {
			model.addObject("heading", "Suspended Admins");
			model.addObject("msg", "Admin Approval= FAILED");
			model.addObject("users", service.getUnAuthorizedAdmins().stream().filter(p->p.getFromBy()!=0).sorted().collect(Collectors.toList()));
		}
		return model;			
	}

	@RequestMapping("/AdminUnApproval/{id}/{fromBy}")
	public ModelAndView adminUnApproval(@PathVariable("id") int id, @PathVariable("fromBy") int fromBy) {
		ModelAndView model = new ModelAndView("Admins");
		if(service.AdminUnApproval(id, fromBy)) {
			model.addObject("heading", "Authorized Admins");
			model.addObject("msg", "Admin Suspended= "+id);
			model.addObject("users", service.getAuthorizedAdmins().stream().sorted().collect(Collectors.toList()));
		} else {
			model.addObject("heading", "Authorized Admins");
			model.addObject("msg", "Admin Suspention= FAILED");
			model.addObject("users", service.getAuthorizedAdmins().stream().sorted().collect(Collectors.toList()));
		}
		return model;			
	}

	@RequestMapping("/SuspendAdminRemoved/{id}")
	public ModelAndView suspendAdminRemoved(@PathVariable("id") int id) {	
		ModelAndView model = new ModelAndView("Admins");
		if (service.AdminRemoved(id)) {
			model.addObject("heading", "Suspended Admins");
			model.addObject("msg", "Admin Removed= " + id);
			model.addObject("users", service.getUnAuthorizedAdmins().stream().filter(p->p.getFromBy()!=0).sorted().collect(Collectors.toList()));
		} else {
			model.addObject("heading", "Suspended Admins");
			model.addObject("msg", "Admin Removing= FAILED");
			model.addObject("users", service.getUnAuthorizedAdmins().stream().filter(p->p.getFromBy()!=0).sorted().collect(Collectors.toList()));
		}
		return model;			
	}
		
	@RequestMapping("/AdminRemoved/{id}")
	public ModelAndView adminRemoved(@PathVariable("id") int id) {	
		ModelAndView model = new ModelAndView("Admins");
		if (service.AdminRemoved(id)) {
			model.addObject("heading", "NEW Admins");
			model.addObject("msg", "Admin Removed= " + id);
			model.addObject("users", service.getUnAuthorizedAdmins().stream().filter(p->p.getFromBy()==0).sorted().collect(Collectors.toList()));
		} else {
			model.addObject("heading", "NEW Admins");
			model.addObject("msg", "Admin Removing= FAILED");
			model.addObject("users", service.getUnAuthorizedAdmins().stream().filter(p->p.getFromBy()==0).sorted().collect(Collectors.toList()));
		}
		return model;			
	}

	@RequestMapping("/CustomerRemoved/{id}")
	public ModelAndView customersRemoved(@PathVariable("id") int id) {	
		ModelAndView model = new ModelAndView("Admins");
		if (service.AdminRemoved(id)) {
			model.addObject("heading", "Shop-CustomerS");
			model.addObject("msg", "Customer Removed= " + id);
			model.addObject("users", service.getCustomers().stream().sorted().collect(Collectors.toList()));
		} else {
			model.addObject("heading", "Shop-CustomerS");
			model.addObject("msg", "Customer Removing= FAILED");
			model.addObject("users", service.getCustomers().stream().sorted().collect(Collectors.toList()));
		}
		return model;
	}

	
	@RequestMapping("/ASignupCntl")
	public ModelAndView asignupCntl(@ModelAttribute("user") User u, BindingResult br) { 
		String msg = null;
		if(br.hasErrors()) {
			System.out.println("errors= " + br.getErrorCount());
			msg = "NOT Register ERROR in: " + br.getFieldError().getField();
		}
		if(!br.hasErrors()) {
			if ((service.getUser(u.getUsername(), u.getPassword()))==null) {
				service.SingupDAO(u);
				return new ModelAndView("AdminLoginPage", "msg", "New Admin Created..!");			
			} else {
				msg = "Admin didn't created, UserName Already Exist..!";				
			}
		}
		return new ModelAndView("AdminLoginPage", "msg", msg);			
	}			

	
	@RequestMapping(value="/AdminLogin", method = RequestMethod.POST)
	public ModelAndView validation(@ModelAttribute User u, BindingResult br) {
		if(br.hasErrors()){
			return new ModelAndView("AdminLoginPage", "msg", br.getAllErrors());			
		}
		User u1 = service.validateUser(u);
		if(u1!=null) {
			if(u1.isAdmin() && u1.getUser().equals("admin")) { 
				sess.setAttribute("userLog", "login");
				sess.setAttribute("user", u1);
				return new ModelAndView("AdminHomePage", "user", u1);										
			} else {
				return new ModelAndView("AdminLoginPage", "msg", "Admin NOT Authorised..!");
			}
		} else {
			return new ModelAndView("AdminLoginPage", "msg", "Invalid ADMIN..!");									
		}
	}	

	@RequestMapping("/AdminLogout")
	public String logout(){
		System.runFinalization();
//		service.exceptional();

		sess.setAttribute("userLog", "logout");
		sess.invalidate();

		Cookie c = new Cookie("name", "");
		c.setMaxAge(0);

		System.gc();
		System.out.println("logout");		
		return "AdminLoginPage";					
	}

	
	@RequestMapping(value="/updateItem", method=RequestMethod.GET)
	public String update(){
		return "UpdateItem";					
	}
	@RequestMapping(value="/insertItem", method=RequestMethod.GET)
	public String insert(){
		return "InsertItem";					
	}
	@RequestMapping(value="/deleteItem", method=RequestMethod.GET)
	public String delete(){
		return "DeleteItem";					
	}

	@RequestMapping(value="/Admin", method=RequestMethod.GET)
	public String admin(){
		return "AdminLoginPage";					
	}
	
	@RequestMapping(value="/AdminHome", method=RequestMethod.GET)
	public String adminHome(){
		return "AdminHomePage";					
	}
	
	
}

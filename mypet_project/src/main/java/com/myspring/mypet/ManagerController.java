package com.myspring.mypet;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ManagerController {
	
	@RequestMapping(value="/manager_commons.do") 
	public String manager_commons() {
		return "manager/manager_commons";
	}
	
	@RequestMapping(value="/manager.do") 
	public String manager() {
		return "manager/manager";
	}
	
	@RequestMapping(value="/manager_member.do") 
	public String manager_member() {
		return "manager/manager_member";
	}
	
	@RequestMapping(value="/manager_pet.do") 
	public String manager_pet() {
		return "manager/manager_pet";
	}
	
	@RequestMapping(value="/manager_near.do") 
	public String manager_near() {
		return "manager/manager_near";
	}
	
	@RequestMapping(value="/manager_diary.do") 
	public String manager_diary() {
		return "manager/manager_diary";
	}
	@RequestMapping(value="/manager_pet_content.do") 
	public String manager_pet_content() {
		return "manager/manager_pet_content";
	}
}
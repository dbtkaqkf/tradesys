package com.test.trade;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.trade.service.CustomService;
import com.test.trade.vo.AccountVO;
import com.test.trade.vo.CustomVO;

import net.sf.json.JSON;



/**
 * Handles requests for the application home page.
 */  
@Controller
public class HomeController {
	//===============================
	@Resource(name = "customService")
	private CustomService service;
	@RequestMapping(value = "/home.do")
	public String sawonAll(Model model) throws Exception  {


	    return "main";
	}
	
	@RequestMapping(value="/getinfo.do")
	public String getInfo(Model model,CustomVO vo)throws Exception{
		ArrayList <CustomVO> alist = new ArrayList<CustomVO>();
		if(vo.getbusiNum()=="" && vo.getCustom()=="") {
			return "redirect:/home.do";
		}else if(vo.getbusiNum()!=""){
			alist = service.getCustom1(vo);
			model.addAttribute("alist", alist);
			return"main";
		}else if(vo.getCustom()!=""){
			alist = service.getCustom2(vo);
			model.addAttribute("alist", alist);
			return"main";
		}else if(vo.getbusiNum()!="" && vo.getCustom()!=""){
			alist = service.getCustom(vo);
			model.addAttribute("alist", alist);
			return"main";	
		}
			else{
			return"redirect:/home.do";	

		}

	}
	@RequestMapping("getAllinfo.do")
	@ResponseBody
	public ArrayList<CustomVO> getAllinfo(@RequestParam(required = false) String custom, HttpServletRequest req, HttpSession session) {
		
	
		System.out.println(custom);
		ArrayList<CustomVO> list = new ArrayList<CustomVO>();
		try {
			list = service.getoneCustom(custom);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return list;
	
			
		
	}
	/*거래처 하나만불러오기*/
	/*@RequestMapping(value="/getoneinfo.do")
	public String getInfo1(Model model,CustomVO vo,HttpSession session)throws Exception{
		
		 vo = service.getoneCustom(vo);
		return"redirect:/home.do";
	}*/

	@RequestMapping(value="/insert.do")
	public String insertinfo(CustomVO vo,AccountVO vo2) throws Exception{
		System.out.println("asdasasdasdasdsadadadsaadadasdasdadasdadadadasdsadad");
		System.out.println(vo2.getFactory());
		service.insertInfo(vo);
		return "main";
	}

	@RequestMapping(value="/update.do")
	public String updateInfo(CustomVO vo,AccountVO vo2) throws Exception{
		
		service.updateInfo(vo);
		return "main";
	}
	@RequestMapping(value="/delete.do")
	public String deleteInfo(CustomVO vo,AccountVO vo2) throws Exception{
		service.deleteInfo(vo);
		return "main";
	}
	
	   
	
	

}

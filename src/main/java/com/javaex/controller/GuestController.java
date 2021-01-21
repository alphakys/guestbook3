package com.javaex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.javaex.dao.GuestDao;
import com.javaex.vo.GuestVo;

@Controller
@RequestMapping(value="/guest")
public class GuestController {
	
	@RequestMapping(value="/list", method= {RequestMethod.GET, RequestMethod.POST})
	public String list(Model model) {
		
		GuestDao gd = new GuestDao();
		
		model.addAttribute("gList", gd.getList());
		
		return "list";
	}
	
	
	@RequestMapping(value="/updateForm", method= {RequestMethod.GET, RequestMethod.POST})
	public String updateForm(Model model, @RequestParam("no") int no) {
		
		GuestDao gd = new GuestDao();
		
		model.addAttribute("guestVo", gd.getGuest(no));
		
		return "updateForm";
	}
	
	//수정하기 위해선 비밀번호가 일치할 시 가능하도록 설정. 따라서 비밀번호가 틀리면 다시 updateForm에 가야하는데 redirect로 보낼시는
	//수정하기 전의 기존 내용이 보여지게 하려면 redirect 수정하려고 했던 내용 그대로 뿌려주고 비밀번호만 다시 시도하게 하려면 forward 형태로
	//보낼 수 있다는 차이점 
	@RequestMapping(value="/update", method= {RequestMethod.GET, RequestMethod.POST})
	public String update(@ModelAttribute GuestVo gVo) {
		
		GuestDao gd = new GuestDao();
		int result = gd.update(gVo);
		
		if(result != 1) {
			return "updateForm";
		}
		else {
			return "redirect:/guest/list";
		}
		
		
	}
	
		
	@RequestMapping(value="/deleteForm", method= {RequestMethod.GET, RequestMethod.POST})
	public String deleteForm() {
		
		return "deleteForm";
	}
	

	@RequestMapping(value="/delete", method= {RequestMethod.GET, RequestMethod.POST})
	public String delete(@RequestParam("no") int no,
						 @RequestParam("name") String name,
						 @RequestParam("pw") String password) {
					
		GuestDao gd = new GuestDao();
		int result = gd.delete(no, name, password);
		
		if(result != 1) {
			return "deleteForm";
		}
		else {
			return "redirect:/guest/list";
		}
		
		
	}
	
		
	@RequestMapping(value="insert", method= {RequestMethod.GET, RequestMethod.POST})
	public String insert(@ModelAttribute GuestVo gVo) {
		
		GuestDao gd = new GuestDao();
		gd.insert(gVo);
		
		return "redirect:/guest/list";
	}
}

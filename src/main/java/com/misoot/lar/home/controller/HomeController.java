package com.misoot.lar.home.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.misoot.lar.common.interfaces.LarService;
import com.misoot.lar.home.model.service.HomeServiceImpl;
import com.misoot.lar.home.model.vo.Home;
import com.misoot.lar.lecture.model.vo.Lecture;
import com.misoot.lar.user.model.vo.User;

@Controller
public class HomeController {
	
	@Autowired
	LarService<Home> homeServiceImpl;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, @SessionAttribute(value="session_user", required=false) User user) {
		
		int user_index = 0;	
		int wish_cnt = 0;
		int lecture_cnt = 0;
		if(user != null) {
			user_index = user.getUser_index();
			wish_cnt = ((HomeServiceImpl)homeServiceImpl).wishCount(user_index);
			lecture_cnt = ((HomeServiceImpl)homeServiceImpl).lectureCount(user_index);
		}
		
		Map<String, Object> hmap = new HashMap<String, Object>();
		
		hmap.put("user_index", user_index);
		hmap.put("wish_cnt", wish_cnt);
		hmap.put("lecture_cnt", lecture_cnt);
		
		List<Lecture> recent_lecture_list = ((HomeServiceImpl)homeServiceImpl).selectLectureList("Recent", user_index);
		List<Lecture> recomand_lecture_list = ((HomeServiceImpl)homeServiceImpl).recomandLectureList(hmap);
		
		model.addAttribute("recent_lecture_list", recent_lecture_list)
		.addAttribute("recomand_lecture_list",recomand_lecture_list);
		
		return "home";
	}
	
	@RequestMapping(value="/aboutLar", method = RequestMethod.GET)
	public String aboutLar() {
		return "common/aboutLar";
	}
	
	@RequestMapping(value="/about", method = RequestMethod.GET)
	public String about() {
		return "common/about";
	}
	
	@RequestMapping(value = "/modal/{target}")
	public String get_modal_sign(@PathVariable("target") String target) {
		return "modal/_" + target;
	}
	
	@RequestMapping(value= "/importExample")
	public String importExample() {
		return "example/importExample";
	}
	
	@ExceptionHandler(RuntimeException.class)
	@ResponseStatus(HttpStatus.NOT_FOUND)
	public String handleResourceNotFoundException(Model model) {
        return "common/error";
    }
}
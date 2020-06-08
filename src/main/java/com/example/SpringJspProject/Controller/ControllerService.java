package com.example.SpringJspProject.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class ControllerService {

	@RequestMapping(value = "/jsp", method = RequestMethod.GET)
	public String getResponseMessage(Model model){
		
		
		model.addAttribute("name", "Soumya Chakraborty");
        return "jsp/sample";


	}
	

}

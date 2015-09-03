package com.indiapost;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;

@Controller
public class LoginController {

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	ModelAndView login() {
		return new ModelAndView("index", "command", new UserDetails());

	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	ModelAndView showDefaultPage() {

		return new ModelAndView("index", "command", new UserDetails());

	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public ModelAndView register(@ModelAttribute("indiapostweb") UserDetails userdetails, ModelMap model) {
		int userId = UserDataStore.addUserDetail(userdetails);

		model.addAttribute("firstname", userdetails.getFirstname());
		model.addAttribute("userId", userId);
		ScheduleUserDetails scheduleUserDetails = new ScheduleUserDetails();
		scheduleUserDetails.setUserId(userId);
		return new ModelAndView("schedule", "command", scheduleUserDetails);

	}

}

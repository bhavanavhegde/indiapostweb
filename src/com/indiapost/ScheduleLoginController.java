package com.indiapost;

//import java.util.Iterator;
import java.util.List;

//import org.apache.jasper.tagplugins.jstl.core.ForEach;
//import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;

import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ScheduleLoginController {
	@RequestMapping(value = "/setschedule", method = RequestMethod.GET)
	ModelAndView showSetSchedule(@ModelAttribute("indiapostweb") ScheduleUserDetails scheduleUserDetails,
			ModelMap model, @RequestParam("userId") Integer userId, @RequestParam("firstname") String firstname) {

		model.addAttribute("userId", userId);
		model.addAttribute("firstname", firstname);
		return new ModelAndView("schedule", "command", scheduleUserDetails);
	}

	@RequestMapping(value = "/confirmation", method = RequestMethod.POST)
	public String confirmatioPage(@ModelAttribute("indiapostweb") ScheduleUserDetails scheduleUserDetails,
			ModelMap model, @RequestParam("userId") Integer userId, @RequestParam("firstname") String firstname) {

		ScheduleDataStore.addScheduleDetail(scheduleUserDetails);

		System.out.println(userId);
		System.out.println(firstname);
		System.out.println(scheduleUserDetails.getDate());
		System.out.println(scheduleUserDetails.getTime());
		System.out.println(scheduleUserDetails.getApproximateweight());

		model.addAttribute("date", scheduleUserDetails.getDate());
		model.addAttribute("time", scheduleUserDetails.getTime());
		model.addAttribute("userId", scheduleUserDetails.getUserId());
		model.addAttribute("firstname", firstname);

		return "confirmation";

	}

	@RequestMapping(value = "/addpickupschedule", method = RequestMethod.POST)
	@ResponseBody
	public String addPickUpSchedule(@RequestBody ScheduleUserDetails scheduleUserDetails, ModelMap model) {
		ScheduleDataStore.addScheduleDetail(scheduleUserDetails);
		List<ScheduleUserDetails> userScheduleList = ScheduleDataStore
				.getScheduleDetailsOfUser(scheduleUserDetails.getUserId());

		for (ScheduleUserDetails schedule : userScheduleList) {
			System.out.println(schedule.getDate());
			System.out.println(schedule.getTime());
			System.out.println(schedule.getApproximateweight());
		}

		return "hey";
	}

}
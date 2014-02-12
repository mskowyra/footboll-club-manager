package com.skowyra.clubmanager.controller;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skowyra.clubmanager.model.Coach;
import com.skowyra.clubmanager.service.CoachService;


@Controller
@RequestMapping(value="/admin")
public class AdminController {

	private CoachService coachService;
	
	private Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	public AdminController(CoachService coachService) {
		this.coachService = coachService;
	}
	
	
	@RequestMapping(value="", method = RequestMethod.GET)
	public String index(ModelMap map) {
		logger.info("TESTING********");
		map.addAttribute("coach", coachService.listCoach());
		//map.addAttribute("teams", teamService.listTeam());
		return "admin.index";
	}
	
	@RequestMapping(value="/new", method = RequestMethod.GET)
	public String newCoach(Coach coach) {
		return "admin.new";
	}
	
	
	@RequestMapping(value="/new", method=RequestMethod.POST)
	public String create(@Valid Coach coach, BindingResult result, Model model) {
			if (result.hasErrors()) {
				logger.info("Create coach form, rendering new coach template");
				model.addAttribute("errors", result.getFieldErrors());
				model.addAttribute("coach", coach);
				return "admin.new";
			}
			logger.info("Create coach form. Creat redirecting to the coach show page");
			coachService.addOrUpdateCoach(coach);
			return "redirect:/admin/show=" + coach.getCoachId();
	}
		
	@RequestMapping(value="/show={coachId}", method=RequestMethod.GET)
	public String show(@PathVariable("coachId") Long coachId, Model model) {
		Coach coach = coachService.getCoach(coachId);
		model.addAttribute("coach", coach);
		return "admin.show";
	}
	
	@RequestMapping(value="/edit={coachId}", method=RequestMethod.GET)
	public String edit(@PathVariable("coachId") Long coachId, Model model) {
		Coach coach = coachService.getCoach(coachId);
		model.addAttribute("coach", coach);
		return "admin.edit";
	}
	@RequestMapping(value="/show={coachId}", method=RequestMethod.POST)
	public String update(@PathVariable("coachId") Long coachId, @Valid Coach coach, BindingResult result,Model model) 
			throws Exception {
		if (result.hasErrors()) {
			logger.info("Update coach form invalid, rendering new coach template");
			//model.addAttribute("teams", teamService.listTeam());
			model.addAttribute("errors", result.getFieldErrors());
			return "admin.edit";
		}

		logger.info("Update coach form valid. Updating record and redirecting to the coach show page.");
		coachService.addOrUpdateCoach(coach);
		return "redirect:/admin/show=" + coach.getCoachId();
	}

	@RequestMapping(value = "/delete={coachId}", method = RequestMethod.GET)
	public String delete(@PathVariable("coachId") Long coachId) throws Exception {
		coachService.deleteCoach(coachId);
		return "redirect:/admin";
	}
	
	@ExceptionHandler(Exception.class)
	public String exceptionHandler(Exception e) {
		e.printStackTrace();
		return "exceptions.exception";
	}
}
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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


import com.skowyra.clubmanager.model.Team;
import com.skowyra.clubmanager.service.CoachService;
import com.skowyra.clubmanager.service.TeamService;


@Controller
@RequestMapping(value="/team")
public class TeamController {

	private TeamService teamService;
	private CoachService coachService;
	
	private Logger logger = LoggerFactory.getLogger(TeamController.class);
	
	@Autowired
	public TeamController(TeamService teamService, CoachService coachService) {
		this.teamService = teamService;
		this.coachService = coachService;
	}
	
	@RequestMapping(value="", method = RequestMethod.GET)
	public String index(ModelMap map) {
		logger.info("Display list Teams");
		map.addAttribute("teams", teamService.listTeam());
		//map.addAttribute("teams", teamService.listTeam());
		return "team.index";
	}
	
//	@RequestMapping(value="/new", method = RequestMethod.GET)
//	public String newTeam(Team team) {
//		return "team.new";
//	}
	
	
	@RequestMapping(value="/new", method = RequestMethod.GET)
	public String newTeam(Model model) {
	
		logger.info("new team");
		model.addAttribute("team", new Team());
		model.addAttribute("coachs", coachService.listCoach());
		return "team.new";
	}
	
	
	
	
	
	@RequestMapping(value="/new", method=RequestMethod.POST)
	public String create(@Valid @ModelAttribute("team") Team team, BindingResult result,@RequestParam("coach.coachId") Long coachId, Model model) {
		if (result.hasErrors()) {
			logger.info("Create team form invalid, rendering new team template");
			
			model.addAttribute("coachs", coachService.listCoach());
			return "team.new";
		}
		logger.info("Create team form valid. Creating record and redirecting to the team show page");
		teamService.addOrUpdateTeam(team, coachId);
		
		return "redirect:/team/show=" + team.getTeamId();
	}

	
	
	
	
	// http://spring.io/guides/gs/validating-form-input/
//		@RequestMapping(value="/new", method=RequestMethod.POST)
//		public String create(@Valid Team team, BindingResult result, Model model) {
//			if (result.hasErrors()) {
//				logger.info("Create team form, rendering new team template");
//				model.addAttribute("errors", result.getFieldErrors());
//				model.addAttribute("team", team);
//				return "team.new";
//			}
//			logger.info("Create team form. Creating redirecting to the team show page");
//			teamService.addOrUpdateTeam(team);
//			return "redirect:/team/show=" + team.getTeamId();
//		}
		
	
	@RequestMapping(value="/show={teamId}", method=RequestMethod.GET)
	public String show(@PathVariable("teamId") Long teamId, Model model) {
		Team team = teamService.getTeam(teamId);
		model.addAttribute("team", team);
		return "team.show";
	}
	
	@RequestMapping(value="/edit={teamId}", method=RequestMethod.GET)
	public String edit(@PathVariable("teamId") Long teamId, Model model) {
		Team team = teamService.getTeam(teamId);
		model.addAttribute("team", team);
		return "team.edit";
	}
	
	@RequestMapping(value="/show={teamId}", method=RequestMethod.POST)
	public String update(@PathVariable("teamId") Long teamId, @Valid Team team, BindingResult result, Model model) 
			throws Exception {
		if (result.hasErrors()) {
			logger.info("Update team form, rendering new team template");
			model.addAttribute("errors", result.getFieldErrors());
			return "team.edit";
		}
	
		logger.info("Update team form valid. Updating redirecting to the team page.");
		teamService.addOrUpdateTeam(team);
		return "redirect:/team/show=" + team.getTeamId();
	}
	
	@RequestMapping(value = "/delete={teamId}", method = RequestMethod.GET)
	public String delete(@PathVariable("teamId") Long teamId) throws Exception {
		teamService.deleteTeam(teamId);
		return "redirect:/team";
	}
	
	@ExceptionHandler(Exception.class)
	public String exceptionHandler(Exception e) {
		e.printStackTrace();
		return "exceptions.exception";
	}
}
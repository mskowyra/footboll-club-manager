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

import com.skowyra.clubmanager.model.Matches;

import com.skowyra.clubmanager.service.MatchesService;


@Controller
@RequestMapping(value="/match")
public class MatchesController {

	private MatchesService matchesService;

		
	private Logger logger = LoggerFactory.getLogger(MatchesController.class);
	
	@Autowired
	public MatchesController(MatchesService matchesService) {
		this.matchesService = matchesService;
	}
	
	@RequestMapping(value="", method = RequestMethod.GET)
	public String index(ModelMap map) {
		logger.info("Create matches list");
		map.addAttribute("matches", matchesService.listMatches());
		return "matches.index";
	}
	
	@RequestMapping(value="/new", method = RequestMethod.GET)
	public String newMatch(Model model) {
		model.addAttribute("matches", new Matches());
		
		return "matches.new";
	}
	
	@RequestMapping(value="/new", method=RequestMethod.POST)
	public String create(@Valid Matches matches, BindingResult result, Model model) {
		if (result.hasErrors()) {
			logger.info("Create coach form, rendering new coach template");
			model.addAttribute("errors", result.getFieldErrors());
			model.addAttribute("matches", matches);
			return "matches.new";
		}
		logger.info("Create coach form. Creat redirecting to the coach show page");
		matchesService.addOrUpdateMatches(matches);
		return "redirect:/match/show=" + matches.getMatchesId();
	}

	@RequestMapping(value="/show={matchesId}", method=RequestMethod.GET)
	public String show(@PathVariable("matchesId") Long matchesId, Model model) {
		Matches matches = matchesService.getMatches(matchesId);
		model.addAttribute("matches", matches);
		return "matches.show";
	}
	
	@RequestMapping(value="/edit={matchesId}", method=RequestMethod.GET)
	public String edit(@PathVariable("matchesId") Long matchesId, Model model) {
		Matches matches = matchesService.getMatches(matchesId);
		model.addAttribute("matches", matches);
		return "matches.edit";
	}
	
	@RequestMapping(value="/show={matchesId}", method=RequestMethod.POST)
	public String update(@PathVariable("matchesId") Long matchesId, @Valid Matches matches, BindingResult result,Model model) 
			throws Exception {
		if (result.hasErrors()) {
			logger.info("Update coach form invalid, rendering new coach template");
			
			model.addAttribute("errors", result.getFieldErrors());
			return "matches.edit";
		}

		logger.info("Update coach form valid. Updating record and redirecting to the coach show page.");
		matchesService.addOrUpdateMatches(matches);
		return "redirect:/match/show=" + matches.getMatchesId();
	}

	@RequestMapping(value = "/delete={matchesId}", method = RequestMethod.GET)
	public String delete(@PathVariable("matchesId") Long matchesId) throws Exception {
		matchesService.deleteMatches(matchesId);
		return "redirect:/match";
	}
	
	
	
		
	
	@ExceptionHandler(Exception.class)
	public String exceptionHandler(Exception e) {
		e.printStackTrace();
		return "exceptions.exception";
	}
	
}

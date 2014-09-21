package com.skowyra.clubmanager.controller;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.skowyra.clubmanager.model.Matches;
import com.skowyra.clubmanager.model.Player;
import com.skowyra.clubmanager.model.PlayerMatches;
import com.skowyra.clubmanager.service.MatchesService;
import com.skowyra.clubmanager.service.PlayerService;


@Controller
@RequestMapping(value="/match/result")
public class ResultMatchesController {
	
	private MatchesService matchesService;
	private PlayerService playerService;
	
	private Logger logger = LoggerFactory.getLogger(ResultMatchesController.class);
	
	@Autowired
	public ResultMatchesController(MatchesService matchesService,PlayerService playerService) {
		this.matchesService = matchesService;
		this.playerService = playerService;
	}
		
	@RequestMapping(value="/new", method = RequestMethod.GET)
	public String newMatch(@ModelAttribute("playerMatches")PlayerMatches playerMatches,  Model model) {
		model.addAttribute("player", playerService.listPlayer());
		model.addAttribute("matches", matchesService.listMatches());
		return "result.new";
	}
	
	@RequestMapping(value="/new", method=RequestMethod.POST)
	public String create(@Valid @ModelAttribute("playerMatches") PlayerMatches playerMatches, BindingResult result,
			@RequestParam("matches.matchesId") Long matchesId,@RequestParam("player.id") Long playerId, 
			@RequestParam("timePlay") Integer timePlay,@RequestParam("goals") Integer goals,
			@RequestParam("yellowCard") Integer yellowCard,@RequestParam("redCard") Integer redCard,Model model) {
			
		if (result.hasErrors()) {
			logger.info("Create contact form invalid, rendering new contact template");
			
			model.addAttribute("player", playerService.listPlayer());
			model.addAttribute("matches", matchesService.listMatches());
			return "result.new";
		}
		logger.info("Create contact form valid. Creating record and redirecting to the contact show page");
		
		Matches matches = matchesService.getMatches(matchesId);
		Player player = playerService.getPlayer(playerId);
		
			PlayerMatches playerMatchess = new PlayerMatches();
				playerMatchess.setMatches(matches);
				playerMatchess.setPlayer(player);
				playerMatchess.setTimePlay(timePlay);			
			
		matches.getPlayerMatches().add(playerMatches);
				
		matchesService.addOrUpdateMatches(matches);
		return "redirect:/matches/result/new";
	}
}

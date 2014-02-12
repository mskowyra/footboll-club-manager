package com.skowyra.clubmanager.controller;

import javax.annotation.PostConstruct;
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

import com.skowyra.clubmanager.controller.PlayerController;
import com.skowyra.clubmanager.model.Player;
import com.skowyra.clubmanager.service.PlayerService;
import com.skowyra.clubmanager.service.TeamService;



@Controller
@RequestMapping(value="/player")
public class PlayerController {

	private PlayerService playerService;
	private TeamService teamService;

	private Logger logger = LoggerFactory.getLogger(PlayerController.class);

	@Autowired
	public PlayerController(PlayerService playerService, TeamService teamService) {
		this.playerService = playerService;
		this.teamService = teamService;
		
	}
	
	@RequestMapping(value="", method = RequestMethod.GET)
	public String index(ModelMap map) {
		logger.info("TESTING********");
		map.addAttribute("players", playerService.listPlayer());
		//map.addAttribute("teams", teamService.listTeam());
		return "player.index";
	}

	@RequestMapping(value="/new", method = RequestMethod.GET)
	public String newPlayer(Model model) {
	
		logger.info("TESTING222********");
		model.addAttribute("player", new Player());
	
		model.addAttribute("teams", teamService.listTeam());
		return "player.new";
	}
	
	
	// http://spring.io/guides/gs/validating-form-input/
	@RequestMapping(value="/new", method=RequestMethod.POST)
	public String create(@Valid @ModelAttribute("player") Player player, BindingResult result,@RequestParam("team.teamId") Long teamId, Model model) {
		if (result.hasErrors()) {
			logger.info("Create contact form invalid, rendering new contact template");
			
			model.addAttribute("teams", teamService.listTeam());
			return "player.new";
		}
		logger.info("Create contact form valid. Creating record and redirecting to the contact show page");
		playerService.addOrUpdatePlayer(player, teamId);
		
		return "redirect:/player/show=" + player.getId();
	}

	@RequestMapping(value="/show={id}", method=RequestMethod.GET)
	public String show(@PathVariable("id") Long id, Model model) {
		Player player = playerService.getPlayer(id);
		model.addAttribute("player", player);
		return "player.show";
	}

	@RequestMapping(value="/edit={id}", method=RequestMethod.GET)
	public String edit(@PathVariable("id") Long id, Model model) {
		Player player = playerService.getPlayer(id);
		model.addAttribute("player", player);
		model.addAttribute("teams", teamService.listTeam());
		return "player.edit";
	}

	@RequestMapping(value="/show={id}", method=RequestMethod.POST)
	public String update(@PathVariable("id") Long id, @Valid Player player, BindingResult result,@RequestParam("team.teamId") Long teamId, Model model) 
			throws Exception {
		if (result.hasErrors()) {
			logger.info("Update contact form invalid, rendering new contact template");
			model.addAttribute("teams", teamService.listTeam());
			model.addAttribute("errors", result.getFieldErrors());
			return "player.edit";
		}

		logger.info("Update contact form valid. Updating record and redirecting to the contact show page.");
		playerService.addOrUpdatePlayer(player, teamId);
		return "redirect:/player/show=" + player.getId();
	}

	@RequestMapping(value = "/delete={id}", method = RequestMethod.GET)
	public String delete(@PathVariable("id") Long id) throws Exception {
		playerService.deletePlayer(id);
		return "redirect:/player";
	}


	
//	@RequestMapping(value="/add", method=RequestMethod.GET)
//	public String addUserPage() {
//		ModelAndView modelAndView = new ModelAndView("player.new");
//		modelAndView.addObject("player", new Player());
//		List<Team> teams = teamService.listTeam();
//		modelAndView.addObject("teams", teams);
//		return "player.new";
//	}
	
	
	
	@ExceptionHandler(Exception.class)
	public String exceptionHandler(Exception e) {
		e.printStackTrace();
		return "exceptions.exception";
	}

	
	
	


	
	
@PostConstruct
	public void prepareFakeDomain() {
		// Remove what's there
	//	List<Player> player = playerService.listPlayer();
	//	for (Player p : player) {
	//		playerService.deletePlayer(p.getId());
	//	}

		 //playerService.addOrUpdatePlayer(new Player("Pete", "Mitchell"));
		 //playerService.addOrUpdatePlayer(new Player("Tyler", "Durden"));
		 //playerService.addOrUpdatePlayer(new Player("Roland", "Bozz"));
	}

}

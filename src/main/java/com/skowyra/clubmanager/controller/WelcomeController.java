package com.skowyra.clubmanager.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;




import com.skowyra.clubmanager.controller.WelcomeController;



@Controller
public class WelcomeController {
	
	
    private static Logger logger = LoggerFactory.getLogger(WelcomeController.class);
    
     
    @RequestMapping(method = RequestMethod.GET, value = "/")
    public String showWelcomePage(Model model) {
        logger.debug("Page Request: /welcome.do");
        
        return "login.index";
    }
    

}

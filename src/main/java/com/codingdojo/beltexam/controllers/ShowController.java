package com.codingdojo.beltexam.controllers;

//import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.codingdojo.beltexam.models.Comment;
import com.codingdojo.beltexam.models.Show;
import com.codingdojo.beltexam.models.User;
//import com.codingdojo.beltexam.models.User;
//import com.codingdojo.beltexam.services.CommentService;
import com.codingdojo.beltexam.services.ShowService;
import com.codingdojo.beltexam.services.UserService;

@Controller
public class ShowController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private ShowService showService;
	
	@GetMapping("/cardView")
	public String cardView(Model model, HttpSession session) {
        
        if(userService.getSessionUser(session) == null) return "redirect:/";
        Long userId = (Long) session.getAttribute("userId");
        User user = userService.getUser(userId);

        model.addAttribute("allShows", showService.getAllShows());
        model.addAttribute("validUser", user);
        model.addAttribute("allUsers", userService.getAllUsers());

	    return "cards.jsp";
	}
	
    @GetMapping("/addShow")
    public String createShow(@ModelAttribute("newShow") Show show, HttpSession session) {
    	
    	if(userService.getSessionUser(session) == null) return "redirect:/";
    	
    	return "newShow.jsp";
    }

    @PostMapping("/saveShow")
    public String saveShow(@Valid @ModelAttribute("newShow") Show show, BindingResult results, 
    		Model model, HttpSession session, RedirectAttributes redirectAttributes) {

        if(results.hasErrors()) {
            model.addAttribute("newShow", show);
            return "newShow.jsp";
        }
    	
    	Long userId = (Long) session.getAttribute("userId");
    	if(userId == null) return "redirect:/";
    	
    	showService.createShow(userId, show);
        redirectAttributes.addFlashAttribute("message", "Your Show Has Been Saved");

    	return "redirect:/dashboard";
    }

    @GetMapping("/viewShow/{id}")
    public String viewShow(@PathVariable Long id, @ModelAttribute("newComment") Comment comment, 
            Model model, HttpSession session) {
    	
    	if(userService.getSessionUser(session) == null) return "redirect:/";
    	
    	model.addAttribute("show", showService.getShow(id));
    	return "viewShow.jsp";
    }

    @GetMapping("/editShow/{id}")
    public String editShow(@PathVariable Long id, @ModelAttribute("show") Show show, 
    		Model model, HttpSession session) {
    	
    	if(userService.getSessionUser(session)== null) return "redirect:/";
    	
    	model.addAttribute("show", showService.getShow(id));
    	return "editShow.jsp";
    }

    @PutMapping("/updateShow/{id}")
    public String updateShow(@PathVariable Long id, 
    		@Valid @ModelAttribute("show") Show show, BindingResult results, 
    		Model model, HttpSession session, RedirectAttributes redirectAttributes) {
    	
        if(results.hasErrors()) {
            model.addAttribute("show", show);
            return "editShow.jsp";
        }
    	if(userService.getSessionUser(session) == null) return "redirect:/";
    	
    	showService.updateShow(show);
        redirectAttributes.addFlashAttribute("message", "Your Show Has Been Updated");
    	return "redirect:/dashboard";
    }

    @DeleteMapping("/deleteShow/{id}")
    public String deleteShow(@PathVariable Long id, HttpSession session, RedirectAttributes redirectAttributes) {
    	
    	if(userService.getSessionUser(session) == null) return "redirect:/";
    	
    	showService.deleteShow(id);

        redirectAttributes.addFlashAttribute("message", "You Have Deleted A Show");
    	return "redirect:/dashboard";
    }
    
    @PutMapping("/updateLikes/{id}")
    public String updateLikes(@PathVariable Long id,  @ModelAttribute("newComment") Comment comment, 
            HttpSession session, RedirectAttributes redirectAttributes) {
        
        if(userService.getSessionUser(session) == null) return "redirect:/";
        
        Show show = showService.getShow(id);
        
        int likes = show.getLikes();
        likes = likes + 1;
        show.setLikes(likes);

        showService.updateShow(show);
        redirectAttributes.addFlashAttribute("message", "Your Show Has Been Liked");
        return "redirect:/viewShow/{id}";
    }

    @PutMapping("/updateDisLikes/{id}")
    public String updateDisLikes(@PathVariable Long id,  @ModelAttribute("newComment") Comment comment, 
            HttpSession session, RedirectAttributes redirectAttributes) {
        
        if(userService.getSessionUser(session) == null) return "redirect:/";
        
        Show show = showService.getShow(id);
        
        int dislikes = show.getDisLikes();
        dislikes = dislikes + 1;
        show.setDisLikes(dislikes);

        showService.updateShow(show);
        redirectAttributes.addFlashAttribute("message", "Your Show Is Not Liked");
        return "redirect:/viewShow/{id}";
    }
}

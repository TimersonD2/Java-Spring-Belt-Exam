package com.codingdojo.beltexam.controllers;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.codingdojo.beltexam.models.Comment;
import com.codingdojo.beltexam.models.User;
import com.codingdojo.beltexam.services.CommentService;
import com.codingdojo.beltexam.services.ShowService;
import com.codingdojo.beltexam.services.UserService;

@Controller
public class CommentController {
    
    @Autowired
    private UserService userService;
    
    @Autowired
    private ShowService showService;
    
    @Autowired
    private CommentService commentService;

    @PostMapping("/saveComment/{showId}")
    public String saveComment(@PathVariable Long showId, @Valid @ModelAttribute("newComment") Comment comment, BindingResult results, 
            Model model, HttpSession session, RedirectAttributes redirectAttributes) {

        if(results.hasErrors()) {
            model.addAttribute("newComment", comment);
            return "viewShow.jsp";
        }
        
        Long userId = (Long) session.getAttribute("userId");
        if(userId == null) return "redirect:/";
        
        commentService.createComment(showId, userId, comment);
        redirectAttributes.addFlashAttribute("message", "Your Comment Has Been Saved");

        return "redirect:/dashboard";
    }
    
    @GetMapping("/myComments")
    public String myComments(HttpSession session, Model model) {
        
        Long userId = (Long) session.getAttribute("userId");
        if(userService.getSessionUser(session) == null) return "redirect:/";

        model.addAttribute("allShows", showService.getAllShows());
        User user = userService.getUser(userId);
        model.addAttribute("validUser", user);
//        model.addAttribute("allUsers", userService.getAllUsers());

        return "comments.jsp";
    }
    
    @DeleteMapping("/deleteComment/{id}")
    public String deleteComment(@PathVariable Long id, HttpSession session, RedirectAttributes redirectAttributes) {
        
        if(userService.getSessionUser(session) == null) return "redirect:/";
        
        System.out.print("deleting comment");
        commentService.deleteComment(id);

        redirectAttributes.addFlashAttribute("message", "You Have Deleted A Comment");
        return "redirect:/dashboard";
    }
}

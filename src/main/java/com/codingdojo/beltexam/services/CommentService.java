package com.codingdojo.beltexam.services;

//import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.beltexam.models.Comment;
import com.codingdojo.beltexam.models.Show;
import com.codingdojo.beltexam.models.User;
import com.codingdojo.beltexam.repositories.CommentRepository;

@Service
public class CommentService {
    
    @Autowired
    private CommentRepository commentRepo;
    
    @Autowired
    private ShowService showService;
    
    @Autowired
    private UserService userService;
    
    
//    Create Comment
    public Comment createComment(Long showId, Long userId, Comment comment) {
        Show show = showService.getShow(showId);
        comment.setShow(show);
        User user = userService.getUser(userId);
        comment.setUser(user);
        return commentRepo.save(comment);
    }

    
    
    
}

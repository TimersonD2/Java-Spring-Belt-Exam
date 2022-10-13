package com.codingdojo.beltexam.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.beltexam.models.Show;
import com.codingdojo.beltexam.models.User;
import com.codingdojo.beltexam.repositories.ShowRepository;

@Service
public class ShowService {
	
	@Autowired
	private ShowRepository showRepo;
	
	@Autowired
	private UserService userService;
	
//	Create A Show
	public Show createShow(Long userId, Show show) {
		User user = userService.getUser(userId);
		show.setUser(user);
		return showRepo.save(show);
	}
	
////	Retrieve A Show By ID
	public Show getShow(Long id) {
		return showRepo.findById(id).orElse(null);
	}
	
////	Get All Shows
	public List<Show> getAllShows() {
		return showRepo.findAll();
	}
	
////	Update A Show
	public Show updateShow(Show book) {
		return showRepo.save(book);
	}
	
////	Delete A Show
	public void deleteShow(Long id) {
		showRepo.deleteById(id);
	}

	

}

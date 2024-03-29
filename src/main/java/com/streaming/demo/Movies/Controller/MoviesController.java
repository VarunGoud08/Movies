package com.streaming.demo.Movies.Controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/movies")
public class MoviesController {

    @GetMapping("/req")
    public ResponseEntity<String> requestMovies(){
        return new ResponseEntity<>("Request Movie will be added in 15 Days", HttpStatus.OK);
    }
}

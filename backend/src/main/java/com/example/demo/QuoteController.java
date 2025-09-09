package com.example.demo;

import java.util.List;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class QuoteController {

    private final QuoteService service;
    public QuoteController(QuoteService service) { this.service = service; }

    // Random quote
    @GetMapping("/quotes/random")
    public Quote getRandom() { return service.getRandomQuote(); }

    // All quotes
    @GetMapping("/quotes")
    public List<Quote> getAll() { return service.getAllQuotes(); }

    // Favorites
    @GetMapping("/favorites")
    public List<Quote> getFavorites() { return service.getFavorites(); }

    @PostMapping("/favorites")
    public Quote addFavorite(@RequestBody IdRequest req) { return service.addFavorite(req.getId()); }

    @DeleteMapping("/favorites/{id}")
    public void removeFavorite(@PathVariable Long id) { service.removeFavorite(id); }

    // DTO for POST favorite
    public static class IdRequest {
        private Long id;
        public Long getId() { return id; }
        public void setId(Long id) { this.id = id; }
    }
}

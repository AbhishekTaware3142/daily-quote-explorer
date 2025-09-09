package com.example.demo;

import java.util.List;
import java.util.Random;

import org.springframework.stereotype.Service;

@Service
public class QuoteService {
    private final QuoteRepository repository;
    private final Random random = new Random();

    public QuoteService(QuoteRepository repository) {
        this.repository = repository;
    }

    public List<Quote> getAllQuotes() {
        return repository.findAll();
    }

    public Quote getRandomQuote() {
        List<Quote> all = repository.findAll();
        if (all.isEmpty()) {
			throw new IllegalStateException("No quotes in database");
		}
        return all.get(random.nextInt(all.size()));
    }

    public List<Quote> getFavorites() {
        return repository.findByFavoriteTrue();
    }

    public Quote addFavorite(Long id) {
        Quote q = repository.findById(id).orElseThrow();
        q.setFavorite(true);
        return repository.save(q);
    }

    public void removeFavorite(Long id) {
        Quote q = repository.findById(id).orElseThrow();
        q.setFavorite(false);
        repository.save(q);
    }

    public Quote addQuote(String text, String author) {
        return repository.save(new Quote(text, author));
    }
}

import 'package:flutter/material.dart';
import '../models/quote.dart';
import '../services/api_service.dart';

class QuotesProvider extends ChangeNotifier {
  final ApiService api;
  Quote? current;
  List<Quote> favorites = [];
  bool loading = false;

  QuotesProvider(this.api);

  /// Load a random quote
  Future<void> loadRandom() async {
    loading = true;
    notifyListeners();

    current = await api.fetchRandom();

    loading = false;
    notifyListeners();
  }

  /// Load favorites from API
  Future<void> loadFavorites() async {
    favorites = await api.fetchFavorites();
    notifyListeners();
  }

  /// Save current quote to favorites
  Future<bool> saveFavorite() async {
    if (current == null) return false;

    // Already in favorites?
    if (favorites.any((f) => f.id == current!.id)) return false;

    bool ok = await api.addFavorite(current!.id);
    if (ok) {
      await loadFavorites(); // reload list
    }
    return ok;
  }

  /// Remove quote from favorites
  Future<bool> removeFavorite(String id) async {
    try {
      bool ok = await api.removeFavorite(id);
      if (ok) {
        favorites.removeWhere((f) => f.id == id);
        notifyListeners();
      }
      return ok;
    } catch (e) {
      debugPrint("Error removing favorite: $e");
      return false;
    }
  }
}

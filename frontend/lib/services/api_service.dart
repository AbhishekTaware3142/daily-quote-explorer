import 'dart:convert';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:http/http.dart' as http;
import '../models/quote.dart';

class ApiService {
  // Adjust base for Android emulator
  static String get base {
    if (kIsWeb) return 'http://127.0.0.1:8080/api';
    if (Platform.isAndroid) return 'http://10.0.2.2:8080/api';
    return 'http://127.0.0.1:8080/api';
  }

  Future<Quote?> fetchRandom() async {
    final res = await http.get(Uri.parse('$base/quotes/random'));
    if (res.statusCode == 200) {
      return Quote.fromJson(json.decode(res.body));
    }
    return null;
  }

  Future<List<Quote>> fetchFavorites() async {
    final res = await http.get(Uri.parse('$base/favorites'));
    if (res.statusCode == 200) {
      final List data = json.decode(res.body);
      return data.map((e) => Quote.fromJson(e)).toList();
    }
    return [];
  }

  Future<bool> addFavorite(String id) async {
    final res = await http.post(
      Uri.parse('$base/favorites'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'id': id}),
    );
    return res.statusCode == 200 || res.statusCode == 201;
  }

  Future<bool> removeFavorite(String id) async {
    final res = await http.delete(Uri.parse('$base/favorites/$id'));
    return res.statusCode == 200 || res.statusCode == 204;
  }
}

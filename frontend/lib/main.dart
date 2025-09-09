import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/quotes_provider.dart';
import 'services/api_service.dart';
import 'screens/home_screen.dart';
import 'screens/favorites_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final api = ApiService();
  int idx = 0;
  final pages = [HomeScreen(), FavoritesScreen()];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => QuotesProvider(api),
      child: MaterialApp(
        title: 'Daily Quote Explorer',
        home: Scaffold(
          body: pages[idx],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: idx,
            onTap: (i) => setState(() => idx = i),
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: 'Favorites'),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quotes_provider.dart';

class FavoritesScreen extends StatefulWidget {
  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  void initState() {
    super.initState();
    // safer way to call provider after widget build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<QuotesProvider>(context, listen: false).loadFavorites();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<QuotesProvider>(builder: (_, p, __) {
      if (p.favorites.isEmpty) {
        return Center(child: Text('No favorites yet'));
      }
      return ListView.builder(
        itemCount: p.favorites.length,
        itemBuilder: (_, i) {
          final q = p.favorites[i];
          return ListTile(
            title: Text(q.text),
            subtitle: Text(q.author),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () async {
                final ok = await p.removeFavorite(q.id);
                if (!ok) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Delete failed')),
                  );
                }
              },
            ),
          );
        },
      );
    });
  }
}

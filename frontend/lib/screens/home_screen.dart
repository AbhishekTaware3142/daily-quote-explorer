import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quotes_provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late QuotesProvider prov;

  @override
  void initState() {
    super.initState();
    prov = Provider.of<QuotesProvider>(context, listen: false);
    prov.loadRandom();
    prov.loadFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<QuotesProvider>(builder: (_, p, __) {
      final q = p.current;
      return SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                child: q == null
                    ? Center(
                        child: p.loading
                            ? CircularProgressIndicator()
                            : Text('No quote'),
                      )
                    : Card(
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                q.text,
                                style: TextStyle(fontSize: 20),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 16),
                              Text(
                                '- ${q.author}',
                                style:
                                    TextStyle(fontStyle: FontStyle.italic),
                              ),
                            ],
                          ),
                        ),
                      ),
              ),
              Row(
                children: [
                  ElevatedButton.icon(
                    onPressed: () => p.loadRandom(),
                    icon: Icon(Icons.refresh),
                    label: Text('Get New Quote'),
                  ),
                  SizedBox(width: 12),
                  ElevatedButton.icon(
                    onPressed: () async {
                      final ok = await p.saveFavorite();
                      final snack =
                          ok ? 'Saved to favorites' : 'Already a favorite';
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(snack)),
                      );
                    },
                    icon: Icon(Icons.favorite),
                    label: Text('Save'),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app_one/models/favorites.dart';

class FavoritesPage extends StatelessWidget {
  static String routeName = '/favorites_page';

  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoriler'),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Consumer<Favorites>(
        builder: (context, value, child) => ListView.builder(
          itemCount: value.items.length,
          padding: const EdgeInsets.symmetric(vertical: 16),
          itemBuilder: (context, index) => FavoriteItemTile(value.items[index]),
        ),
      ),
    );
  }
}

class FavoriteItemTile extends StatelessWidget {
  final int itemNo;

  const FavoriteItemTile(this.itemNo, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.primaries[itemNo % Colors.primaries.length],
        ),
        title: Text(
          'Renk $itemNo',
          key: Key('favorites_text_$itemNo'),
        ),
        trailing: IconButton(
          key: Key('remove_icon_$itemNo'),
          icon: const Icon(Icons.close),
          onPressed: () {
            Provider.of<Favorites>(context, listen: false).remove(itemNo);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Favorilerden kaldırıldı.'),
                duration: Duration(seconds: 1),
              ),
            );
          },
        ),
      ),
    );
  }
}

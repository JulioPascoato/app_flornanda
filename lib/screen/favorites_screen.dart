import 'package:flornanda/widgets/drawer_navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flornanda/providers/favorites_provider.dart';

import 'package:flornanda/widgets/product_item.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerNavigation(),
      appBar: AppBar(
        title: const Text('Favoritos'),
      ),
      body: Consumer<FavoritesProvider>(
        builder:
            (BuildContext context, FavoritesProvider favorites, Widget? child) {
          return favorites.favoristlist.isEmpty
              ? const ListTile(
                  leading: Icon(
                    Icons.favorite,
                  ),
                  title: Text('Ainda não há favoritos'),
                )
              : ListView.builder(
                  itemCount: favorites.favoristlist.length,
                  itemBuilder: (context, index) => ProductItem(
                    product: favorites.favoristlist[index],
                  ),
                );
        },
      ),
    );
  }
}

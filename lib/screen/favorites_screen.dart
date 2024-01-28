import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flornanda/providers/favorites_provider.dart';
import 'package:flornanda/widgets/drawer_navigation.dart';
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
            (BuildContext context, FavoritesProvider products, Widget? child) {
          return products.favoristlist.isEmpty
              ? const ListTile(
                  leading: Icon(
                    Icons.favorite,
                  ),
                  title: Text('Ainda não há favoritos'),
                )
              : ListView.builder(
                  itemCount: products.favoristlist.length,
                  itemBuilder: (context, index) => ProductItem(
                    product: products.favoristlist[index],
                  ),
                );
        },
      ),
    );
  }
}

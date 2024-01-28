import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flornanda/providers/products_provider.dart';
import 'package:flornanda/screen/add_product_screen.dart';
import 'package:flornanda/widgets/drawer_navigation.dart';
import 'package:flornanda/widgets/product_item.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerNavigation(),
      appBar: AppBar(
        title: const Text('Produtos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => const AddProductScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Consumer<ProductProvider>(
        builder:
            (BuildContext context, ProductProvider products, Widget? child) {
          return products.productList.isEmpty
              ? const ListTile(
                  leading: Icon(
                    Icons.shopping_bag,
                  ),
                  title: Text('Ainda não há produtos cadastrados'),
                )
              : ListView.builder(
                  itemCount: products.productList.length,
                  itemBuilder: (context, index) => ProductItem(
                    product: products.productList[index],
                  ),
                );
        },
      ),
    );
  }
}

import 'package:flornanda/providers/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flornanda/widgets/drawer_navigation.dart';
import 'package:flornanda/widgets/product_item.dart';

class OnSalesScreen extends StatelessWidget {
  const OnSalesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerNavigation(),
      appBar: AppBar(
        title: const Text('Promoções'),
      ),
      body: Consumer<ProductProvider>(
        builder:
            (BuildContext context, ProductProvider products, Widget? child) {
          return products.onSalesProductList.isEmpty
              ? const ListTile(
                  leading: Icon(
                    Icons.sell,
                  ),
                  title: Text('Ainda não há produtos em promoção'),
                )
              : ListView.builder(
                  itemCount: products.onSalesProductList.length,
                  itemBuilder: (context, index) => ProductItem(
                    product: products.onSalesProductList[index],
                  ),
                );
        },
      ),
    );
  }
}

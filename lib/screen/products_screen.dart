import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flornanda/providers/products_provider.dart';
import 'package:flornanda/screen/add_product_screen.dart';
import 'package:flornanda/widgets/drawer_navigation.dart';
import 'package:flornanda/widgets/product_item.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  Widget progressIndicator() => const Center(
        child: CircularProgressIndicator(),
      );

  Widget centeredText(String text) => Center(
        child: Text('Error: $text'),
      );

  @override
  Widget build(BuildContext context) {
    ProductProvider products = Provider.of<ProductProvider>(context);

    return Scaffold(
      drawer: const DrawerNavigation(),
      appBar: AppBar(
        title: const Text('Produtos'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const AddProductScreen();
              }));
            },
            icon: const Icon(
              Icons.add,
              //color: Theme.of(context).colorScheme.primary,
            ),
            tooltip: 'Sair',
          )
        ],
      ),
      body: FutureBuilder(
          future: products.list(),
          builder: (context, snapshot) {
            final connectionState = snapshot.connectionState;
            if (connectionState == ConnectionState.waiting) {
              return progressIndicator();
            } else if (snapshot.hasError) {
              return centeredText('${snapshot.error}');
            } else if (snapshot.hasData) {
              return snapshot.data!.isEmpty
                  ? const ListTile(
                      leading: Icon(
                        Icons.shopping_bag,
                      ),
                      title: Text('Ainda não há produtos cadastrados'),
                    )
                  : ListView.builder(
                      reverse: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) => ProductItem(
                        product: snapshot.data![index],
                      ),
                    );
            } else {
              return centeredText('No data available');
            }
          }),
    );
  }
}

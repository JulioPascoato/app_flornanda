import 'package:firebase_auth/firebase_auth.dart';
import 'package:flornanda/screen/login_screen.dart';
import 'package:flutter/material.dart';

import 'package:flornanda/screen/favorites_screen.dart';
import 'package:flornanda/screen/products_screen.dart';
import 'package:flornanda/screen/on_sales_screen.dart';

class DrawerNavigation extends StatelessWidget {
  const DrawerNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;

    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            // <-- SEE HERE
            decoration: BoxDecoration(color: colorScheme.primary),
            accountName: null,

            accountEmail: Text(
              FirebaseAuth.instance.currentUser!.email.toString(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            currentAccountPicture: Image.asset('assets/images/logo.png'),
          ),
          ListTile(
            leading: const Icon(
              Icons.shopping_bag,
            ),
            title: const Text('Produtos'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ProductsScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.sell),
            title: const Text('Promoções'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const OnSalesScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('Favoritos'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const FavoritesScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('sair'),
            onTap: () {
              final auth = FirebaseAuth.instance;
              auth.signOut().then(
                    (value) => Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    ),
                  );
            },
          )
        ],
      ),
    );
  }
}

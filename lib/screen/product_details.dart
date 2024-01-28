import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flornanda/model/product.dart';
import 'package:flornanda/providers/favorites_provider.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    final FavoritesProvider favoriteProducts =
        Provider.of<FavoritesProvider>(context);

    final isFavorite = favoriteProducts.favoristlist.contains(product);

    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;

    return Scaffold(
        appBar: AppBar(
          title: Text(product.name),
          actions: [
            IconButton(
              onPressed: () {
                final wasAdded =
                    favoriteProducts.toggleProductFavoriteStatus(product);
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(wasAdded
                        ? 'Produto adicionado aos favoritos.'
                        : 'Produto removido.'),
                  ),
                );
              },
              icon: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, animation) {
                  return RotationTransition(
                    turns: Tween<double>(begin: 0.8, end: 1).animate(animation),
                    child: child,
                  );
                },
                child: Icon(
                  isFavorite ? Icons.star : Icons.star_border,
                  key: ValueKey(isFavorite),
                ),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Hero(
                tag: product.id,
                child: Image.file(
                  product.image,
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 14),
                    Row(
                      children: [
                        Text(
                          'R\$ ${product.price.toStringAsFixed(2)}',
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    color: colorScheme.onPrimaryContainer,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          '${product.discount}% OFF',
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: colorScheme.onErrorContainer,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    Text(
                      'Pacote com: ${product.quantity} unidades',
                      style: theme.textTheme.bodyMedium!.copyWith(
                        color: colorScheme.onBackground,
                      ),
                    ),
                    const SizedBox(height: 14),
                    Text(
                      product.urlProduct,
                      style: theme.textTheme.bodyMedium!.copyWith(
                        color: colorScheme.onBackground,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.0),
                      child: Divider(),
                    ),
                    Text(
                      'Descrição',
                      style: theme.textTheme.titleLarge!.copyWith(
                        color: colorScheme.onBackground,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 14),
                    Text(
                      product.description,
                      style: theme.textTheme.bodyMedium!.copyWith(
                        color: colorScheme.onBackground,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

import 'package:flornanda/model/product.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import 'package:flornanda/screen/product_details.dart';
import 'package:flornanda/widgets/product_item_trait.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product});

  final Products product;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: ((context) => ProductDetailsScreen(
                    product: product,
                  )),
            ),
          );
        },
        child: Stack(
          children: [
            Hero(
              tag: product.id!,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(product.urlImage),
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: colorScheme.surfaceTint.withAlpha(150),
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                child: Column(
                  children: [
                    Text(
                      product.name,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis, // Very long text ...
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ProductItemTrait(
                          icon: Icons.monetization_on_sharp,
                          // ignore: unnecessary_string_interpolations
                          label: 'R\$ ${product.price.toStringAsFixed(2)}',
                        ),
                        //const SizedBox(width: 10),
                        ProductItemTrait(
                          icon: Icons.production_quantity_limits,
                          // ignore: unnecessary_string_interpolations
                          label: '${product.quantity.toString()} un.',
                        ),
                        //const SizedBox(width: 10),
                        ProductItemTrait(
                          icon: Icons.discount,
                          // ignore: unnecessary_string_interpolations
                          label: product.discount > 0
                              ? '${product.discount.toStringAsFixed(2)} %'
                              : '-',
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

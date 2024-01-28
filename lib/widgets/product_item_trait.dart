import 'package:flutter/material.dart';

class ProductItemTrait extends StatelessWidget {
  const ProductItemTrait({
    super.key,
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;

    return Row(
      children: [
        Icon(
          icon,
          size: 17,
          color: colorScheme.onPrimary,
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: TextStyle(
            color: colorScheme.onPrimary,
          ),
        ),
      ],
    );
  }
}

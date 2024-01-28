import 'dart:io';

import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Product {
  final String id;
  final String name;
  final double price;
  final double discount;
  final int quantity;
  final String description;
  final String urlProduct;
  final File image;

  Product({
    String? id,
    required this.name,
    required this.price,
    required this.discount,
    required this.quantity,
    required this.description,
    required this.image,
    required this.urlProduct,
  }) : id = id ?? uuid.v4();
}

import 'dart:io';

import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;

import 'package:flornanda/model/product.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  final List<Product> _products = [];

  List<Product> get productList => [..._products];
  List<Product> get onSalesProductList =>
      [..._products.where((element) => element.discount > 0)];

  void addProduct(
    String name,
    double price,
    double discount,
    int quantity,
    String description,
    String urlProduct,
    File image,
  ) async {
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final filename = path.basename(image.path);
    final copiedImage = await image.copy('${appDir.path}/$filename');

    final Product newProduct = Product(
        name: name,
        price: price,
        discount: discount,
        quantity: quantity,
        description: description,
        image: copiedImage,
        urlProduct: urlProduct);

    _products.add(newProduct);
    notifyListeners();
  }
}

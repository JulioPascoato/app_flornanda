import 'package:flornanda/model/product.dart';
import 'package:flornanda/services/products_service.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  final ProductsService _productsService = ProductsService();

  List<Products> _products = [];

  List<Products> get onSalesProductList =>
      [..._products.where((element) => element.discount > 0)];

  Future<List<Products>> list() async {
    if (_products.isEmpty) {
      _products = await _productsService.list();
    }
    return _products;
  }

  Future<void> create(Products product) {
    Future<String> future = _productsService.insert(product);
    return future.then((id) {
      product.id = id;
      _products.add(product);
      notifyListeners();
    });
  }

  Future<Products> read(String id) {
    return _productsService.show(id);
  }

  Future<void> update(String id, Products product) {
    Future<Products> future = _productsService.update(id, product);
    return future.then((newProduct) {
      Iterable<Products> filteredProduct =
          _products.where((prod) => prod.id == id);
      Products oldProduct = filteredProduct.first;
      oldProduct = newProduct;

      notifyListeners();
    });
  }

  Future<bool> delete(String id) async {
    Future<bool> future = _productsService.delete(id);
    return future.then((isDeleted) {
      if (isDeleted) {
        Iterable<Products> filteredProduct =
            _products.where((element) => element.id == id);
        Products product = filteredProduct.first;
        _products.remove(product);
        notifyListeners();
      }
      return Future.value(isDeleted);
    });
  }
}

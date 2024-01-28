import 'package:flutter/material.dart';

import 'package:flornanda/model/product.dart';

class FavoritesProvider extends ChangeNotifier {
  List<Product> _favoristlist = [];

  List<Product> get favoristlist => [..._favoristlist];

  bool toggleProductFavoriteStatus(Product product) {
    final productIsFavorite = _favoristlist.contains(product);

    if (productIsFavorite) {
      _favoristlist = _favoristlist.where((m) => m.id != product.id).toList();
      notifyListeners();
      return false;
    } else {
      _favoristlist.add(product);
      notifyListeners();
      return true;
    }
  }
}

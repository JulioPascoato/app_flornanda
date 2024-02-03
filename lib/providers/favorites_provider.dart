import 'package:firebase_auth/firebase_auth.dart';
import 'package:flornanda/model/favorites.dart';
import 'package:flornanda/model/product.dart';
import 'package:flornanda/services/favorites_service.dart';
import 'package:flutter/material.dart';

class FavoritesProvider extends ChangeNotifier {
  final FavoritesService _favoriteService = FavoritesService();

  List<Products> _favoristlist = [];

  List<Products> get favoristlist => [..._favoristlist];

  bool toggleProductFavoriteStatus(Products product) {
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

  Future<void> create(Products product) {
    Favorites favorito = Favorites(
        productId: product.id!, userId: FirebaseAuth.instance.currentUser!.uid);

    Future<String> future = _favoriteService.insert(favorito);
    return future.then((id) {
      favorito.id = id;
      notifyListeners();
    });
  }
}

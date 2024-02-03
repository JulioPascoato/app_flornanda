import 'dart:convert';

import 'package:flornanda/model/favorites.dart';
import 'package:flornanda/repositories/favorites_repository.dart';

import 'package:http/http.dart';

class FavoritesService {
  final FavoritesRepository _favoritesRepository = FavoritesRepository();

  Future<List<Favorites>> list() async {
    List<Favorites> favorites = [];
    try {
      Response response = await _favoritesRepository.list();
      String body = response.body;

      if (body == 'null') {
        return favorites;
      }

      Map<String, dynamic> json = jsonDecode(body);

      return Favorites.listFromJson(json);
    } catch (error) {
      throw Exception('Problemas ao consultar os dados 1.');
    }
  }

  Future<String> insert(Favorites favorites) async {
    try {
      String json = jsonEncode(favorites.toJson());
      Response response = await _favoritesRepository.insert(json);
      String body = response.body;
      String name = jsonDecode(body)['productId'];
      return name;
    } catch (error) {
      throw Exception('Problemas ao inserir os dados.');
    }
  }

  Future<Favorites> show(String id) async {
    try {
      Response response = await _favoritesRepository.show(id);
      String body = response.body;

      Map<String, dynamic> json = jsonDecode(body);

      return Favorites.fromJson(json);
    } catch (error) {
      throw Exception('Problemas ao consultar os dados.');
    }
  }

  Future<Favorites> update(String id, Favorites favorite) async {
    try {
      String favoriteJson = jsonEncode(favorite.toJson());
      Response response = await _favoritesRepository.update(id, favoriteJson);
      String body = response.body;

      Map<String, dynamic> json = jsonDecode(body);

      return Favorites.fromJson(json);
    } catch (error) {
      throw Exception('Problemas ao atualizar os dados.');
    }
  }

  Future<bool> delete(String id) async {
    try {
      Response response = await _favoritesRepository.delete(id);
      return response.statusCode == 200;
    } catch (error) {
      throw Exception('Problemas ao excluir os dados.');
    }
  }
}

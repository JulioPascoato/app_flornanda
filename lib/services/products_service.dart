import 'dart:convert';

import 'package:flornanda/model/product.dart';
import 'package:flornanda/repositories/products_repository.dart';
import 'package:http/http.dart';

class ProductsService {
  final ProductsRepository _productsRepository = ProductsRepository();

  Future<List<Products>> list() async {
    List<Products> products = [];
    try {
      Response response = await _productsRepository.list();
      String body = response.body;

      if (body == 'null') {
        return products;
      }

      Map<String, dynamic> json = jsonDecode(body);

      return Products.listFromJson(json);
    } catch (error) {
      throw Exception('Problemas ao consultar os dados 1.');
    }
  }

  Future<String> insert(Products product) async {
    try {
      String json = jsonEncode(product.toJson());
      Response response = await _productsRepository.insert(json);
      String body = response.body;
      String name = jsonDecode(body)['name'];
      return name;
    } catch (error) {
      throw Exception('Problemas ao inserir os dados.');
    }
  }

  Future<Products> show(String id) async {
    try {
      Response response = await _productsRepository.show(id);
      String body = response.body;

      Map<String, dynamic> json = jsonDecode(body);

      return Products.fromJson(json);
    } catch (error) {
      throw Exception('Problemas ao consultar os dados.');
    }
  }

  Future<Products> update(String id, Products product) async {
    try {
      String productJson = jsonEncode(product.toJson());
      Response response = await _productsRepository.update(id, productJson);
      String body = response.body;

      Map<String, dynamic> json = jsonDecode(body);

      return Products.fromJson(json);
    } catch (error) {
      throw Exception('Problemas ao atualizar os dados.');
    }
  }

  Future<bool> delete(String id) async {
    try {
      Response response = await _productsRepository.delete(id);
      return response.statusCode == 200;
    } catch (error) {
      throw Exception('Problemas ao excluir os dados.');
    }
  }
}

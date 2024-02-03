import 'package:http/http.dart' as http;

abstract class Repository {
  final _baseUrl = 'https://flornanda-2c990-default-rtdb.firebaseio.com/';
  final String resource;

  Repository({required this.resource});

  Future<http.Response> list() {
    final uri = '$_baseUrl/$resource.json';

    return http.get(
      Uri.parse(uri),
    );
  }

  Future<http.Response> insert(String data) {
    final uri = '$_baseUrl/$resource.json';
    return http.post(
      Uri.parse(uri),
      body: data,
    );
  }

  Future<http.Response> show(String id) {
    final uri = '$_baseUrl/$resource/$id.json';
    return http.get(
      Uri.parse(uri),
    );
  }

  Future<http.Response> update(String id, String data) {
    final uri = '$_baseUrl/$resource/$id.json';
    return http.put(
      Uri.parse(uri),
      body: data,
    );
  }

  Future<http.Response> delete(String id) {
    final uri = '$_baseUrl/$resource/$id.json';
    return http.delete(
      Uri.parse(uri),
    );
  }
}

class Favorites {
  String? id;
  final String userId;
  final String productId;

  Favorites({
    String? id,
    required this.productId,
    required this.userId,
  });

  Favorites.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        productId = json['productId'],
        userId = json['userId'];

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "userId": userId,
      };

  static List<Favorites> listFromJson(Map<String, dynamic> json) {
    List<Favorites> favorites = [];

    json.forEach((key, value) {
      Map<String, dynamic> item = {'id': key, ...value};
      favorites.add(
        Favorites.fromJson(item),
      );
    });

    return favorites;
  }
}

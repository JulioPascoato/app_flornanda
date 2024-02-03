class Products {
  String? id;
  final String name;
  final double price;
  final double discount;
  final int quantity;
  final String description;
  final String urlProduct;
  final String urlImage;

  Products({
    String? id,
    required this.name,
    required this.price,
    required this.discount,
    required this.quantity,
    required this.description,
    required this.urlProduct,
    required this.urlImage,
  });

  Products.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        price = json['price'],
        discount = json['discount'],
        quantity = json['quantity'],
        description = json['description'],
        urlImage = json['urlImage'],
        urlProduct = json['urlProduct'];

  Map<String, dynamic> toJson() => {
        "name": name,
        "price": price,
        "discount": discount,
        "quantity": quantity,
        "description": description,
        "urlImage": urlImage,
        "urlProduct": urlProduct
      };

  static List<Products> listFromJson(Map<String, dynamic> json) {
    List<Products> products = [];

    json.forEach((key, value) {
      Map<String, dynamic> item = {'id': key, ...value};
      products.add(
        Products.fromJson(item),
      );
    });

    return products;
  }
}

class Product {
  int id;
  String title;
  String address;
  String imageUrl;
  double price;

  Product({
    required this.id,
    required this.title,
    required this.address,
    required this.imageUrl,
    required this.price,
  });

  Product.fromJson(Map<String, dynamic> json)
      : id = int.parse(json['id']),
        title = json['title'],
        address = json['address'],
        imageUrl = json['imageUrl'],
        price = double.parse(json['price']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['title'] = title;
    data['address'] = address;
    data['imageUrl'] = imageUrl;
    data['price'] = price;
    return data;
  }
}

class Product {
  final String id;
  final String name;
  final String? image;
  final double price;

  // Constructor thường
  const Product({
    required this.id,
    this.name = "",
    this.image,
    this.price = 0,
  });

  // copyWith
  Product copyWith({
    String? id,
    String? name,
    String? image,
    double? price,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      price: price ?? this.price,
    );
  }

  // factory JSON
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      price: (json['price'] as num).toDouble(),
    );
  }

  // toJson
  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'image': image,
    'price': price,
  };

  @override
  String toString() =>
      "ID: $id | Name: $name | Image: $image | Price: $price";

  // Static List
  static List<Product> products = [
    const Product(id: "01", name: "Iphone", image: "Hinhanh1.png", price: 10.2),
    const Product(id: "02", name: "Samsung", image: "Hinhanh2.png", price: 20.1),
    const Product(id: "03", name: "Xiaomi", image: "Hinhanh3.png", price: 15.8),
    const Product(id: "04", name: "OPPO", image: "Hinhanh4.png", price: 11.4),
    const Product(id: "05", name: "Realme", image: "Hinhanh5.png", price: 19.5),
  ];
}
class Product {
  final String id;
  final String? name;
  final double? price;
  final String? image;

  // 1. Phương thức khởi tạo mặc định
  Product({
    required this.id,
    this.name,
    this.price,
    this.image,
  });

  // 2. Phương thức Factory để map một JSON về Product
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as String,
      name: json['name'] as String?,
      // Xử lý an toàn: ép kiểu JSON number về double
      price: json['price'] != null ? (json['price'] as num).toDouble() : null,
      image: json['image'] as String?,
    );
  }

  // Hàm hỗ trợ copy đối tượng để phục vụ cho update và map
  Product copyWith({
    String? id,
    String? name,
    double? price,
    String? image,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      image: image ?? this.image,
    );
  }

  @override
  String toString() {
    String displayPrice = price?.toStringAsFixed(2) ?? "0.00";
    return 'Product{id: $id, name: $name, price: \$$displayPrice, image: $image}';
  }
}
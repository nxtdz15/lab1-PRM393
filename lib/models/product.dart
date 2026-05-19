class Product {
  final String id;
  final String? name;
  final double? price;
  final String? image;

  Product({
    required this.id,
    this.name,
    this.price,
    this.image,
  });

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

  // Dữ liệu list tĩnh
  static List<Product> products = [
    Product(
      id: '1',
      name: 'Product 1',
      price: 100,
      image: 'assets/images/sony.jpg',
    ),
    Product(
      id: '2',
      name: 'Product 2',
      price: 200,
      image: 'assets/images/apple.jpg',
    ),
    Product(
      id: '3',
      name: 'Product 3',
      price: 300,
      image: 'assets/images/samsung.jpg',
    ),
  ];

  // ================= CRUD METHODS =================

  // 1. CREATE - Thêm sản phẩm mới
  static void addProduct(Product product) {
    products.add(product);
  }

  // 2. READ - Lấy danh sách sản phẩm
  static List<Product> getAllProducts() {
    return products;
  }

  static Product? getProductById(String id) {
    for (int i = 0; i < products.length; i++) {
      if (products[i].id == id) {
        return products[i];
      }
    }
    return null;
  }

  // 3. UPDATE - Cập nhật sản phẩm
  static void updateProduct(String id, Product updatedProduct) {
    for (int i = 0; i < products.length; i++) {
      if (products[i].id == id) {
        products[i] = updatedProduct;
        break;
      }
    }
  }

  // 4. DELETE - Xóa sản phẩm
  static void deleteProduct(String id) {
    for (int i = 0; i < products.length; i++) {
      if (products[i].id == id) {
        products.removeAt(i);
        break;
      }
    }
  }

  // ================= CÁC HÀM BỔ SUNG THEO YÊU CẦU ĐỀ =================

  // 5. SEARCH - Tìm kiếm sản phẩm theo tên (không phân biệt hoa thường)
  static List<Product> searchByName(String keyword) {
    List<Product> result = [];
    for (int i = 0; i < products.length; i++) {
      // Kiểm tra name không null trước khi tìm kiếm
      if (products[i].name != null && products[i].name!.toLowerCase().contains(keyword.toLowerCase())) {
        result.add(products[i]);
      }
    }
    return result;
  }

  // 6. SORT - Sắp xếp danh sách theo giá
  static void sortByPrice(bool ascending) {
    products.sort((a, b) {
      // Nếu giá null thì coi như bằng 0 để dễ so sánh
      double priceA = a.price ?? 0.0;
      double priceB = b.price ?? 0.0;

      if (ascending) {
        return priceA.compareTo(priceB); // Tăng dần
      } else {
        return priceB.compareTo(priceA); // Giảm dần
      }
    });
  }

  @override
  String toString() {
    return 'Product{id: $id, name: $name, price: $price, image: $image}';
  }
}
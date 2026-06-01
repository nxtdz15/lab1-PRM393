
import '../models/product.dart';

class ProductDAO {
  // 1. Danh sách tĩnh gán sẵn một số giá trị mặc định
  static List<Product> products = [
    Product(id: '1', name: 'Product 1', price: 100, image: 'img1.jpg'),
    Product(id: '2', name: 'Product 2', price: 200, image: 'img2.jpg'),
    Product(id: '3', name: 'Product 3', price: 300, image: 'img3.jpg'),
  ];

  // 2. Thêm sản phẩm (Add)
  static void addProduct(Product product) {
    products.add(product);
  }

  // 3. Sửa sản phẩm (Edit)
  static void editProduct(Product updatedProduct) {
    int index = products.indexWhere((p) => p.id == updatedProduct.id);
    if (index != -1) {
      products[index] = updatedProduct;
    }
  }

  // 4. Tìm kiếm duy nhất theo ID (Find)
  static Product? findById(String id) {
    try {
      return products.firstWhere((p) => p.id == id);
    } catch (e) {
      return null;
    }
  }

  // 5. Tăng giá 10% (increasePrice) dùng declarative map
  static void increasePrice() {
    products = products.map((p) {
      double currentPrice = p.price ?? 0.0;
      // Nhân 1.1 tương đương với việc tăng 10%
      return p.copyWith(price: currentPrice * 1.1);
    }).toList();
  }

  // 6. Các hàm Search khác nhau
  // Search theo tên chứa từ khóa
  static List<Product> searchByName(String keyword) {
    return products.where((p) =>
    p.name != null && p.name!.toLowerCase().contains(keyword.toLowerCase())
    ).toList();
  }

  // Search theo khoảng giá
  static List<Product> searchByPriceRange(double minPrice, double maxPrice) {
    return products.where((p) {
      double price = p.price ?? 0.0;
      return price >= minPrice && price <= maxPrice;
    }).toList();
  }
}
import '../Entity/Product.dart';

class ProductDAO {
  List<Product> products = Product.products;

  // Hiển thị product
  void showAllProduct() {
    products.forEach(print);
  }

  // ADD
  void add(Product p) {
    if (isIdExist(p.id)) {
      print("ID đã tồn tại!");
      return;
    }
    products.add(p);
    print("Thêm thành công!");
  }

  // FIND (THIẾU TRONG BÀI BẠN)
  Product? find(String id) {
    try {
      return products.firstWhere((p) => p.id == id);
    } catch (_) {
      return null;
    }
  }

  // UPDATE
  void update(String id,
      {String? newName, String? newImage, double? newPrice}) {
    int index = products.indexWhere((p) => p.id == id);

    if (index == -1) {
      print("Không tìm thấy product!");
      return;
    }

    products[index] = products[index].copyWith(
      name: newName,
      image: newImage,
      price: newPrice,
    );

    print("Update thành công!");
  }

  // DELETE
  void delete(String id) {
    products.removeWhere((p) => p.id == id);
    print("Xóa thành công!");
  }

  // SEARCH
  void search(String keyword) {
    var result = products
        .where((p) =>
        p.name.toLowerCase().contains(keyword.toLowerCase()))
        .toList();

    if (result.isEmpty) {
      print("Không tìm thấy!");
      return;
    }

    result.forEach(print);
  }

  // SORT ASC
  void sortAsc() =>
      products.sort((a, b) => a.price.compareTo(b.price));

  // SORT DESC
  void sortDesc() =>
      products.sort((a, b) => b.price.compareTo(a.price));

  // CHECK ID
  bool isIdExist(String id) =>
      products.any((p) => p.id == id);

  // increasePrice 10%
  void increasePrice() {
    products = products
        .map((p) => p.copyWith(price: p.price * 1.1))
        .toList();

    print("Đã tăng giá 10% cho tất cả sản phẩm!");
  }
}
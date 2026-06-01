
import 'models/product.dart';
import 'dao/product_dao.dart';

void main() {
  print('--- DANH SÁCH BAN ĐẦU ---');
  printList(ProductDAO.products);

  print('\n--- 1. TEST FACTORY (Map JSON về Product) ---');
  Map<String, dynamic> jsonData = {
    "id": "4",
    "name": "Tai nghe Bluetooth",
    "price": 150,
    "image": "headphone.jpg"
  };
  Product newProduct = Product.fromJson(jsonData);
  ProductDAO.addProduct(newProduct);
  print('Đã thêm từ JSON: $newProduct');
  printList(ProductDAO.products);

  print('\n--- 2. TEST TĂNG GIÁ 10% ---');
  ProductDAO.increasePrice();
  printList(ProductDAO.products);

  print('\n--- 3. TEST EDIT SẢN PHẨM ---');
  Product? pToEdit = ProductDAO.findById('1');
  if (pToEdit != null) {
    Product editedP = pToEdit.copyWith(name: 'Product 1 (Đã Edit VIP)');
    ProductDAO.editProduct(editedP);
  }
  printList(ProductDAO.products);

  print('\n--- 4. TEST CÁC HÀM SEARCH KHÁC NHAU ---');
  print('* Tìm theo tên (chứa từ "Tai"):');
  printList(ProductDAO.searchByName('Tai'));

  print('* Tìm theo giá (từ 200 đến 350):');
  printList(ProductDAO.searchByPriceRange(200, 350));
}

// Hàm hỗ trợ in danh sách
void printList(List<Product> list) {
  if (list.isEmpty) {
    print('(Danh sách trống)');
    return;
  }
  for (var p in list) {
    print(p.toString());
  }
}
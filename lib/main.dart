// import 'package:flutter/material.dart'; // Tạm thời comment lại để chạy test Dart thuần
import 'models/product.dart';

void main() {
  print('--- DANH SÁCH BAN ĐẦU ---');
  printList(Product.getAllProducts());

  print('\n--- 1. CREATE (THÊM SẢN PHẨM MỚI) ---');
  Product newProduct = Product(
    id: '4',
    name: 'Product 4',
    price: 400,
    image: 'assets/images/senheiser.jpg',
  );
  Product.addProduct(newProduct);
  printList(Product.getAllProducts());

  print('\n--- 2. READ (TÌM SẢN PHẨM THEO ID) ---');
  Product? foundProduct = Product.getProductById('3');
  if (foundProduct != null) {
    print('Đã tìm thấy: $foundProduct');
  } else {
    print('Không tìm thấy sản phẩm!');
  }

  print('\n--- 3. UPDATE (SỬA SẢN PHẨM ID) ---');
  // Lấy sản phẩm 1 ra trước
  Product? productToUpdate = Product.getProductById('1');
  if (productToUpdate != null) {
    // Dùng copyWith để tạo bản sao có tên và giá mới
    Product updatedProduct = productToUpdate.copyWith(
      name: 'Product 1 (Changed)',
      price: 999,
    );
    Product.updateProduct('1', updatedProduct);
  }
  printList(Product.getAllProducts());

  print('\n--- 4. DELETE (XÓA SẢN PHẨM ID) ---');
  Product.deleteProduct('3');
  printList(Product.getAllProducts());
}

// Hàm hỗ trợ in danh sách
void printList(List<Product> list) {
  for (var p in list) {
    print(p.toString());
  }
}

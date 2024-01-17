import 'dart:io';

void main() {
  addProducts();
  printProducts();
  addProducts();
  printProducts();
}

class Products {
  Products(this.name, this.number, this.price, this.id);
  final int id;
  final String name;
  final int number;
  final int price;
  static List<Products> productsList = [];
}

addProducts() {
  int id;
  for (var product in Products.productsList) {
    product.id + 1;
  }
  print('Enter product name: ');
  var name = stdin.readLineSync();
  print('Enter number: ');
  var number = int.parse(stdin.readLineSync()!);
  print('Enter price: ');
  var price = int.parse(stdin.readLineSync()!);
  id = Products.productsList.length;
  var product = Products(name!, number, price, id);
  Products.productsList.add(product);
}

printProducts() {
  for (var product in Products.productsList) {
    int id = product.id;
    print("ID : ${id++}");
    print('Name: ${product.name}');
    print('Number: ${product.number}');
    print('Price: ${product.price}');
  }
}

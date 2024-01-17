import 'dart:io';

void main() {
  ShopActions.backToShopMenu();
}

class Shop {
  static List<Shop> productsList = [];

  Shop(this.productName, this.numberOfProducts, this.price, this.id);
  int id;
  String productName;
  int numberOfProducts;
  int price;
}

class ShopActions {
  static void backToShopMenu() {
    printMenu();
    int userInput = inputUser();
    while (
        userInput != 1 && userInput != 6 && userInput != 2 && userInput != 3) {
      print("Try to input Valid number");
      printMenu();
      userInput = inputUser();
    }
    if (userInput == 1) {
      ProductActions.productRegistration();
    }
    if (userInput == 2) {
      ProductActions.showProducts();
      ShopActions.backToShopMenu();
    }
    if (userInput == 3) {
      ProductActions.deleteProducts();
      ShopActions.backToShopMenu();
    }
    if (userInput == 6) {
      print("GoodBye!");
      exit(0);
    }
  }
}

class ProductActions {
  static productRegistration() {
    int id = Shop.productsList.length;
    print("Product registration :");
    print("(Enter product name)(0-back to menu)");
    String? name = stdin.readLineSync();
    //check if name == 0
    if (name == "0") {
      ShopActions.backToShopMenu();
    }
    //check if name == null or empty
    if (name == null || name.isEmpty) {
      print("(Error)Enter Valid Name :");
      return ProductActions.productRegistration();
    }
    //check if name is a number
    if (int.tryParse(name) != null) {
      print("(Error)Enter Valid Name :");
      return ProductActions.productRegistration();
    }
    print("(Enter the number of products)(0-back to menu)");
    String? number = stdin.readLineSync();
    //check if number == 0
    if (number == "0") {
      ShopActions.backToShopMenu();
    }
    //check if number == null or empty
    if (number == null || number.isEmpty) {
      print("(Error)Enter Valid Number :");
      return ProductActions.productRegistration();
    }
    //check if number contains a letter
    if (int.tryParse(number) == null) {
      print("(Error)Enter Valid Number :");
      return ProductActions.productRegistration();
    }
    print("(Enter the price)(0-back to menu)");
    String? price = stdin.readLineSync();
    //check if price == 0
    if (price == "0") {
      ShopActions.backToShopMenu();
    }
    //check if price == null or empty
    if (price == null || price.isEmpty) {
      print("(Error)Enter Valid Price :");
      return ProductActions.productRegistration();
    }
    //check if number contains a letter
    if (int.tryParse(price) == null) {
      print("(Error)Enter Valid Price :");
      return ProductActions.productRegistration();
    }
    Shop.productsList.add(Shop(name, int.parse(number), int.parse(price), id));
    print("Product registration is complete");
    ShopActions.backToShopMenu();
  }

  static showProducts() {
    print("All Of Product List :");
    for (var Shop in Shop.productsList) {
      print(
          "ID:${Shop.id} Name : ${Shop.productName}, Price : ${Shop.price}T, Count : ${Shop.numberOfProducts}\n");
      Shop.id + 1;
    }
  }

  static deleteProducts() {
    print("Delete Products :");
    for (var Shop in Shop.productsList) {
      print(
          "ID:${Shop.id} Name : ${Shop.productName}, Price : ${Shop.price}T, Count : ${Shop.numberOfProducts}\n ");
    }
    print("Enter ${Shop.productsList.length} To Cancel");
    print("Enter product ID to delete :");
    int id = int.parse(stdin.readLineSync()!);
    //check if user wants to back to menu
    if (id == Shop.productsList.length) {
      print("Cancelled");
      ShopActions.backToShopMenu();
    }
    //check if user Enter Wrong Id
    if (id < 0 || id > Shop.productsList.length) {
      print("( Error )Please Enter Valid ID");
      ShopActions.backToShopMenu();
    }
    Shop.productsList.removeAt(id);

    print("Delete is complete");
  }
}

int inputUser() {
  int x;
  String? userInput = stdin.readLineSync();
  if (userInput == null || userInput.isEmpty) {
    printMenu();
    print("(Error)Please Enter Valid Number :");
    return inputUser();
  }
  if (int.tryParse(userInput) == null) {
    printMenu();
    print("(Error)Please Enter Valid Number :");
    return inputUser();
  }
  x = int.parse(userInput);
  return x;
}

void printMenu() => print("""
Shop Menu(Write A Number)
1-Product registration
2-List of products
3-Delete products
4-Edit products
5-Display finished products
6-Exit
""");

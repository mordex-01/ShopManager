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
    while (userInput != 1 &&
        userInput != 6 &&
        userInput != 2 &&
        userInput != 3 &&
        userInput != 4 &&
        userInput != 5) {
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
    if (userInput == 4) {
      ProductActions.editProducts();
      ShopActions.backToShopMenu();
    }
    if (userInput == 5) {
      ProductActions.finishidProducts();
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
    String? userInput = stdin.readLineSync();
    if (int.tryParse(userInput!) == null) {
      print("Cancelled");
      ShopActions.backToShopMenu();
    }
    int id = int.parse(userInput);
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

  static editProducts() {
    print("Edit Products :");

    for (var Shop in Shop.productsList) {
      print(
          "ID:${Shop.id} Name : ${Shop.productName}, Price : ${Shop.price}T, Count : ${Shop.numberOfProducts}\n ");
    }
    print("Enter ${Shop.productsList.length} To Cancel");
    print("Enter product ID to Edit :");
    String? userInput = stdin.readLineSync();
    if (int.tryParse(userInput!) == null) {
      print("Cancelled");
      ShopActions.backToShopMenu();
    }
    int id = int.parse(userInput);

    //check if user wants to back to menu
    while (id == Shop.productsList.length) {
      print("Cancelled");
      ShopActions.backToShopMenu();
    }
    //check if user Enter Wrong Id
    while (id < 0 || id > Shop.productsList.length) {
      print("( Error )Please Enter Valid ID");
      ShopActions.backToShopMenu();
    }
    print("(Enter New product name)(0-back to menu)");
    String? name = stdin.readLineSync();
    if (name == "0") {
      print("Cancelled");
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
    if (number == "0") {
      print("Cancelled");
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
    print("(Enter the Price)(0-back to menu)");
    String? price = stdin.readLineSync();
    if (price == "0") {
      print("Cancelled");
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
    Shop.productsList[id] = Shop(name, int.parse(number), int.parse(price), id);
  }

  static finishidProducts() {
    print("Products Less Than 5 count :");
    for (var Shop in Shop.productsList) {
      if (Shop.numberOfProducts < 5) {
        print(
            "ID:${Shop.id} Name : ${Shop.productName}, Price : ${Shop.price}T, Count : ${Shop.numberOfProducts}\n ");
      }
    }
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

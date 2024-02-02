import 'dart:io';

void main() {
  ShopActions shopActions = ShopActions();
  shopActions.backToShopMenu();
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
  ProductActions productActions = ProductActions();

  void backToShopMenu() {
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
      productActions.productRegistration();
    }
    if (userInput == 2) {
      productActions.showProducts();
      backToShopMenu();
    }
    if (userInput == 3) {
      productActions.deleteProducts();
      backToShopMenu();
    }
    if (userInput == 4) {
      productActions.editProducts();
      backToShopMenu();
    }
    if (userInput == 5) {
      productActions.finishidProducts();
      backToShopMenu();
    }
    if (userInput == 6) {
      print("GoodBye!");
      exit(0);
    }
  }

  static int inputUser() {
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

  static printMenu() => print("""
Shop Menu(Write A Number)
1-Product registration
2-List of products
3-Delete products
4-Edit products
5-Display finished products
6-Exit
""");
}

class ProductActions {
  ShopActions shopActions = ShopActions();
  productRegistration() {
    print("Product registration :");
    print("(Enter product name)(0-back to menu)");
    String? name = stdin.readLineSync();
    //check if name == 0
    if (name == "0") {
      shopActions.backToShopMenu();
    }
    //check if name == null or empty
    if (name == null || name.isEmpty) {
      print("(Error)Enter Valid Name :");
      return productRegistration();
    }
    //check if name is a number
    if (int.tryParse(name) != null) {
      print("(Error)Enter Valid Name :");
      return productRegistration();
    }
    print("(Enter the number of products)(0-back to menu)");
    String? number = stdin.readLineSync();
    //check if number == 0
    if (number == "0") {
      shopActions.backToShopMenu();
    }
    //check if number == null or empty
    if (number == null || number.isEmpty) {
      print("(Error)Enter Valid Number :");
      return productRegistration();
    }
    //check if number contains a letter
    if (int.tryParse(number) == null) {
      print("(Error)Enter Valid Number :");
      return productRegistration();
    }
    print("(Enter the price)(0-back to menu)");
    String? price = stdin.readLineSync();
    //check if price == 0
    if (price == "0") {
      shopActions.backToShopMenu();
    }
    //check if price == null or empty
    if (price == null || price.isEmpty) {
      print("(Error)Enter Valid Price :");
      return productRegistration();
    }
    //check if number contains a letter
    if (int.tryParse(price) == null) {
      print("(Error)Enter Valid Price :");
      return productRegistration();
    }
    int id = Shop.productsList.length;
    Shop.productsList.add(Shop(name, int.parse(number), int.parse(price), id));
    print("Product registration is complete");
    shopActions.backToShopMenu();
  }

  showProducts() {
    print("All Of Product List :");
    for (var Shop in Shop.productsList) {
      print(
          "ID:${Shop.id} Name : ${Shop.productName}, Price : ${Shop.price}T, Count : ${Shop.numberOfProducts}\n");
    }
  }

  deleteProducts() {
    List<int> ids = [];
    print("Delete Products :");
    for (var shop in Shop.productsList) {
      ids.add(shop.id);
      print(
          "ID:${shop.id} Name : ${shop.productName}, Price : ${shop.price}T, Count : ${shop.numberOfProducts}\n ");
    }
    print("Enter ${ids.length + 1} To Cancel");
    print("Enter product ID to delete :");
    String? userInput = stdin.readLineSync();
    if (int.tryParse(userInput!) == null) {
      print("Cancelled");
      shopActions.backToShopMenu();
    }
    int id = int.parse(userInput);
    //check if user wants to back to menu
    if (id == ids.length + 1) {
      print("Cancelled");
      shopActions.backToShopMenu();
    }
    //check if user Enter Wrong Id
    if (id < 0 || id > ids.length + 1) {
      print("( Error )Please Enter Valid ID");
      shopActions.backToShopMenu();
    }
    if (ids.contains(id)) {
      Shop.productsList.removeAt(id);
      ids.removeAt(id);
    } else {
      print("( Error )Please Enter Valid ID");
      shopActions.backToShopMenu();
    }
    print("Delete is complete");
  }

  editProducts() {
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
      shopActions.backToShopMenu();
    }
    int id = int.parse(userInput);

    //check if user wants to back to menu
    while (id == Shop.productsList.length) {
      print("Cancelled");
      shopActions.backToShopMenu();
    }
    //check if user Enter Wrong Id
    while (id < 0 || id > Shop.productsList.length) {
      print("( Error )Please Enter Valid ID");
      shopActions.backToShopMenu();
    }
    print("(Enter New product name)(0-back to menu)");
    String? name = stdin.readLineSync();
    if (name == "0") {
      print("Cancelled");
      shopActions.backToShopMenu();
    }
    //check if name == null or empty
    if (name == null || name.isEmpty) {
      print("(Error)Enter Valid Name :");
      return editProducts();
    }
    //check if name is a number
    if (int.tryParse(name) != null) {
      print("(Error)Enter Valid Name :");
      return editProducts();
    }
    print("(Enter the number of products)(0-back to menu)");
    String? number = stdin.readLineSync();
    if (number == "0") {
      print("Cancelled");
      shopActions.backToShopMenu();
    }
    //check if number == null or empty
    if (number == null || number.isEmpty) {
      print("(Error)Enter Valid Number :");
      return editProducts();
    }
    //check if number contains a letter
    if (int.tryParse(number) == null) {
      print("(Error)Enter Valid Number :");
      return editProducts();
    }
    print("(Enter the Price)(0-back to menu)");
    String? price = stdin.readLineSync();
    if (price == "0") {
      print("Cancelled");
      shopActions.backToShopMenu();
    }
    //check if price == null or empty
    if (price == null || price.isEmpty) {
      print("(Error)Enter Valid Price :");
      return editProducts();
    }
    //check if number contains a letter
    if (int.tryParse(price) == null) {
      print("(Error)Enter Valid Price :");
      return editProducts();
    }
    Shop.productsList[id] = Shop(name, int.parse(number), int.parse(price), id);
  }

  finishidProducts() {
    print("Products Less Than 5 count :");
    for (var Shop in Shop.productsList) {
      if (Shop.numberOfProducts < 5) {
        print(
            "ID:${Shop.id} Name : ${Shop.productName}, Price : ${Shop.price}T, Count : ${Shop.numberOfProducts}\n ");
      }
    }
  }
}

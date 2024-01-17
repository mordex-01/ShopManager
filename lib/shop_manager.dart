import 'dart:io';

void main() {
  ShopActions.backToShopMenu();
}

class Shop {
  static List<Shop> products = [];

  Shop(
    this.productName,
    this.numberOfProducts,
    this.price,
  );
  String productName;
  int numberOfProducts;
  int price;
  @override
  String toString() {
    return "$productName, $numberOfProducts, $price";
  }
}

class ShopActions {
  static void backToShopMenu() {
    printMenu();
    int userInput = inputUser();
    while (userInput != 1 && userInput != 6) {
      printMenu();
      userInput = inputUser();
    }
    if (userInput == 1) {
      ProductActions.productRegistration();
    }
    if (userInput == 2) {
      ProductActions.showProductList();
    }
    if (userInput == 6) {
      print("GoodBye!");
      exit(0);
    }
  }
}

class ProductActions extends Shop {
  ProductActions(String productName, int numberOfProducts, int price)
      : super(productName, numberOfProducts, price);
  static productRegistration() {
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
    Shop.products.add(Shop(name, int.parse(number), int.parse(price)));
    print("Product registration is complete");
    ShopActions.backToShopMenu();
  }

  static showProductList() {
    print("List of products :");
    print(Shop.products);
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

int priceInput(inputUserr) {
  if (inputUserr == null || inputUserr.isEmpty) {
    print("Enter Valid Number :");
    return inputUser();
  } else {
    return int.parse(inputUserr);
  }
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

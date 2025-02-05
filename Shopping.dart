// Abstract class
abstract class Item {
  String name;
  double price;
  int quantity;

  Item(this.name, this.price, this.quantity);

  void display();
}

// Interface defining discount
abstract class Discount {
  double applyDiscount(double amount);
}

// Base class with constructor and protected variable
class BaseItem {
  String category;

  BaseItem(this.category);

  void showCategory() {
    print('Category: $category');
  }
}

// Multiple Inheritance using mixins
mixin ExpiryDate {
  DateTime? expiryDate;

  void setExpiryDate(DateTime date) {
    expiryDate = date;
  }

  void showExpiryDate() {
    if (expiryDate != null) {
      print('Expiry Date: $expiryDate');
    } else {
      print('No expiry date set');
    }
  }
}

// Multilevel Inheritance
class Product extends BaseItem {
  static const String storeName = "SuperShop"; // Static constant variable
  static int totalProducts = 0;

  Product(String category) : super(category) {
    totalProducts++;
  }

  static void showStoreName() {
    print('Store: $storeName');
  }
}

// Concrete class extending Item and implementing Discount
class GroceryItem extends Product with ExpiryDate implements Item, Discount {
  final String _type; // Private variable

  @override
  String name;

  @override
  double price;

  @override
  int quantity;

  GroceryItem(this.name, this.price, this.quantity, String category, this._type)
      : super(category);

  @override
  void display() {
    print(
        'Grocery Item: $name | Type: $_type | Price: \$$price | Quantity: $quantity');
  }

  @override
  double applyDiscount(double amount) {
    return amount * 0.9; // 10% discount
  }
}

// Concrete class extending Item
class ElectronicItem extends Product implements Item {
  String brand;

  @override
  String name;

  @override
  double price;

  @override
  int quantity;

  ElectronicItem(
      this.name, this.price, this.quantity, this.brand, String category)
      : super(category);

  @override
  void display() {
    print(
        'Electronic Item: $name | Brand: $brand | Price: \$$price | Quantity: $quantity');
  }
}

// ShoppingList class demonstrating encapsulation
class ShoppingList {
  final List<Item> _items = [];

  // Getter to retrieve items
  List<Item> get items => _items;

  // Method to add item
  void addItem(Item item) {
    _items.add(item);
    print('${item.name} added to the shopping list.');
  }

  // Method to remove item
  void removeItem(String itemName) {
    _items.removeWhere((item) => item.name == itemName);
    print('$itemName removed from the shopping list.');
  }

  // Method to display all items
  void displayList() {
    print('\nShopping List:');
    for (var item in _items) {
      item.display();
    }
  }
}

// Main function demonstrating polymorphism and functionality
void main() {
  ShoppingList myList = ShoppingList();

  // Creating items
  Item milk = GroceryItem("Milk", 2.5, 2, "Dairy", "Liquid");
  Item bread = GroceryItem("Bread", 1.5, 1, "Bakery", "Solid");
  Item phone =
      ElectronicItem("Smartphone", 599.99, 1, "Samsung", "Electronics");

  // Adding items to the list
  myList.addItem(milk);
  myList.addItem(bread);
  myList.addItem(phone);

  // Displaying the list
  myList.displayList();

  // Removing an item
  myList.removeItem("Bread");
  myList.displayList();
}

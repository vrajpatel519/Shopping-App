import 'products.dart';

class ShoppingCart {
  List<Product> _items = [];

  List<Product> get items => _items;

  void addItem(Product product) {
    _items.add(product);
  }

  void removeItem(Product product) {
    _items.remove(product);
  }

  double calculateTotal() {
    double total = 0;
    for (var item in _items) {
      total += item.calculateTotalPrice();
    }
    return total;
  }

  void clear() {
    _items.clear();
  }

  void displayItems() {
    if (_items.isEmpty) {
      print("Your cart is empty.");
    } else {
      print("Items in your cart:");
      for (var item in _items) {
        print(item.getDescription());
      }
    }
  }
}

// Customer class
class Customer {
  String _name;
  String _address;
  ShoppingCart _cart = ShoppingCart(); // Customer has a shopping cart

  Customer(this._name, this._address);

  String get name => _name;
  String get address => _address;
  ShoppingCart get cart => _cart;

  void addToCart(Product product) {
    _cart.addItem(product);
  }

  void removeFromCart(Product product) {
    _cart.removeItem(product);
  }

  void viewCart() {
    _cart.displayItems();
  }

  double checkout() {
    double total = _cart.calculateTotal();
    print("Checkout complete. Total: \$${total.toStringAsFixed(2)}");
    _cart.clear(); // Clear the cart after checkout
    return total;
  }
}

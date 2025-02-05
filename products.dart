enum ProductCategory { electronics, clothing, books, groceries, homeGoods }

enum PaymentMethod { creditCard, debitCard, paypal, cashOnDelivery }

// Interface for Discountable products
abstract class Discountable {
  double applyDiscount(double price);
}

// Parent class
class Product {
  int _id;
  String _name;
  double _price;
  ProductCategory _category;
  String _description; // Added description

  static int totalProducts = 0;
  static const double taxRate = 0.05;

  Product(
      this._id, this._name, this._price, this._category, this._description) {
    totalProducts++;
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      map['id'],
      map['name'],
      map['price'],
      _parseCategory(map['category']),
      map['description'],
    );
  }

  static ProductCategory _parseCategory(String category) {
    return ProductCategory.values.firstWhere(
        (e) => e.toString().split('.').last == category,
        orElse: () => ProductCategory.electronics);
  }

  int get id => _id;
  String get name => _name;
  double get price => _price;
  ProductCategory get category => _category;
  String get description => _description; // Added getter for description

  double calculateTotalPrice() {
    return _price * (1 + taxRate);
  }

  String getDescription() {
    return 'Product: $_name (ID: $_id), Price: ${_price.toStringAsFixed(2)}, Category: $_category\nDescription: $_description'; // Include description
  }

  // Method to update product details (example)
  void updateProduct(
      String name, double price, ProductCategory category, String description) {
    _name = name;
    _price = price;
    _category = category;
    _description = description;
  }
}

import 'products.dart';

class Electronics extends Product implements Discountable {
  String _brand;
  int _warrantyMonths; // Added warranty information

  Electronics(int id, String name, double price, String description,
      String brand, int warrantyMonths)
      : _brand = brand,
        _warrantyMonths = warrantyMonths,
        super(id, name, price, ProductCategory.electronics, description);

  String get brand => _brand;
  int get warrantyMonths => _warrantyMonths;

  @override
  double applyDiscount(double price) {
    return price * 0.9; // 10% discount for electronics
  }

  @override
  String getDescription() {
    return '${super.getDescription()}, Brand: $_brand, Warranty: $_warrantyMonths months';
  }
}

class Clothing extends Product {
  String _size;
  String _material;

  Clothing(int id, String name, double price, String description, String size,
      String material)
      : _size = size,
        _material = material,
        super(id, name, price, ProductCategory.clothing, description);

  String get size => _size;
  String get material => _material;

  @override
  String getDescription() {
    return '${super.getDescription()}, Size: $_size, Material: $_material';
  }
}

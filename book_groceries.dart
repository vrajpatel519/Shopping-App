import 'products.dart';

class Book extends Product {
  String _author;
  String _publisher;

  Book(int id, String name, double price, String description, String author,
      String publisher)
      : _author = author,
        _publisher = publisher,
        super(id, name, price, ProductCategory.books, description);

  String get author => _author;
  String get publisher => _publisher;

  @override
  String getDescription() {
    return '${super.getDescription()}, Author: $_author, Publisher: $_publisher';
  }
}

// Child class 4: Groceries (inherits from Product)
class Groceries extends Product {
  DateTime _expiryDate;

  Groceries(int id, String name, double price, String description,
      DateTime expiryDate)
      : _expiryDate = expiryDate,
        super(id, name, price, ProductCategory.groceries, description);

  DateTime get expiryDate => _expiryDate;

  @override
  String getDescription() {
    return '${super.getDescription()}, Expiry Date: ${_expiryDate.toString()}';
  }
}

import 'book_groceries.dart';
import 'electronics_clothing.dart';
import 'products.dart';
import 'shopping_cart.dart';

void main() {
  // Create products
  Electronics laptop =
      Electronics(1, "Laptop", 120000.0, "High-performance laptop", "Dell", 24);
  Book book = Book(2, "The Dart Programming Language", 300.0,
      "A comprehensive guide to Dart", "Google", "Dart Press");
  Clothing shirt = Clothing(
      3, "T-Shirt", 2000.0, "Comfortable cotton t-shirt", "M", "Cotton");
  Groceries milk = Groceries(
      4, "Milk", 65, "Fresh milk", DateTime.now().add(Duration(days: 7)));

  // Create a customer
  Customer customer =
      Customer("Rahul", "opps. Palladium mall, Thaltej, Ahemdabad, Gujarat");

  // Add items to the customer's cart
  customer.addToCart(laptop);
  customer.addToCart(book);
  customer.addToCart(shirt);
  customer.addToCart(milk);

  // View the cart
  customer.viewCart();

  // Checkout
  customer.checkout();

  // Demonstrate updating a product
  laptop.updateProduct("Gaming Laptop", 1500, ProductCategory.electronics,
      "High-end gaming laptop with dedicated GPU");
  print("\nUpdated Laptop Details:");
  print(laptop.getDescription());

  // Demonstrate factory constructor
  Map<String, dynamic> bookMap = {
    'id': 5,
    'name': 'Rich Dad',
    'price': 255.0,
    'category': 'books',
    'description': 'Another new book'
  };
  Product newBook = Product.fromMap(bookMap);
  print("\nNew book from map:");
  print(newBook.getDescription());

  // Access static variable
  print("\nTotal Products: ${Product.totalProducts}");
}

// class Order {
//   void addItem(String item) {
//     print('$item added to order.');
//   }

//   void processPayment(double amount) {
//     print('Processing payment of \$$amount.');
//   }
// }

// Class responsible for order management
class Order {
  final List<String> _items = [];

  void addItem(String item) {
    _items.add(item);
    print('$item added to order.');
  }

  List<String> getItems() => _items;
}

// Class responsible for payment processing
class PaymentProcessor {
  void processPayment(double amount) {
    print('Processing payment of \$$amount.');
  }
}

// Main function demonstrating SRP
void main() {
  Order order = Order();
  order.addItem('Laptop');
  order.addItem('Phone');

  PaymentProcessor payment = PaymentProcessor();
  payment.processPayment(1000.0);
}

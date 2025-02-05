//❌ Bad Example (Violating OCP)
// class DiscountService {
//   double calculateDiscount(String type, double amount) {
//     if (type == "percentage") {
//       return amount * 0.1; // 10% discount
//     } else if (type == "fixed") {
//       return amount - 20; // Fixed $20 discount
//     }
//     return amount; // No discount
//   }
// }

// Abstract class for different discount strategies
abstract class DiscountStrategy {
  double applyDiscount(double amount);
}

// Percentage-based discount
class PercentageDiscount implements DiscountStrategy {
  @override
  double applyDiscount(double amount) {
    return amount * 0.9; // 10% discount
  }
}

// Fixed amount discount
class FixedDiscount implements DiscountStrategy {
  @override
  double applyDiscount(double amount) {
    return amount - 20; // $20 discount
  }
}

// No discount strategy (default)
class NoDiscount implements DiscountStrategy {
  @override
  double applyDiscount(double amount) {
    return amount;
  }
}

// Discount service that is OPEN for extension but CLOSED for modification
class DiscountService {
  final DiscountStrategy discountStrategy;

  DiscountService(this.discountStrategy);

  double getFinalPrice(double amount) {
    return discountStrategy.applyDiscount(amount);
  }
}

// Main function demonstrating OCP
void main() {
  DiscountService percentageDiscount = DiscountService(PercentageDiscount());
  print(
      "Final price with percentage discount: \$${percentageDiscount.getFinalPrice(200)}");

  DiscountService fixedDiscount = DiscountService(FixedDiscount());
  print(
      "Final price with fixed discount: \$${fixedDiscount.getFinalPrice(200)}");

  DiscountService noDiscount = DiscountService(NoDiscount());
  print("Final price with no discount: \$${noDiscount.getFinalPrice(200)}");
}

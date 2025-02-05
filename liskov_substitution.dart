// // Violating LSP
// class Penguin extends Bird {
//   @override
//   void fly() {
//     throw Exception("Penguins can't fly!");
//   }
// }

// void main() {
//   Bird penguin = Penguin();
//   letBirdFly(penguin); // ❌ Throws Exception! Violates LSP
// }

abstract class Bird {}

abstract class FlyingBird extends Bird {
  void fly();
}

class Sparrow extends FlyingBird {
  @override
  void fly() {
    print("Sparrow is flying!");
  }
}

class Penguin extends Bird {
  void swim() {
    print("Penguin is swimming!");
  }
}

void letBirdFly(FlyingBird bird) {
  bird.fly();
}

void main() {
  FlyingBird sparrow = Sparrow();
  letBirdFly(sparrow); // ✅ Works

  Bird penguin = Penguin();
  //  letBirdFly(penguin); // ❌ Won't work, preventing an LSP violation
}

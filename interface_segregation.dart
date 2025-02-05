// // Violating ISP: Too many unrelated responsibilities in one interface
// abstract class Worker {
//   void work();
//   void eat();
// }

// class HumanWorker implements Worker {
//   @override
//   void work() {
//     print("Human is working...");
//   }

//   @override
//   void eat() {
//     print("Human is eating...");
//   }
// }

// class RobotWorker implements Worker {
//   @override
//   void work() {
//     print("Robot is working...");
//   }

//   @override
//   void eat() {
//     // ❌ Robots don’t eat! This method is unnecessary.
//     throw Exception("Robots don't eat!");
//   }
// }

// void main() {
//   HumanWorker human = HumanWorker();
//   RobotWorker robot = RobotWorker();

//   human.work();
//   human.eat();

//   robot.work();
//   // robot.eat(); ❌ Will throw an exception
// }

// Correct approach: Separate interfaces
abstract class Workable {
  void work();
}

abstract class Eatable {
  void eat();
}

// Human implements both interfaces
class HumanWorker implements Workable, Eatable {
  @override
  void work() {
    print("Human is working...");
  }

  @override
  void eat() {
    print("Human is eating...");
  }
}

// Robot only implements Workable, not Eatable
class RobotWorker implements Workable {
  @override
  void work() {
    print("Robot is working...");
  }
}

void main() {
  HumanWorker human = HumanWorker();
  RobotWorker robot = RobotWorker();

  human.work();
  human.eat(); // ✅ Humans eat

  robot.work();
  // robot.eat(); ❌ Not possible anymore, preventing an ISP violation
}

// // Violates DIP: High-level module directly depends on low-level modules
// class BackendDeveloper {
//   void developBackend() {
//     print("Writing backend code...");
//   }
// }

// class FrontendDeveloper {
//   void developFrontend() {
//     print("Writing frontend code...");
//   }
// }

// class Project {
//   final BackendDeveloper backendDeveloper;
//   final FrontendDeveloper frontendDeveloper;

//   Project(this.backendDeveloper, this.frontendDeveloper);

//   void develop() {
//     backendDeveloper.developBackend();
//     frontendDeveloper.developFrontend();
//   }
// }

// void main() {
//   var backendDev = BackendDeveloper();
//   var frontendDev = FrontendDeveloper();
//   var project = Project(backendDev, frontendDev);

//   project.develop();
// }

// Following DIP: High-level module depends on an abstraction
abstract class Developer {
  void develop();
}

class BackendDeveloper implements Developer {
  @override
  void develop() {
    print("Writing backend code...");
  }
}

class FrontendDeveloper implements Developer {
  @override
  void develop() {
    print("Writing frontend code...");
  }
}

// High-level module depends on abstraction (Developer), not concrete classes
class Project {
  final List<Developer> developers;

  Project(this.developers);

  void develop() {
    for (var dev in developers) {
      dev.develop();
    }
  }
}

void main() {
  var backendDev = BackendDeveloper();
  var frontendDev = FrontendDeveloper();

  var project =
      Project([backendDev, frontendDev]); // Flexible list of developers
  project.develop();
}

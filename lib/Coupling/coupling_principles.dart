// Tight Coupling vs Loose Coupling
// Tight coupling: Two class heavily dependent on each other.
// If one class changes it'll affect on another
// Breaks SOLID principle (OCP & DIP)
class Engine {
  void start(){
    print('Engine started');
  }
}
class Car {
  // Tightly coupled
  final Engine engine = Engine(); // Car directly access Engine

  void startCar(){
    engine.start();
  }
}

// Loose coupling: Class depends on abstraction rather than depends on concrete the another class
// Support SOLID Principle
abstract class BikeEngine {
  void start();
}

class PetrolEngine implements BikeEngine{
  @override
  void start() {
    print('Petrol Engine Started');
  }
}

class GasEngine implements BikeEngine{
  @override
  void start() {
    print('Gas Engine Started');
  }
}

class Bike {
  final BikeEngine engine; // Bike depends on abstraction

  Bike({required this.engine});

  void startBike(){
    engine.start();
  }
}

void main(){
  // Tight coupled
  var audi = Car();
  audi.startCar(); // Engine started

  // Loose coupled
  var honda = Bike(engine: PetrolEngine());
  var suzuki = Bike(engine: GasEngine());
  honda.startBike(); // Petrol Engine Started
  suzuki.startBike(); // Gas Engine Started
}

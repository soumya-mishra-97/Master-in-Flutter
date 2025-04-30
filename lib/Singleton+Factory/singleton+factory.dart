import 'package:flutter/material.dart';

// Singleton Implement -> Provides global point access to it and access it across the app
// Private Constructor with static instance -> Prevents the external instantiation , ensures only one instance exists.
// Factory Constructor -> Lazy Initialization: Create the new instance if it's need otherwise return existing instances.

// Private Constructor with static instance
class PrivateSingleton {
  // Step 1: Create a static private instance
  static final PrivateSingleton _instance = PrivateSingleton._internal();

  // Step 2: Private named constructor
  PrivateSingleton._internal();

  // Step 3: Provide a global access point
  static PrivateSingleton get instance => _instance;

  // Method
  void printMsg() {
    debugPrint("Private Constructor with static instance");
  }
}

//  Factory Constructor
class FactorySingleton {
// Step 1: Create a static private instance
  static FactorySingleton? _instance;

// Step 2: Use Factory constructor
  factory FactorySingleton() {
    _instance ??= FactorySingleton.internal();
    return _instance!;
  }

// Step 3: Private named constructor
  FactorySingleton.internal();

  // Method
  void printMsg() {
    debugPrint("Factory Constructor");
  }
}

void main() {
  // Private Constructor
  var obj1 = PrivateSingleton.instance;
  var obj2 = PrivateSingleton.instance;
  obj1.printMsg();
  print(obj1 == obj2);

  //  Factory Constructor
  var obj3 = FactorySingleton();
  var obj4 = FactorySingleton();
  obj3.printMsg();
  print(obj3 == obj4);
}

import 'package:flutter/material.dart';

// Abstract class  vs Interface
// Abstract class
abstract class Animal {
  void walk(); // abstract methods

  // non-abstract methods
  void sound(){}
}

class Dog extends Animal{
  @override
  void walk() {
    debugPrint('Dog is walking');
  }

  @override
  void sound() {
    debugPrint('Dog making sound');
    super.sound();
  }
}

// Interface
abstract class Profile {
  void details(); // only support abstract methods
}

class User implements Profile {
  String? name;
  String? age;

  @override
  void details() {
    debugPrint('User details: $name and $age');
  }
}

void main(){
  // Abstract
  var dog = Dog();
  dog.walk();
  dog.sound();

  // Interface
  var user1 = User();
  user1.name = 'Steve';
  user1.age = '28';
  user1.details();
}
import 'package:flutter/material.dart';

/*
Key Points in the Code
--------------------------------
Singleton Pattern Using factory Constructor
----------------
The class Person is implementing the Singleton Pattern by ensuring only one instance (person1) is created.
The factory constructor Person.p1() is used instead of a normal constructor to control the instance creation.
static Person? person1;
This static variable holds the single instance of the Person class.
It is initially null and gets assigned when Person.p1() is called for the first time.
Factory Constructor (factory Person.p1())

The factory keyword is used in Dart constructors when we do not always create a new object.
Here, Person.p1() checks if person1 is already created; if not, it creates a new instance.

Using ??= (Null-Aware Assignment Operator)
person1 ??= Person(15, "Soumya");
??= means:
"If person1 is null, assign it a new instance. Otherwise, keep the existing value."
First time calling Person.p1():
person1 is null, so it creates Person(15, "Soumya") and assigns it.
On subsequent calls:
person1 is not null, so it simply returns the existing instance.
debugPrint(p1.name);

Since p1 is assigned using Person.p1(), it holds the singleton instance.
debugPrint(p1.name); prints "Kevin".*/

/// Singleton Pattern Using factory Constructor
class Person {
  int? age;
  String? name;

  Person(this.age, this.name);

  static Person? person;

  factory Person.p1() {
    person = Person(24, 'Kevin');
    return person!;
  }
}

/// Conditional based objects creation
class Animal {
  String? sound;

  Animal(this.sound);

  factory Animal.create(String type) {
    if (type == 'dog') {
      return Dog('Bark');
    } else if (type == 'cat') {
      return Cat('Mew');
    } else {
      return Animal('Unknown');
    }
  }

  void makeSound() {
    debugPrint('Animal make $sound');
  }
}

class Dog extends Animal {
  Dog(String super.sound);
}

class Cat extends Animal {
  Cat(String super.sound);
}

/*void main() {
  var p1 = Person.p1();
  debugPrint('Name: ${p1.name} & Age: ${p1.age}');

  var d1 = Animal.create('dog');
  d1.makeSound();
  var c1 = Animal.create('cat');
  c1.makeSound();

  var unknown = Animal.create('Unknown');
  unknown.makeSound();
}*/

/// Factory constructor method (not a singleton)
class HelloFactory {
  // Private named constructor
  HelloFactory._();

  //  Factory constructor method (not a singleton)
  factory HelloFactory.create(String type) {
    print('Hello, $type World! from Factory');
    return HelloFactory._(); // creates a new instance every time
  }
}

void main() {
  HelloFactory.create('Dart');
}



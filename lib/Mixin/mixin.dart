import 'package:flutter/cupertino.dart';

void main() {
  Dog dog = Dog();
  dog.eat();

  Manimal manimal = Manimal();
  manimal.eat();

  var objC = C();
  objC.fooA();
  objC.fooB();
  objC.fooC();
}

class Dog extends Animal with CanBark {
  void walk() {
    debugPrint("Walking...");
  }
}

class Animal {
  void eat() {
    debugPrint("Eating...");
  }

  void sleep() {
    debugPrint("Sleeping...");
  }
}

mixin CanBark {
  void canBark() {
    debugPrint("Barking...");
  }
}

mixin MixinA {
  void eat() {
    debugPrint("MixinA: Eating...");
  }
}

mixin MixinB {
  void eat() {
    debugPrint("MixinB: Eating...");
  }
}

class Manimal with MixinA, MixinB {}

mixin A{
  void fooA(){
    print("A");
  }
}
mixin B{
  void fooB(){
    print("B");
  }
}

class C with A, B{
  @override
  void fooA() {
    print("Mixin A");
  }
  @override
  void fooB() {
    print("Mixin B");
  }
  void fooC(){
    print("C");
  }
}

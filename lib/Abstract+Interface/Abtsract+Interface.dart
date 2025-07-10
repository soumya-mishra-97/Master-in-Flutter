import 'package:flutter/material.dart';

// Abstract class  vs Interface
// Abstract class
abstract class UserRepo{
  void fetchData();
  void printUserData(){
    print("Userdata");
  }
}

class UserData extends UserRepo{
  @override
  void fetchData() {
    print("Fetching the data");
  }
  @override
  void printUserData() {
    print("print userdata");
  }
}

// Interface
abstract class UserInfo{
  String? userDetails();
}

class AdminUser implements UserInfo{
  String? firstname;
  String? lastname;
  String? fullname;

  AdminUser(this.firstname, this.lastname);

  @override
  String? userDetails() {
    fullname = '$firstname $lastname';
    return fullname;
  }
}

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
  var objectUser = UserData();
  objectUser.fetchData();
  objectUser.printUserData();

  // Interface
  var user1 = User();
  user1.name = 'Steve';
  user1.age = '28';
  user1.details();

  var objectAdminUser = AdminUser("Soumya", "Mishra");
  debugPrint(objectAdminUser.userDetails());
}

// Interface (normal class acting as an interface)
class Greeting {
  void sayHello() {
    print("Hello from Greeting class!");
  }

  void commonGreeting() {
    print("Enjoy your day!");
  }
}

// Implementing the interface
class FrenchGreeting implements Greeting {
  @override
  void sayHello() {
    print("Bonjour, le monde!");
  }

  @override
  void commonGreeting() {
    print("Passez une bonne journée!");
  }
}

/*void main() {
  FrenchGreeting greeting = FrenchGreeting();
  greeting.sayHello();         // Output: Bonjour, le monde!
  greeting.commonGreeting();   // Output: Passez une bonne journée!
}*/

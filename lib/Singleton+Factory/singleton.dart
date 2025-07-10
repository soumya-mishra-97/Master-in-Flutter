/// Singleton Designpattern:
/// It’s design pattern class has only one instance throughout the application and provides a global access point to that instance.
class UserInfo {
  final String firstName;
  final String lastName;

  UserInfo({required this.firstName, required this.lastName});

  @override
  String toString() => 'First Name: $firstName, Last Name: $lastName';
}

// Singleton class
class SingletonUserInfo {
  // Step 1: Static private instance
  static final SingletonUserInfo _instance = SingletonUserInfo._internal();

  // Step 2: Private constructor
  SingletonUserInfo._internal();

  // Step 3: Global access point
  static SingletonUserInfo get instance => _instance;

  // Private stored user info
  UserInfo? _objectUserInfo;

  // Getter method
  UserInfo? getUserInfo() {
    return _objectUserInfo;
  }

  // Setter method
  void updateUserInfo(UserInfo userInfo) {
    _objectUserInfo = userInfo;
  }
}

// Class to simulate user update & get flow
class User {
  UserInfo? getUser() {
    return SingletonUserInfo.instance.getUserInfo();
  }

  void updateUser() {
    final newUserInfo = UserInfo(firstName: 'John', lastName: 'Doe');
    SingletonUserInfo.instance.updateUserInfo(newUserInfo);
  }
}

/*void main() {
  final user = User();

  // Before updating
  final userInfoBefore = user.getUser();
  if (userInfoBefore == null) {
    print("No User Found");
  } else {
    print(userInfoBefore);
  }

  // Updating user info
  user.updateUser();

  // After updating
  final userInfoAfter = user.getUser();
  if (userInfoAfter != null) {
    print(userInfoAfter);
  } else {
    print("No User Found");
  }
}*/

/*class Singleton {
  // Step 1: Create a static private instance
  static final Singleton _instance = Singleton._internal();

  // Step 2: Private named constructor
  Singleton._internal();

  // Step 3: Provide a global access point
  static Singleton get instance => _instance;

  // Sample method
  void showMessage() {
    print("Hello from Singleton!");
  }
}

void main() {
  var obj1 = Singleton.instance;
  var obj2 = Singleton.instance;

  obj1.showMessage(); // Output: Hello from Singleton!

  print(obj1 == obj2); // true (Both refer to the same instance)
}*/

class Singleton {
  static Singleton? _instance;

  // Factory constructor returns the same instance
  factory Singleton() {
    _instance ??= Singleton._internal();
    return _instance!;
  }

  // Private named constructor
  Singleton._internal();

  void showMessage() {
    print("Hello from Factory Singleton!");
  }
}

void main() {
  var obj1 = Singleton();
  var obj2 = Singleton();

  obj1.showMessage(); // Output: Hello from Factory Singleton!

  print(obj1 == obj2); // true
}



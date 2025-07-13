import 'package:flutter/material.dart';
import 'package:flutter_interview_ques/DependencyInjection/Screens/home_di.dart';
import 'package:flutter_interview_ques/FlutterKey/global_key.dart';
import 'package:flutter_interview_ques/FlutterKey/object_key.dart';
import 'package:flutter_interview_ques/Future/future_task.dart';
import 'package:flutter_interview_ques/Routing/Screens/second.dart';

import '../../Stream/stream_task.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) =>  const MyStreamClass());
      case '/user':
        return MaterialPageRoute(builder: (_) => const UsersListPage());
      case '/second':
        if (args is String) {
          return MaterialPageRoute(builder: (_) => SecondPage(data: args));
        }
        return _errorRoute();
      case '/secondScreen':
          return MaterialPageRoute(builder: (_) => const SecondScreen());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          elevation: 2,
          title: const Text('Routing App'),
        ),
        body: const Center(
          child: Text('Error'),
        ),
      );
    });
  }
}

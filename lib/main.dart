import 'package:flutter/material.dart';
import 'package:flutter_interview_ques/DependencyInjection/injection_container.dart';
import 'package:flutter_interview_ques/InheritedWidget/state_widget.dart';
import 'package:flutter_interview_ques/Routing/RoutingManagement/route_generator.dart';

void main() {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return StateWidget(
      child: Builder(
        builder: (context){
          final state = StateInheritedClass.of(context)?.state;
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              fontFamily: 'Times',
              scaffoldBackgroundColor: state?.bgColor,
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            initialRoute: '/',
            onGenerateRoute: RouteGenerator.generateRoute,
          );
        }
      ),
    );
  }
}

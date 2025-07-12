import 'package:flutter/material.dart';
import 'package:flutter_interview_ques/Stream/my_stream.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_interview_ques/main.dart';

void main() {
  group('I want to test the main.dart file', () {
    testWidgets("I want to check material app", (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      expect(find.byType(MaterialApp), findsOneWidget);
    });

    testWidgets("I want to check the stream class",
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: MyStreamClass(),
      ));
      expect(find.text("Done"), findsOneWidget);
    });
  });
}

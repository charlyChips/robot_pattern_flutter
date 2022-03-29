import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

abstract class BaseRobot {
  BaseRobot(this.tester);

  final WidgetTester tester;
  Future<void> pumpWidget();

  Future<void> enterText(String keyString, {required String text}) {
    final Finder finder = find.byKey(ValueKey<String>(keyString));
    return tester.enterText(finder, text);
  }

  Future<void> tap(String keyString) {
    final Finder finder = find.byKey(ValueKey<String>(keyString));
    return tester.tap(finder);
  }
}

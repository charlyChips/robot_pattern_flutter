import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:robot_pattern_flutter/features/home/presentation/pages/home_provider.dart';

import '../base/base_robot.dart';
import '../base/test_app.dart';

class HomeRobot extends BaseRobot {
  HomeRobot(WidgetTester tester) : super(tester);

  @override
  Future<void> pumpWidget() {
    return tester.pumpWidget(const TestApp(child: HomeProvider()));
  }

  Future<void> tapOnTodo(int todoId) async {
    await tester.scrollUntilVisible(
        find.byKey(ValueKey<String>('todoTile$todoId')), 200,
        scrollable: find.byType(Scrollable));
    return tap('todoTile$todoId');
  }

  void checkLoader(bool isDisplayed) {
    final Finder loader = find.byKey(const ValueKey<String>('homeLoader'));

    expect(
      loader,
      isDisplayed ? findsOneWidget : findsNothing,
    );
  }
}

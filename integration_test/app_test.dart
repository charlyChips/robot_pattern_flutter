import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:robot_pattern_flutter/features/login/presentation/pages/login_page.dart';

import 'base/test_app.dart';
import 'robots/home_robot.dart';
import 'robots/login_robot.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('Login', () {
    testWidgets('WithoutRobot', (WidgetTester tester) async {
      await tester.pumpWidget(const TestApp(child: LoginPage()));
      await tester.enterText(
        find.byKey(const ValueKey<String>('loginUserTextField')),
        'robotUsername',
      );
      await tester.enterText(
        find.byKey(const ValueKey<String>('loginPasswordTextField')),
        '1234Password',
      );
      await tester.tap(find.byKey(const ValueKey('loginSubmitButton')));
    });

    testWidgets(
      'Submit',
      (WidgetTester tester) async {
        final LoginRobot loginRobot = LoginRobot(tester);
        await loginRobot.pumpWidget();
        await loginRobot.enterUsername('robotUsername');
        await loginRobot.enterPassword('1234Password');
        await loginRobot.tapOnSubmit();
      },
    );
  });

  group('Home', () {
    testWidgets('LoadingData', (WidgetTester tester) async {
      final HomeRobot homeRobot = HomeRobot(tester);
      await homeRobot.pumpWidget();
      homeRobot.checkLoader(true);
      await tester.pumpAndSettle();
      homeRobot.checkLoader(false);
      await homeRobot.tapOnTodo(1);
    });
  });

  group('IntegrationTest', () {
    testWidgets('LoginToHome', (WidgetTester tester) async {
      final LoginRobot loginRobot = LoginRobot(tester);
      await loginRobot.pumpWidget();
      await loginRobot.enterUsername('robotUsername');
      await loginRobot.enterPassword('1234Password');
      await loginRobot.tapOnSubmit();
      await tester.pump();
      await tester.pump();

      final HomeRobot homeRobot = HomeRobot(tester);
      homeRobot.checkLoader(true);
      await tester.pumpAndSettle();
      homeRobot.checkLoader(false);
      await tester.pumpAndSettle();
      await homeRobot.tapOnTodo(45);
      await tester.pumpAndSettle();
    });
  });
}

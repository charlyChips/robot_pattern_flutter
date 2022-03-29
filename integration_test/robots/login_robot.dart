import 'package:flutter_test/src/widget_tester.dart';
import 'package:robot_pattern_flutter/features/login/presentation/pages/login_page.dart';

import '../base/base_robot.dart';
import '../base/test_app.dart';

class LoginRobot extends BaseRobot {
  LoginRobot(WidgetTester tester) : super(tester);

  @override
  Future<void> pumpWidget() {
    return tester.pumpWidget(const TestApp(child: LoginPage()));
  }

  Future<void> enterUsername(String username) {
    return enterText('loginUserTextField', text: username);
  }

  Future<void> enterPassword(String password) {
    return enterText('loginPasswordTextField', text: password);
  }

  Future<void> tapOnSubmit() {
    return tap('loginSubmitButton');
  }
}

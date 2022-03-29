import 'package:flutter/material.dart';

class TestApp extends StatelessWidget {
  const TestApp({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: Builder(builder: (_) => child)),
    );
  }
}

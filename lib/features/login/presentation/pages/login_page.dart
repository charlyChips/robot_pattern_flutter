import 'package:flutter/material.dart';

import '../../../home/presentation/pages/home_provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            TextFormField(
              key: const ValueKey<String>('loginUserTextField'),
              decoration: const InputDecoration(labelText: 'User'),
            ),
            const SizedBox(height: 8),
            TextFormField(
              key: const ValueKey<String>('loginPasswordTextField'),
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              key: const ValueKey<String>('loginSubmitButton'),
              onPressed: () {
                Navigator.push<void>(
                    context,
                    MaterialPageRoute<void>(
                        builder: (_) => const HomeProvider()));
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

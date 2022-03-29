import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/todo_data_repository.dart';
import '../state_management/home_notifier.dart';
import 'home_page.dart';

class HomeProvider extends StatelessWidget {
  const HomeProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeNotifier(todoRepository: TodoDataRepository()),
      child: const HomePage(),
    );
  }
}

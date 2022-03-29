import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:robot_pattern_flutter/features/home/domain/models/todo_model.dart';

import '../state_management/home_notifier.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Consumer<HomeNotifier>(builder: (_, HomeNotifier value, __) {
        if (value.isLoading) {
          return const Center(
              child: CircularProgressIndicator(
            key: ValueKey<String>('homeLoader'),
          ));
        }
        return ListView.builder(
            itemCount: value.list.length,
            itemBuilder: (context, index) {
              final TodoModel item = value.list[index];
              return ListTile(
                key: ValueKey<String>('todoTile${item.id}'),
                title: Text(item.name),
                onTap: () {
                  debugPrint('Tap on ${item.name}');
                },
              );
            });
      }),
    );
  }
}

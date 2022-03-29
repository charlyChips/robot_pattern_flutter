import 'dart:async';

import 'package:flutter/material.dart';

import '../../domain/models/todo_model.dart';
import '../../domain/repos/todo_repo.dart';

class HomeNotifier extends ChangeNotifier {
  HomeNotifier({required TodoRepository todoRepository})
      : _todoRepository = todoRepository,
        super() {
    fetch();
  }

  final TodoRepository _todoRepository;
  List<TodoModel> _list = const <TodoModel>[];
  List<TodoModel> get list => _list;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  StreamSubscription<List<TodoModel>>? _listStreamSubscription;

  void fetch() {
    isLoading = true;
    _listStreamSubscription =
        _todoRepository.fetchTodoList().listen((List<TodoModel> todoList) {
      _list = todoList;
      notifyListeners();
    }, onError: (Object error) {
      debugPrint('Handle Error $error');
    }, onDone: () => isLoading = false);
  }

  @override
  void dispose() {
    _listStreamSubscription?.cancel();
    _listStreamSubscription = null;
    super.dispose();
  }
}

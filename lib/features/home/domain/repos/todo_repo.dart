import '../models/todo_model.dart';

abstract class TodoRepository {
  Stream<List<TodoModel>> fetchTodoList();
}

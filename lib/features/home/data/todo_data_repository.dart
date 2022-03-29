import '../domain/models/todo_model.dart';
import '../domain/repos/todo_repo.dart';

class TodoDataRepository implements TodoRepository {
  @override
  Stream<List<TodoModel>> fetchTodoList() async* {
    yield* Future.delayed(
      const Duration(seconds: 1),
      () => List.generate(50, (index) => TodoModel.byIndex(index)),
    ).asStream();
  }
}

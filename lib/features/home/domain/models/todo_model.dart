class TodoModel {
  TodoModel({
    required this.id,
    required this.name,
  });

  factory TodoModel.byIndex(int index) {
    return TodoModel(id: index, name: 'Task to do #$index');
  }
  final int id;
  final String name;
}

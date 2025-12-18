class TodoModel {
  TodoModel({
    required this.title,
    required this.description,
    this.isDone = false,
  });

  final String title;
  final String description;
  bool isDone; // ✅ НЕ bool?
}

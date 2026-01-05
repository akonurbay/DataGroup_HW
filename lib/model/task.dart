class Task {
  final String title;
  bool isDone;
  final DateTime createdAt;

  Task({
    required this.title,
    this.isDone = false,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();
}

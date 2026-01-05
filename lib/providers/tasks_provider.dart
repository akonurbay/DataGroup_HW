import 'package:flutter/material.dart';
import 'package:lesson/model/task.dart';

class TasksProvider extends ChangeNotifier {
  List<Task> tasks = []; // вместо List<String>

  void addTask(String title) {
    tasks.add(Task(title: title)); // создаём объект Task
    notifyListeners();
  }

  void removeTask(int index) {
    tasks.removeAt(index);
    notifyListeners();
  }

  void toggleTask(int index) { // новый метод для отметки как выполнено
    tasks[index].isDone = !tasks[index].isDone;
    notifyListeners();
  }
}

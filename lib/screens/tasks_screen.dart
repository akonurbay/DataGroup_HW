import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lesson/providers/tasks_provider.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tasks = context.watch<TasksProvider>().tasks;

    return Scaffold(
      appBar: AppBar(title: const Text('Задачи (ДЗ 17)')),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return ListTile(
            title: Text(
              task.title,
              style: TextStyle(
                decoration: task.isDone ? TextDecoration.lineThrough : null,
              ),
            ),
            trailing: Checkbox(
              value: task.isDone,
              onChanged: (_) {
                context.read<TasksProvider>().toggleTask(index);
              },
            ),
            onLongPress: () {
              context.read<TasksProvider>().removeTask(index);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<TasksProvider>().addTask('Новая задача');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

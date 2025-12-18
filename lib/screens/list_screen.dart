import 'package:flutter/material.dart';
import 'package:lesson/screens/todo_model.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  late final List<TodoModel> _todoList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _todoList = List.generate(30, (int index) {
      return TodoModel(
        title: 'Task # ${index + 1}',
        description: 'hey this is your task',
        isDone: false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List Screen'),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: Center(
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 10),
            itemBuilder: (context, index) {
              final item = _todoList[index];
              return Card(
                color: Colors.amber,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item.title, style: TextStyle(fontSize: 20)),
                          Text(item.description),
                        ],
                      ),

                      IconButton(
                        icon: Icon(
                          item.isDone
                              ? (Icons.check_box)
                              : Icons.check_box_outline_blank,
                          color: item.isDone ? Colors.green : Colors.red,
                          size: 30,
                        ),
                        onPressed: () {
                          setState(() {
                            item.isDone = !item.isDone;
                          });

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                item.isDone
                                    ? 'done ${item.title}'
                                    : 'undone ${item.title}',
                              ),
                              duration: const Duration(seconds: 1),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
              height: 1,
            ),
            itemCount: _todoList.length,
          ),
        ),
      ),
    );
  }
}
// 1) Создай список данных для отображения, например:

// List<String> tasks = ["Задача 1", "Задача 2", "Задача 3"];

// 2) Создай виджет экрана списка (например, StatelessWidget TasksListScreen), в методе build которого будет находиться список ListView.

// 3) Используй ListView.builder и задай itemCount равным tasks.length.

// 4) Возвращай из itemBuilder виджет ListTile для каждого элемента списка (используй tasks[index] в title: Text(…)).

// 5) Добавь к каждому элементу списка иконку: укажи у ListTile свойство leading (или trailing) с иконкой, например Icon(Icons.check_box_outline_blank).

// 6) Добавь разделители между элементами списка: замени ListView.builder на ListView.separated и в свойстве separatorBuilder возвращай виджет Divider().

// 7) Реализуй обработку нажатия на элемент списка: укажи у ListTile свойство onTap, внутри которого вызывай, например, print(tasks[index]) или показывай SnackBar с названием выбранной задачи.

// 8) Запусти приложение и проверь: список прокручивается, у каждого элемента есть текст, иконка и разделитель, а при нажатии на элемент выводится соответствующее сообщение.

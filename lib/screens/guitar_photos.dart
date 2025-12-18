import 'package:flutter/material.dart';

class GuitarPhotos extends StatefulWidget {
  const GuitarPhotos({super.key});

  @override
  State<GuitarPhotos> createState() => _GuitarPhotosState();
}

class _GuitarPhotosState extends State<GuitarPhotos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guitar Photos Screen'),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: Center(
          child: ListView(
            children: [
            ],
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

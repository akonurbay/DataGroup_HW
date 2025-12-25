import 'package:flutter/material.dart';
import '../counter_model.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  final CounterModel counterModel = CounterModel();

  @override
  void initState() {
    super.initState();
    counterModel.loadCounter().then((_) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${counterModel.counter}',
              style: const TextStyle(fontSize: 48),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                await counterModel.increment();
                setState(() {});
              },
              child: const Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}
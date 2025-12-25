import 'package:shared_preferences/shared_preferences.dart';

class CounterModel {
  int counter = 0;
  static const _key = 'counter';

  Future<void> loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    counter = prefs.getInt(_key) ?? 0;
  }

  Future<void> saveCounter() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_key, counter);
  }

  Future<void> increment() async {
    counter++;
    await saveCounter();
  }
}
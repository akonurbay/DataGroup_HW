import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key, required this.title});

  @override
  final String title;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings Screen'),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: Center(
          //  child: TextButton(onPressed: () {}, child: Text('datails')
          child: Text(title),
        ),
      ),
    );
  }
}

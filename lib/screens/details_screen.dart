import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details Screen'),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: Center(
          child: TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/settings',arguments: 'From Details Screen');
            },
            child: Text('settings'),
          ),
        ),
      ),
    );
  }
}

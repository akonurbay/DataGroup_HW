import 'package:flutter/material.dart';
import 'package:lesson/screens/details_screen.dart';
import 'package:lesson/screens/home_screen.dart';
import 'package:lesson/screens/settings_screen.dart';
import 'package:lesson/screens/sign_up_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext? context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => SignUpScreen(),
        '/home': (context) => HomeScreen(),
        '/details': (context) => DetailsScreen(),
        '/settings': (context) => SettingsScreen(
          title: ModalRoute.of(context)!.settings.arguments as String,
        ),
      },
    );
  }
}

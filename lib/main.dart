import 'package:flutter/material.dart';
import 'package:lesson/screens/cartoon.dart';
import 'package:lesson/screens/counter_page.dart';
import 'package:lesson/screens/details_screen.dart';
import 'package:lesson/screens/guitar_photos.dart';
import 'package:lesson/screens/home_screen.dart';
import 'package:lesson/screens/list_screen.dart';
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
        '/counter':(context)=> CounterPage(),
        '/login': (context) => SignUpScreen(),
        '/home': (context) => HomeScreen(),
        '/details': (context) => DetailsScreen(),
        '/guitar': (context) => GuitarPhotos(),
        '/list': (context) => ListScreen(),
        '/cartoon': (context) => Cartoon(),
        '/settings': (context) => SettingsScreen(
          title: ModalRoute.of(context)!.settings.arguments as String,
        ),
      },
    );
  }
}

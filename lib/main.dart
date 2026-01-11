import 'package:flutter/material.dart';
import 'package:lesson/screens/cartoon.dart';
import 'package:lesson/screens/counter_page.dart';
import 'package:lesson/screens/details_screen.dart';
import 'package:lesson/screens/guitar_photos.dart';
import 'package:lesson/screens/home_screen.dart';
import 'package:lesson/screens/list_screen.dart';
import 'package:lesson/screens/settings_screen.dart';
import 'package:lesson/screens/sign_up_screen.dart';
import 'package:lesson/providers/tasks_provider.dart';
import 'package:lesson/screens/tasks_screen.dart';
import 'package:provider/provider.dart'; // новый экран
import 'package:lesson/screens/gallery_screen.dart';

void main() {
  runApp(const MyApp());
}

// Определение светлой темы
final ThemeData lightTheme = ThemeData.light(
  useMaterial3: true,
).copyWith(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.blue,
    brightness: Brightness.light,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.blue,
    foregroundColor: Colors.white,
    elevation: 4,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.blue,
    foregroundColor: Colors.white,
  ),
  textTheme: TextTheme(
    headlineLarge: const TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Colors.black87,
    ),
    bodyLarge: const TextStyle(
      fontSize: 16,
      color: Colors.black87,
    ),
  ),
);

// Определение тёмной темы
final ThemeData darkTheme = ThemeData.dark(
  useMaterial3: true,
).copyWith(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.amber,
    brightness: Brightness.dark,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.grey[900],
    foregroundColor: Colors.white,
    elevation: 4,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.amber,
    foregroundColor: Colors.black,
  ),
  textTheme: TextTheme(
    headlineLarge: const TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    bodyLarge: const TextStyle(
      fontSize: 16,
      color: Colors.white70,
    ),
  ),
);

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TasksProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
        initialRoute: '/login',
        routes: {
          '/counter': (context) => CounterPage(),
          '/login': (context) => SignUpScreen(onThemeChanged: (bool isDarkMode) {
            setState(() {
              isDark = isDarkMode;
            });
          }),
          '/home': (context) => HomeScreen(onThemeChanged: (bool isDarkMode) {
            setState(() {
              isDark = isDarkMode;
            });
          }),
          '/details': (context) => DetailsScreen(),
          '/guitar': (context) => GuitarPhotos(),
          '/list': (context) => ListScreen(),
          '/cartoon': (context) => Cartoon(),
          '/settings': (context) => SettingsScreen(
            title: ModalRoute.of(context)!.settings.arguments as String,
          ),
          '/tasks': (context) => const TasksScreen(),
          '/gallery': (context) => const GalleryScreen(),
        },
      ),
    );
  }
}

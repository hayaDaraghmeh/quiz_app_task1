import 'package:flutter/material.dart';
import 'package:quiz_app_project/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App ',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 250, 211, 17)),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:riverpod_todo_app/view/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do App With Riverpod SM',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: const HomePageScreen(),
    );
  }
}

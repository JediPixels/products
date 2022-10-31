import 'package:flutter/material.dart';
import 'package:products/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Products',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColorLight: Colors.white,
        brightness: Brightness.light,
        canvasColor: Colors.blueGrey.shade50,
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.grey,
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.system,
      home: const Home(),
    );
  }
}
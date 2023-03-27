import 'package:flutter/material.dart';
import 'package:flutter_api_app/screens/home/home.dart';
import 'package:flutter_api_app/screens/second/second.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: Home(),
      routes: {
        '/home': (context) => Home(),
        '/second': (context) => Second(),
      },
    );
  }
}


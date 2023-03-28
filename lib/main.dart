import 'package:flutter/material.dart';
import 'package:flutter_api_app/screens/home/home.dart';
import 'package:flutter_api_app/utils/color_pallate.dart';

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
        primarySwatch: Palette.white,
      ),
      home: const Home(),
    );
  }
}


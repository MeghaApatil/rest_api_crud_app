import 'package:flutter/material.dart';
import 'package:flutter_api_app/screens/home/home.dart';
import 'package:flutter_api_app/screens/second/second.dart';

class Routes{
  final routes =<String,WidgetBuilder> {
        '/home': (BuildContext context) => Home(),
        '/second': (BuildContext context) => Second(),
  };
}
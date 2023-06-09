import 'package:flutter/material.dart';

class SnackBarUtil{
 static showSnackbar(BuildContext context,String message) {
    final snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static showErrorSnackbar(BuildContext context,String message,Color color) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor:color ,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
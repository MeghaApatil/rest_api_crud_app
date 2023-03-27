import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_api_app/api_config/url_constants.dart';
import 'package:flutter_api_app/models/data.dart';
import 'package:flutter_api_app/models/item.dart';
import 'package:flutter_api_app/screens/home/home.dart';
import 'package:flutter_api_app/screens/second/second_view.dart';
import 'package:flutter_api_app/utils/messages.dart';
import 'package:flutter_api_app/utils/snackbarutil.dart';
import 'package:http/http.dart' as http;

class Second extends StatefulWidget {
  final Item? item;
  const Second({super.key, this.item});

  @override
  SecondView createState() => SecondView();
}

abstract class SecondState extends State<Second> {
  @protected
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  bool isEdit = false;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    checkEditScreen();
  }

  String? validateData(String? val) {
    if (val == null || val.isEmpty) {
      return 'can\'t be empty';
    } else {
      return null;
    }
  }

  checkvalidattion() {
    if (formKey.currentState!.validate()) {
      isEdit ? updateData() : sumbit();
      
    }
  }

  checkEditScreen() {
    final item = widget.item;
    if (widget.item != null) {
      isEdit = true;
      final title = item!.title;
      final description = item.description;
      titleController.text = title;
      descriptionController.text = description;
    }
  }

  Future<void> sumbit() async {
    final title = titleController.text;
    final description = descriptionController.text;
    Map<String, dynamic> data =
        Data(title: title, description: description, isCompleted: false)
            .toJson();
    final url = Uri.parse(Urls.postUrl);
    final response = await http.post(url,
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 201) {
      titleController.text = '';
      descriptionController.text = '';
      SnackBarUtil.showSnackbar(context, Messages.createdData);
      navigateToHome();
    } else {
      SnackBarUtil.showErrorSnackbar(context, Messages.error, Colors.red);
    }
  }

  navigateToHome() {
    final route = MaterialPageRoute(builder: (context) => const Home());
    Navigator.of(context).push(route);
  }

  Future<void> updateData() async {
    final title = titleController.text;
    final description = descriptionController.text;
    final item = widget.item;
    if (item == null) {
      print('not updated');
      return;
    }
    final id = item.id;
    final iscompleted = item.isCompleted;
    final data =
        Data(title: title, description: description, isCompleted: false);
    final url = Uri.parse(Urls.updateUrl + id);

    final response = await http.put(url,
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      titleController.text = '';
      descriptionController.text = '';
      SnackBarUtil.showSnackbar(context, Messages.updatedData);
      navigateToHome();
    } else {
      SnackBarUtil.showErrorSnackbar(context, Messages.error, Colors.red);
    }
  }
}

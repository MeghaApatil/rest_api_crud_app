import 'package:flutter/material.dart';
import 'package:flutter_api_app/models/item.dart';
import 'package:flutter_api_app/screens/home/home.dart';
import 'package:flutter_api_app/screens/second/second_view_model.dart';
import 'package:flutter_api_app/screens/second/second_view.dart';
import 'package:flutter_api_app/utils/snackbar_util.dart';

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
  SecondViewModel secondViewModel = SecondViewModel();

  @override
  void initState() {
    super.initState();
    checkEditScreen();
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

  String? validateData(String? val) {
    if (val == null || val.isEmpty) {
      return 'can\'t be empty';
    } else {
      return null;
    }
  }

  checkvalidattion() {
    if (formKey.currentState!.validate()) {
      isEdit ? update() : submit();
    }
  }

  Future<void> submit() async {
    final title = titleController.text;
    final description = descriptionController.text;
    secondViewModel.sumbitApi(title, description, (success) {
      titleController.text = '';
      descriptionController.text = '';
      SnackBarUtil.showSnackbar(context, success);
      navigateToHome();
    }, (error) {
      SnackBarUtil.showErrorSnackbar(context, error, Colors.red);
    });
  }

  Future<void> update() async {
    final title = titleController.text;
    final description = descriptionController.text;
    final item = widget.item;
    if (item == null) {
      return;
    }
    final id = item.id;
    final iscompleted = item.isCompleted;
    secondViewModel.updateDataApi(title, description, id, (success) {
      titleController.text = '';
      descriptionController.text = '';
      SnackBarUtil.showSnackbar(context, success);
      navigateToHome();
    }, (errror) {
      SnackBarUtil.showErrorSnackbar(context, errror, Colors.red);
    });
  }

  navigateToHome() {
    final route = MaterialPageRoute(builder: (context) => const Home());
    Navigator.of(context).push(route);
  }
}

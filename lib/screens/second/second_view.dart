import 'package:flutter/material.dart';
import 'package:flutter_api_app/screens/second/second.dart';
import 'package:flutter_api_app/utils/string_constants.dart';

class SecondView extends SecondState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          isEdit ? StringConstants.editData : StringConstants.addData,
          style: const TextStyle(
            color: Color.fromARGB(237, 95, 93, 93),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: titleController,
                  keyboardType: TextInputType.text,
                  validator: validateData,
                  decoration: InputDecoration(
                    labelText: StringConstants.title,
                    labelStyle: const TextStyle(
                      color: Colors.grey,
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
                TextFormField(
                  controller: descriptionController,
                  keyboardType: TextInputType.text,
                  validator: validateData,
                  decoration: InputDecoration(
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      labelText: StringConstants.description,labelStyle: const TextStyle(
                      color: Colors.grey,
                    ),),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    checkvalidattion();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text(isEdit
                        ? StringConstants.update
                        : StringConstants.sumbit),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

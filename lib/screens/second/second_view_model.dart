import 'dart:convert';

import 'package:flutter_api_app/utils/url_constants.dart';
import 'package:flutter_api_app/models/data.dart';
import 'package:flutter_api_app/utils/messages.dart';
import 'package:http/http.dart' as http;

class SecondViewModel {
  Future<void> updateDataApi(String title,String description,String id,Function completion,Function error) async {
    final data =
        Data(title: title, description: description, isCompleted: false);
    final url = Uri.parse(Urls.updateUrl + id);

    final response = await http.put(url,
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      completion(Messages.updatedData);
    } else {
      error(Messages.error);
    }
  }

  Future<void> sumbitApi(String title, String description, Function completion,
      Function error) async {
    Map<String, dynamic> data =
        Data(title: title, description: description, isCompleted: false)
            .toJson();
    final url = Uri.parse(Urls.postUrl);
    final response = await http.post(url,
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 201) {
      completion(Messages.createdData);
    } else {
      error(Messages.error);
    }
  }
}

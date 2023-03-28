import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_api_app/utils/url_constants.dart';
import 'package:flutter_api_app/models/data_item.dart';
import 'package:flutter_api_app/models/item.dart';
import 'package:flutter_api_app/utils/messages.dart';
import 'package:http/http.dart' as http;

class HomeViewModel{
  Future<void> fetchDataApi(BuildContext context,Function completion,Function error) async {
    final url = Uri.parse(Urls.getUrl);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map;
      DataItem dataItem = DataItem.fromJson(json);
       List<Item> items = dataItem.items;
        completion(items);
    } else {
      error(Messages.error);
    }
  }

  deleteDataByIdApi(String id,List<Item> items,BuildContext context,Function completion,Function error) async {
    final url = Uri.parse(Urls.deleteUrl + id);
    final response = await http.delete(url);
    if (response.statusCode == 200) {
      final itemList = items.where((item) => item.id != id).toList();
        items = itemList;
        completion(items);
    } else {
      error(Messages.listEmpty);
    }
  }
}
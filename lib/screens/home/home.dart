import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_api_app/api_config/url_constants.dart';
import 'package:flutter_api_app/models/data_item.dart';
import 'package:flutter_api_app/models/item.dart';
import 'package:flutter_api_app/screens/home/homeView.dart';
import 'package:flutter_api_app/screens/second/second.dart';
import 'package:flutter_api_app/utils/messages.dart';
import 'package:flutter_api_app/utils/snackbarutil.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeView createState() => HomeView();
}

abstract class HomeState extends State<Home> {
  List<Item> items = [];
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final url = Uri.parse(Urls.getUrl);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map;
      DataItem dataItem = DataItem.fromJson(json);
      setState(() {
        items = dataItem.items;
        print('item len::${items.length}');
        SnackBarUtil.showSnackbar(context, Messages.success);
      });
    } else {
      SnackBarUtil.showErrorSnackbar(context, Messages.error, Colors.red);
    }
  }

  deleteDataById(String id) async {
    final url = Uri.parse(Urls.deleteUrl + id);
    final response = await http.delete(url);
    if (response.statusCode == 200) {
      final itemList = items.where((item) => item.id != id).toList();
      setState(() {
        items = itemList;
        print('${items.length}');
        SnackBarUtil.showSnackbar(context, Messages.dataDeleted);
      });
    } else {
      SnackBarUtil.showErrorSnackbar(context, Messages.listEmpty, Colors.red);
    }
  }


navigateToSecond() {
    final route = MaterialPageRoute(builder: (context) => const Second());
    Navigator.of(context).push(route);
  }

navigateToEdit(Item item1) {
    final route = MaterialPageRoute(builder: (context) => Second(item: item1,));
    Navigator.of(context).push(route);
  }
}

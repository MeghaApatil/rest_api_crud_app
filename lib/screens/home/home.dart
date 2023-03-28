import 'package:flutter/material.dart';
import 'package:flutter_api_app/models/item.dart';
import 'package:flutter_api_app/screens/home/home_view.dart';
import 'package:flutter_api_app/screens/home/home_view_model.dart';
import 'package:flutter_api_app/screens/second/second.dart';
import 'package:flutter_api_app/utils/messages.dart';
import 'package:flutter_api_app/utils/snackbar_util.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeView createState() => HomeView();
}

abstract class HomeState extends State<Home> {
  List<Item> items = [];
  HomeViewModel homeViewModel = HomeViewModel();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    homeViewModel.fetchDataApi(context, (List<Item> itemList) {
      setState(() {
        items = itemList;
      });
      SnackBarUtil.showSnackbar(context, Messages.success);
    }, (error) {
      SnackBarUtil.showErrorSnackbar(context, error, Colors.red);
    });
  }

  deleteDataById(String id) {
    homeViewModel.deleteDataByIdApi(id, items, context, (List<Item> itemList) {
      setState(() {
        items = itemList;
      });
      SnackBarUtil.showSnackbar(context, Messages.dataDeleted);
    }, (error) {
      SnackBarUtil.showErrorSnackbar(context, error, Colors.red);
    });
  }

  navigateToSecond() {
    final route = MaterialPageRoute(builder: (context) => const Second());
    Navigator.of(context).push(route);
  }

  navigateToEdit(Item item1) {
    final route = MaterialPageRoute(
      builder: (context) => Second(
        item: item1,
      ),
    );
    Navigator.of(context).push(route);
  }
}

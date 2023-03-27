import 'package:flutter/material.dart';

import 'package:flutter_api_app/screens/home/home.dart';
import 'package:flutter_api_app/utils/string_constants.dart';

class HomeView extends HomeState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        leading: const Icon(Icons.home),
      ),
      body: RefreshIndicator(
        onRefresh: fetchData,
        child: items.isEmpty
            ?  Center(
                child: Text(
                  StringConstants.emptyList,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              )
            : ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: items.length,
                separatorBuilder: (context, index) => const Divider(
                  color: Colors.black,
                ),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                          title: Text(
                            items[index].title,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            items[index].description,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                          trailing: SizedBox(
                            width: 100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      navigateToEdit(items[index]);
                                    },
                                    icon: const Icon(Icons.edit)),
                                IconButton(
                                    onPressed: () {
                                      deleteDataById(items[index].id);
                                    },
                                    icon: const Icon(Icons.delete)),
                              ],
                            ),
                          )),
                    ],
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigateToSecond();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

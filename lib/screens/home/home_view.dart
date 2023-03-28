import 'package:flutter/material.dart';

import 'package:flutter_api_app/screens/home/home.dart';
import 'package:flutter_api_app/utils/string_constants.dart';

class HomeView extends HomeState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(color: Color.fromARGB(237, 95, 93, 93)),
        ),
        leading: const Icon(
          Icons.home_work_outlined,
        ),
      ),
      body: RefreshIndicator(
        onRefresh: fetchData,
        child: items.isEmpty
            ? Center(
                child: Text(
                  StringConstants.noItems,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              )
            : ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: items.length,
                // separatorBuilder: (context, index) => const Divider(
                //   color: Colors.black,
                // ),
                itemBuilder: (context, index) {
                  return Card(
                    shadowColor: Colors.white,
                    color: Colors.white,
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            items[index].title,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                          subtitle: Text(
                            items[index].description,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                          leading: const CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/woman.png'),
                          ),
                          trailing: PopupMenuButton(
                            itemBuilder: (context) {
                              return [
                                PopupMenuItem(
                                    value: 'edit',
                                    child: Text(StringConstants.edit),),
                                PopupMenuItem(
                                    value: 'delete',
                                    child: Text(StringConstants.delte),)
                              ];
                            },
                            onSelected: (value) {
                              if (value == 'edit') {
                                navigateToEdit(items[index]);
                              } else if (value == 'delete') {
                                deleteDataById(items[index].id);
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigateToSecond();
        },
        child: const Icon(Icons.notes),
      ),
    );
  }
}
// SizedBox(
//                             width: 10,
//                             height: 10,
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 IconButton(
//                                     onPressed: () {
//                                     },
//                                     icon: const Icon(Icons.edit)),
//                                 IconButton(
//                                     onPressed: () {
//                                     },
//                                     icon: const Icon(Icons.delete)),
//                               ],
//                             ),
//                           ),
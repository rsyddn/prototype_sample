import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prototype_sample/controller/home/list_controller.dart';

class ListPage extends StatelessWidget {
  ListPage({Key? key}) : super(key: key);
  final ListPageController con = Get.put(ListPageController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ListPageController>(
      init: ListPageController(),
      builder: (_) {
        return RefreshIndicator(
          onRefresh: () async {
            _.getTodos();
          },
          child: ListView.builder(
            itemBuilder: (ctx, idx) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 16.0,
                  ),
                  child: Row(
                    children: [
                      Expanded(child: Text(_.todos[idx].title)),
                      const SizedBox(width: 16),
                      IconButton(
                        onPressed: () {
                          debugPrint('$idx');
                        },
                        icon: const Icon(Icons.favorite),
                      )
                    ],
                  ),
                ),
              );
            },
            itemCount: _.todos.length,
          ),
        );
      },
    );
  }
}

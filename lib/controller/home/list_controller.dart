import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:prototype_sample/config/cache/todo_cache.dart';
import 'package:prototype_sample/config/hive_storage.dart';
import 'package:prototype_sample/config/hive_storage_data.dart';
import 'package:prototype_sample/config/service/todo/todo_network.dart';
import 'package:prototype_sample/model/todo/todo_data.dart';

class ListPageController extends GetxController {
  var todos = <Todo>[].obs;
  var todoBox;

  @override
  onInit() {
    super.onInit();
    getTodos();
  }

  void getTodos() async {
    TodoNetwork.getTodos().then((value) async {
      //   ! Percobaan 1, terpisah semua !//
      //   var box = await Hive.openBox('local_todos');
      //   box.put("data", value).then((_) {
      //   var local = box.get("data", defaultValue: []);
      //   todos = RxList.from(local ?? []);
      //   update();
      //   });

      //   ! Percobaan 2, untuk setingan hive di gabung, namun masig belum dynamic !//

        await TodoCache.put('data', value).then((value) async {
          List<Todo> local = await TodoCache.get("data", []);
          todos = RxList.from(local);
          update();
        });

      // ! Percobaan 3, untuk put dan get gagal untuk di buat secara global !//
      // ! Unhandled Exception: HiveError: You need to initialize Hive or provide a path to store the box. !//

      // await HiveStorage.put(
      //   todoBox,
      //   key: 'data',
      //   value: value,
      // ).then((value) async {
      //   List<Todo> local = await HiveStorage.get(
      //     todoBox,
      //     key: 'data',
      //     value: [],
      //   );
      //   todos = RxList.from(local);
      //   update();
      // });



    }).catchError((e) {
      debugPrint("$e");
    });
  }
}

// import 'package:hive/hive.dart';
// import 'package:prototype_sample/model/todo/todo_data.dart';

// class HiveStorageData {
//   static Future<Box> todoInstance() async {
//     if (!Hive.isAdapterRegistered(0)) {
//       Hive.registerAdapter<Todo>(TodoAdapter());
//     }
//     var i = Hive.openBox('todo');
//     if (Hive.isBoxOpen('todo')) {
//       return Hive.box('todo');
//     }
//     return i;
//   }
// }

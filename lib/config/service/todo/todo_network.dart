import 'package:dio/dio.dart';
import 'package:prototype_sample/config/setup.dart';
import 'package:prototype_sample/model/todo/todo_data.dart';

class TodoNetwork {
  static Future<List<Todo>> getTodos() async {
    var result = await getIt.get<Dio>().get("/todos");
    var data =
        (result.data as List<dynamic>).map((e) => Todo.fromJSON(e)).toList();
    return data;
  }
}


import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;
import 'package:prototype_sample/model/todo/todo_data.dart';

final GetIt getIt = GetIt.instance;

void setup() async {
  getIt.registerSingleton<Dio>(
    Dio(
      BaseOptions(
        baseUrl: 'https://jsonplaceholder.typicode.com',
        connectTimeout: 5000,
        receiveTimeout: 3000,
      ),
    ),
  );
}

void setupStorage() async {
  final appDocumentDir = await pathProvider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);

  // await Hive.initFlutter();
}

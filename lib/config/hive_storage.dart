import 'package:hive/hive.dart';

class HiveStorage {
  static Future<void> put(
    Future<Box> box, {
    String? key,
    dynamic value,
  }) async {
    var i = await box;
    return i.put(key, value);
  }

  static Future<dynamic> get(
    Future<Box> box, {
    String? key,
    dynamic value,
  }) async {
    var i = await box;
    return i.get(key, defaultValue: value);
  }
}

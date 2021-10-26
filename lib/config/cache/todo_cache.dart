import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:prototype_sample/model/todo/todo_data.dart';

const _name = "todo";

class TodoCache {
  static Future<Box> instance() async {
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter<Todo>(TodoAdapter());
    }
    var i = Hive.openBox(_name);
    if (Hive.isBoxOpen(_name)) {
      return Hive.box(_name);
    }
    return i;
  }

  static Future<void> put(String key, List<Todo> value) async {
    var i = await TodoCache.instance();
    return i.put(key, value);
  }

  static Future<dynamic> get(String key, dynamic defaultValue) async {
    var i = await TodoCache.instance();
    return i.get(key, defaultValue: defaultValue);
  }
}
